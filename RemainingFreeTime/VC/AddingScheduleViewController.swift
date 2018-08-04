//
//  AddingScheduleViewController.swift
//  RemainingFreeTime
//
//  Created by 상일여고일 on 2018. 6. 12..
//  Copyright © 2018년 victory. All rights reserved.
//

import UIKit

class AddingScheduleViewController: UIViewController {
    @IBOutlet weak var scheduleNameTextField: UITextField!
    @IBOutlet weak var scheduleTimeMonBtn: UIButton!
    @IBOutlet weak var scheduleTimeTueBtn: UIButton!
    @IBOutlet weak var scheduleTimeWedBtn: UIButton!
    @IBOutlet weak var scheduleTimeThuBtn: UIButton!
    @IBOutlet weak var scheduleTimeFriBtn: UIButton!
    @IBOutlet weak var scheduleTimeSatBtn: UIButton!
    @IBOutlet weak var scheduleTimeSunBtn: UIButton!
    @IBOutlet weak var startingTimeLabel: UITextField!
    @IBOutlet weak var finishingTimeLabel: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    let dayInfo : DayInfoObject = DayInfoObject()
    var scheduleModel = ScheduleInfoModel()
    var scheduleInfoArray : Array<[String:String]> = []
    let dateFormatter = DateFormatter()
    var startingDatePicker : UIDatePicker?
    var finishingDatePicker : UIDatePicker?
    var btnArray : Array<UIButton> = []
    var arrayNum = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        startingDatePicker = UIDatePicker()
        finishingDatePicker = UIDatePicker()
        startingDatePicker?.datePickerMode = .time
        finishingDatePicker?.datePickerMode = .time
        startingDatePicker?.addTarget(self, action: #selector(AddingScheduleViewController.startDateChanged(datePicker:)), for: .valueChanged)
        finishingDatePicker?.addTarget(self, action: #selector(AddingScheduleViewController.finishDateChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddingScheduleViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        startingTimeLabel.inputView = startingDatePicker
        finishingTimeLabel.inputView = finishingDatePicker
        btnArray.append(scheduleTimeMonBtn)
        btnArray.append(scheduleTimeTueBtn)
        btnArray.append(scheduleTimeWedBtn)
        btnArray.append(scheduleTimeThuBtn)
        btnArray.append(scheduleTimeFriBtn)
        btnArray.append(scheduleTimeSatBtn)
        btnArray.append(scheduleTimeSunBtn)
        for btn in btnArray {
            btn.backgroundColor = UIColor.clear
        }
        clearLabelColor()
        //view로 꺼내야 하는 것 같은데 어떻게 하는건지 잘 모르겠다
        for btn in btnArray {
            btn.layer.cornerRadius = 0.5 * btn.bounds.size.width
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        scheduleInfoArray = scheduleModel.setScheduleDatafromUserDefaults()
         NSLog("스케쥴인포어레이에 스케쥴모델정보넣었어")
        arrayNum = scheduleInfoArray.count
    }
    @IBAction func scheduleTimeMonBtn(_ sender: Any) {
        if scheduleTimeMonBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: scheduleTimeMonBtn)
            dayInfo.todayIsMon = true
        }else{
            scheduleTimeMonBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsMon = false
        }
    }
    @IBAction func scheduleTimeTueBtn(_ sender: Any) {
        if scheduleTimeTueBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: scheduleTimeTueBtn)
            dayInfo.todayIsTue = true
        }else{
            scheduleTimeTueBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsTue = false
        }
    }
    @IBAction func scheduleTimeWedBtn(_ sender: Any) {
        if scheduleTimeWedBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: scheduleTimeWedBtn)
            dayInfo.todayIsWed = true
        }else{
            scheduleTimeWedBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsWed = false
        }
    }
    @IBAction func scheduleTimeThuBtn(_ sender: Any) {
        if scheduleTimeThuBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: scheduleTimeThuBtn)
            dayInfo.todayIsThu = true
        }else{
            scheduleTimeThuBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsThu = false
        }
    }
    @IBAction func scheduleTimeFriBtn(_ sender: Any) {
        if scheduleTimeFriBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: scheduleTimeFriBtn)
            dayInfo.todayIsFri = true
        }else{
            scheduleTimeFriBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsFri = false
        }
    }
    @IBAction func scheduleTimeSatBtn(_ sender: Any) {
        if scheduleTimeSatBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: scheduleTimeSatBtn)
            dayInfo.todayIsSat = true
        }else{
            scheduleTimeSatBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsSat = false
        }
    }
    @IBAction func scheduleTimeSunBtn(_ sender: Any) {
        if scheduleTimeSunBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: scheduleTimeSunBtn)
            dayInfo.todayIsSun = true
        }else{
            scheduleTimeSunBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsSun = false
        }
    }
    //조건에 맞게 동시에 실행될 수 있는 코드는 없을까?
    @IBAction func addingScheduleIsDone(_ sender: Any) {
        clearLabelColor()
        //스케쥴 이름이나 시간의 텍스트를 입력받지 않았을 때
        if scheduleNameTextField.text == "" || startingTimeLabel.text == "" || finishingTimeLabel.text == ""{
            warningLabel.textColor = UIColor.red
        }
            //요일 선택을 하나도 하지 않았을 때
        else if dayInfo.todayIsMon == false && dayInfo.todayIsTue == false && dayInfo.todayIsWed == false && dayInfo.todayIsThu == false && dayInfo.todayIsFri == false && dayInfo.todayIsSat == false && dayInfo.todayIsSun == false{
            warningLabel.textColor = UIColor.red
        }
        else{
            NSLog("1차 통과")
            dateFormatter.dateFormat = "HH:mm"
            let startDate = dateFormatter.string(from: (startingDatePicker?.date)!)
            let finishDate = dateFormatter.string(from: (finishingDatePicker?.date)!)
            var scheduleDic = ["":""]
            if scheduleInfoArray.count == arrayNum {
                NSLog("2차 통과")
                scheduleDic["name"] = scheduleNameTextField.text!
                scheduleDic["monday"] = String(dayInfo.todayIsMon)
                scheduleDic["tuesday"] = String(dayInfo.todayIsTue)
                scheduleDic["wednesday"] = String(dayInfo.todayIsWed)
                scheduleDic["thursday"] = String(dayInfo.todayIsThu)
                scheduleDic["friday"] = String(dayInfo.todayIsFri)
                scheduleDic["saturday"] = String(dayInfo.todayIsSat)
                scheduleDic["sunday"] = String(dayInfo.todayIsSun)
                scheduleDic["startTime"] = startDate
                scheduleDic["finishTime"] = finishDate
                scheduleInfoArray.append(scheduleDic)
                NSLog("스케쥴인포어레이에 스케쥴딕셔너리 넣었어")
                if compareTime(array: sortScheduleTime(weekday : "monday", scheduleArray : scheduleInfoArray)) == false{
                    warningLabel.textColor = UIColor.red
                    NSLog("1")
                }else if compareTime(array: sortScheduleTime(weekday : "tuesday", scheduleArray : scheduleInfoArray)) == false{
                    warningLabel.textColor = UIColor.red
                    NSLog("2")
                }else if compareTime(array: sortScheduleTime(weekday : "wednesday", scheduleArray : scheduleInfoArray)) == false{
                    warningLabel.textColor = UIColor.red
                    NSLog("3")
                }else if compareTime(array: sortScheduleTime(weekday : "thursday", scheduleArray : scheduleInfoArray)) == false{
                    warningLabel.textColor = UIColor.red
                    NSLog("4")
                }else if compareTime(array: sortScheduleTime(weekday : "friday", scheduleArray : scheduleInfoArray)) == false{
                    warningLabel.textColor = UIColor.red
                    NSLog("5")
                }else if compareTime(array: sortScheduleTime(weekday : "saturday", scheduleArray : scheduleInfoArray)) == false{
                    warningLabel.textColor = UIColor.red
                    NSLog("6")
                }else if compareTime(array: sortScheduleTime(weekday : "sunday", scheduleArray : scheduleInfoArray)) == false{
                    warningLabel.textColor = UIColor.red
                    NSLog("7")
                }else{
                    scheduleModel.setScheduleDataIntoUserDefaults(scheduleArray: scheduleInfoArray)
                    self.navigationController?.popViewController(animated: true)
                }
            }else{
                NSLog("한번 실수햇으면 여기로 와")
                scheduleInfoArray[scheduleInfoArray.count-1]["name"] = scheduleNameTextField.text!
                scheduleInfoArray[scheduleInfoArray.count-1]["monday"] = String(dayInfo.todayIsMon)
                scheduleInfoArray[scheduleInfoArray.count-1]["tuesday"] = String(dayInfo.todayIsTue)
                scheduleInfoArray[scheduleInfoArray.count-1]["wednesday"] = String(dayInfo.todayIsWed)
                scheduleInfoArray[scheduleInfoArray.count-1]["thursday"] = String(dayInfo.todayIsThu)
                scheduleInfoArray[scheduleInfoArray.count-1]["friday"] = String(dayInfo.todayIsFri)
                scheduleInfoArray[scheduleInfoArray.count-1]["saturday"] = String(dayInfo.todayIsSat)
                scheduleInfoArray[scheduleInfoArray.count-1]["sunday"] = String(dayInfo.todayIsSun)
                scheduleInfoArray[scheduleInfoArray.count-1]["startTime"] = startDate
                scheduleInfoArray[scheduleInfoArray.count-1]["finishTime"] = finishDate
                NSLog("마지막정보를 다 바꿨어")
                if compareTime(array: sortScheduleTime(weekday : "monday", scheduleArray : scheduleInfoArray)) == false{
                    NSLog("월요일시간비교했더니 잘못입력했대")
                    warningLabel.textColor = UIColor.red
                    NSLog("8")
                }else if compareTime(array: sortScheduleTime(weekday : "tuesday", scheduleArray : scheduleInfoArray)) == false{
                    warningLabel.textColor = UIColor.red
                    NSLog("9")
                }else if compareTime(array: sortScheduleTime(weekday : "wednesday", scheduleArray : scheduleInfoArray)) == false{
                    warningLabel.textColor = UIColor.red
                    NSLog("10")
                }else if compareTime(array: sortScheduleTime(weekday : "thursday", scheduleArray : scheduleInfoArray)) == false{
                    warningLabel.textColor = UIColor.red
                    NSLog("11")
                }else if compareTime(array: sortScheduleTime(weekday : "friday", scheduleArray : scheduleInfoArray)) == false{
                    warningLabel.textColor = UIColor.red
                    NSLog("12")
                }else if compareTime(array: sortScheduleTime(weekday : "saturday", scheduleArray : scheduleInfoArray)) == false{
                    warningLabel.textColor = UIColor.red
                    NSLog("13")
                }else if compareTime(array: sortScheduleTime(weekday : "sunday", scheduleArray : scheduleInfoArray)) == false{
                    warningLabel.textColor = UIColor.red
                    NSLog("14")
                }else{
                    scheduleModel.setScheduleDataIntoUserDefaults(scheduleArray: scheduleInfoArray)
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    @IBAction func touchedCancelBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func startDateChanged(datePicker : UIDatePicker){
        dateFormatter.dateFormat = "HH:mm"
        startingTimeLabel.text = dateFormatter.string(from: datePicker.date)
    }
    @objc func finishDateChanged(datePicker : UIDatePicker){
        dateFormatter.dateFormat = "HH:mm"
        finishingTimeLabel.text = dateFormatter.string(from: datePicker.date)
    }
    @objc func viewTapped(gestureRecognizer : UITapGestureRecognizer){
        view.endEditing(true)
    }
    func changeButtonBackgroundColor(button : UIButton){
        button.backgroundColor = UIColor(red: 0.91, green: 0.78, blue: 0.54, alpha: 0.9)
        
    }
    //시간 비교하는 함수
    func compareTime(array : Array<Array<Int>>) -> Bool{
        var string = ""
        var stringArray : [String] = []
        var checkBool = true
        //일정수로!
        if array.count == 0 || array.count == 1 {
            NSLog("일정이 0개거나 1개")
        }else {
            NSLog("일정이 2개 이상")
            for x in 0..<array.count-1{
                if array[x][1] <= array[x+1][0]{
                    string = "O"
                    stringArray.append(string)
                }else{
                    string = "X"
                    stringArray.append(string)
                }
            }
            for y in stringArray {
                if y == "X"{
                    checkBool = false
                }
            }
        }
        //각 일정으로!
        for z in array {
            if z[0] >= z[1]{
                checkBool = false
            }
        }
        return checkBool
    }
    // 스케쥴인포어레이를 불러온다. 스케쥴어레이인포어레이를 다른 새로운 변수에 만든다. 월요일의 시작시간을 불러온다. 시작시간 순서대로 정렬한다. 그 순서대로 끝나는 순서를 정리한다. 일정의 끝나는 시간과 다음 일정의 시작시간을 비교한다.
    func sortScheduleTime(weekday : String, scheduleArray : Array<[String:String]>) -> Array<Array<Int>>{
        var scheduleTimeArray : Array<Array<Int>> = []
        var scheduleTime : Array<Int> = []
        if weekday == "monday" {
             NSLog("월요일 체크해보자")
            for x in scheduleArray {
                if Bool(x["monday"]!)! == true{
                    scheduleTime.removeAll()
                    scheduleTime.append(Int((x["startTime"]!.components(separatedBy: ":"))[0])!*3600 + Int((x["startTime"]!.components(separatedBy: ":"))[1])!*60)
                    scheduleTime.append(Int((x["finishTime"]!.components(separatedBy: ":"))[0])!*3600 + Int((x["finishTime"]!.components(separatedBy: ":"))[1])!*60)
                    scheduleTimeArray.append(scheduleTime)
                }
            }
        }
        if weekday == "tuesday" {
            NSLog("화요일 체크해보자")
            for x in scheduleArray {
                if Bool(x["tuesday"]!)! == true{
                     NSLog("스켈쥴인포어레이안에있는거화요일불값이 트루다")
                    scheduleTime.removeAll()
                    scheduleTime.append(Int((x["startTime"]!.components(separatedBy: ":"))[0])!*3600 + Int((x["startTime"]!.components(separatedBy: ":"))[1])!*60)
                     NSLog("그것의 시작시간을 초로구해서 스케쥴 타임에 넣음")
                    scheduleTime.append(Int((x["finishTime"]!.components(separatedBy: ":"))[0])!*3600 + Int((x["finishTime"]!.components(separatedBy: ":"))[1])!*60)
                    NSLog("그것의 끝시간을 초로구해서 스케쥴 타임에 넣음")
                    scheduleTimeArray.append(scheduleTime)
                    NSLog("스케쥴타임을 스케쥴타임어레이에 넣음")
                }
                NSLog("일정 화오ㅛ일 아님")
            }
        }
        if weekday == "wednesday" {
            NSLog("수요일 체크해보자")
            for x in scheduleArray {
                if Bool(x["wednesday"]!)! == true{
                    scheduleTime.removeAll()
                    scheduleTime.append(Int((x["startTime"]!.components(separatedBy: ":"))[0])!*3600 + Int((x["startTime"]!.components(separatedBy: ":"))[1])!*60)
                    scheduleTime.append(Int((x["finishTime"]!.components(separatedBy: ":"))[0])!*3600 + Int((x["finishTime"]!.components(separatedBy: ":"))[1])!*60)
                    scheduleTimeArray.append(scheduleTime)
                }
            }
        }
        if weekday == "thursday" {
            NSLog("목요일 체크해보자")
            for x in scheduleArray {
                if Bool(x["thursday"]!)! == true{
                    scheduleTime.removeAll()
                    scheduleTime.append(Int((x["startTime"]!.components(separatedBy: ":"))[0])!*3600 + Int((x["startTime"]!.components(separatedBy: ":"))[1])!*60)
                    scheduleTime.append(Int((x["finishTime"]!.components(separatedBy: ":"))[0])!*3600 + Int((x["finishTime"]!.components(separatedBy: ":"))[1])!*60)
                    scheduleTimeArray.append(scheduleTime)
                }
            }
        }
        if weekday == "friday" {
            NSLog("금요일 체크해보자")
            for x in scheduleArray {
                if Bool(x["friday"]!)! == true{
                    scheduleTime.removeAll()
                    scheduleTime.append(Int((x["startTime"]!.components(separatedBy: ":"))[0])!*3600 + Int((x["startTime"]!.components(separatedBy: ":"))[1])!*60)
                    scheduleTime.append(Int((x["finishTime"]!.components(separatedBy: ":"))[0])!*3600 + Int((x["finishTime"]!.components(separatedBy: ":"))[1])!*60)
                    scheduleTimeArray.append(scheduleTime)
                }
            }
        }
        if weekday == "saturday" {
            NSLog("토요일 체크해보자")
            for x in scheduleArray {
                if Bool(x["saturday"]!)! == true{
                    scheduleTime.removeAll()
                    scheduleTime.append(Int((x["startTime"]!.components(separatedBy: ":"))[0])!*3600 + Int((x["startTime"]!.components(separatedBy: ":"))[1])!*60)
                    scheduleTime.append(Int((x["finishTime"]!.components(separatedBy: ":"))[0])!*3600 + Int((x["finishTime"]!.components(separatedBy: ":"))[1])!*60)
                    scheduleTimeArray.append(scheduleTime)
                }
            }
        }
        if weekday == "sunday" {
            NSLog("일요일 체크해보자")
            for x in scheduleArray {
                if Bool(x["sunday"]!)! == true{
                    scheduleTime.removeAll()
                    scheduleTime.append(Int((x["startTime"]!.components(separatedBy: ":"))[0])!*3600 + Int((x["startTime"]!.components(separatedBy: ":"))[1])!*60)
                    scheduleTime.append(Int((x["finishTime"]!.components(separatedBy: ":"))[0])!*3600 + Int((x["finishTime"]!.components(separatedBy: ":"))[1])!*60)
                    scheduleTimeArray.append(scheduleTime)
                }
            }
        }
        NSLog("배열전\(scheduleTimeArray)")
        scheduleTimeArray.sort(by: {$0[0] < $1[0]})
        NSLog("배열후\(scheduleTimeArray)")
        return scheduleTimeArray
    }
    func clearLabelColor(){
        warningLabel.textColor = UIColor.clear
    }
}

