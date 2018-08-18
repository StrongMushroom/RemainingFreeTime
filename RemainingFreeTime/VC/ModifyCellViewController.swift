//
//  ModifyCellViewController.swift
//  RemainingFreeTime
//
//  Created by 상일여고일 on 2018. 7. 27..
//  Copyright © 2018년 victory. All rights reserved.
//

import UIKit

class ModifyCellViewController: UIViewController {
    @IBOutlet weak var scheduleNameTextField: UITextField!
    @IBOutlet weak var mondayBtn: UIButton!
    @IBOutlet weak var tuesdayBtn: UIButton!
    @IBOutlet weak var wednesdayBtn: UIButton!
    @IBOutlet weak var thursdayBtn: UIButton!
    @IBOutlet weak var fridayBtn: UIButton!
    @IBOutlet weak var saturdayBtn: UIButton!
    @IBOutlet weak var sundayBtn: UIButton!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var finishTimeTextField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    let dayInfo : DayInfoObject = DayInfoObject()
    var scheduleModel = ScheduleInfoModel()
    var scheduleInfoArray : Array<[String:String]> = []
    let dateFormatter = DateFormatter()
    var startingDatePicker : UIDatePicker?
    var finishingDatePicker : UIDatePicker?
    var btnArray : Array<UIButton> = []
    var scheduleName = ""
    var startTime = ""
    var finishTime = ""
    var cellNum = 0
    var monBtn = false
    var tueBtn = false
    var wedBtn = false
    var thuBtn = false
    var friBtn = false
    var satBtn = false
    var sunBtn = false
    var arrayNum = 0
    override func viewDidLoad(){
        super.viewDidLoad()
        let rightDoneBarButtonItem:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(ModifyCellViewController.doneTapped))
        let leftCancelBarButtonItem:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(ModifyCellViewController.cancelTapped))
        self.navigationItem.setRightBarButtonItems([rightDoneBarButtonItem], animated: true)
        self.navigationItem.setLeftBarButtonItems([leftCancelBarButtonItem], animated: true)
        startingDatePicker = UIDatePicker()
        finishingDatePicker = UIDatePicker()
        startingDatePicker?.datePickerMode = .time
        finishingDatePicker?.datePickerMode = .time
        startingDatePicker?.addTarget(self, action: #selector(AddingScheduleViewController.startDateChanged(datePicker:)), for: .valueChanged)
        finishingDatePicker?.addTarget(self, action: #selector(AddingScheduleViewController.finishDateChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddingScheduleViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        startTimeTextField.inputView = startingDatePicker
        finishTimeTextField.inputView = finishingDatePicker
        btnArray.append(mondayBtn)
        btnArray.append(tuesdayBtn)
        btnArray.append(wednesdayBtn)
        btnArray.append(thursdayBtn)
        btnArray.append(fridayBtn)
        btnArray.append(saturdayBtn)
        btnArray.append(sundayBtn)
        for btn in btnArray {
            btn.backgroundColor = UIColor.clear
        }
        clearLabelColor()
        for btn in btnArray {
            btn.layer.cornerRadius = 0.5 * btn.bounds.size.width
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        scheduleInfoArray = scheduleModel.setScheduleDatafromUserDefaults()
        arrayNum = scheduleInfoArray.count
        scheduleNameTextField.text = scheduleName
        startTimeTextField.text = startTime
        finishTimeTextField.text = finishTime
        dayInfo.todayIsMon = monBtn
        dayInfo.todayIsTue = tueBtn
        dayInfo.todayIsWed = wedBtn
        dayInfo.todayIsThu = thuBtn
        dayInfo.todayIsFri = friBtn
        dayInfo.todayIsSat = satBtn
        dayInfo.todayIsSun = sunBtn
        if dayInfo.todayIsMon == true {
            changeButtonBackgroundColor(button: mondayBtn)
        }
        if dayInfo.todayIsTue == true {
            changeButtonBackgroundColor(button: tuesdayBtn)
        }
        if dayInfo.todayIsWed == true {
            changeButtonBackgroundColor(button: wednesdayBtn)
        }
        if dayInfo.todayIsThu == true {
            changeButtonBackgroundColor(button: thursdayBtn)
        }
        if dayInfo.todayIsFri == true {
            changeButtonBackgroundColor(button: fridayBtn)
        }
        if dayInfo.todayIsSat == true {
            changeButtonBackgroundColor(button: saturdayBtn)
        }
        if dayInfo.todayIsSun == true {
            changeButtonBackgroundColor(button: sundayBtn)
        }
    }
    @IBAction func monBtn(_ sender: Any) {
        if mondayBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: mondayBtn)
            dayInfo.todayIsMon = true
        }else{
            mondayBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsMon = false
        }
    }
    @IBAction func tueBtn(_ sender: Any) {
        if tuesdayBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: tuesdayBtn)
            dayInfo.todayIsTue = true
        }else{
            tuesdayBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsTue = false
        }
    }
    @IBAction func wedBtn(_ sender: Any) {
        if wednesdayBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: wednesdayBtn)
            dayInfo.todayIsWed = true
        }else{
            wednesdayBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsWed = false
        }
    }
    @IBAction func thuBtn(_ sender: Any) {
        if thursdayBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: thursdayBtn)
            dayInfo.todayIsThu = true
        }else{
            thursdayBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsThu = false
        }
    }
    @IBAction func friBtn(_ sender: Any) {
        if fridayBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: fridayBtn)
            dayInfo.todayIsFri = true
        }else{
            fridayBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsFri = false
        }
    }
    @IBAction func satBTn(_ sender: Any) {
        if saturdayBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: saturdayBtn)
            dayInfo.todayIsSat = true
        }else{
            saturdayBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsSat = false
        }
    }
    @IBAction func sunBtn(_ sender: Any) {
        if sundayBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: sundayBtn)
            dayInfo.todayIsSun = true
        }else{
            sundayBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsSun = false
        }
    }
    @objc func startDateChanged(datePicker : UIDatePicker){
        dateFormatter.dateFormat = "HH:mm"
        startTimeTextField.text = dateFormatter.string(from: datePicker.date)
    }
    @objc func finishDateChanged(datePicker : UIDatePicker){
        dateFormatter.dateFormat = "HH:mm"
        finishTimeTextField.text = dateFormatter.string(from: datePicker.date)
    }
    @objc func viewTapped(gestureRecognizer : UITapGestureRecognizer){
        view.endEditing(true)
    }
    func clearLabelColor(){
        warningLabel.textColor = UIColor.clear
    }
    func changeButtonBackgroundColor(button : UIButton){
        button.backgroundColor = UIColor(red: 0.91, green: 0.78, blue: 0.54, alpha: 0.9)
    }
    //완료버
    @objc func doneTapped(sender:UIButton) {
        clearLabelColor()
        if scheduleNameTextField.text == ""{
            NSLog("\(String(describing: scheduleNameTextField.text))")
            NSLog("일정 이름 입력을 안했어")
            warningLabel.textColor = UIColor.red
        }
        else if dayInfo.todayIsMon == false && dayInfo.todayIsTue == false && dayInfo.todayIsWed == false && dayInfo.todayIsThu == false && dayInfo.todayIsFri == false && dayInfo.todayIsSat == false && dayInfo.todayIsSun == false{
             NSLog("요일체크안함")
            warningLabel.textColor = UIColor.red
        }else{
        dateFormatter.dateFormat = "HH:mm"
        
        let startDate = startTimeTextField.text!
        let finishDate = finishTimeTextField.text!
        
        scheduleInfoArray[cellNum]["name"] = scheduleNameTextField.text!
        scheduleInfoArray[cellNum]["monday"] = String(dayInfo.todayIsMon)
        scheduleInfoArray[cellNum]["tuesday"] = String(dayInfo.todayIsTue)
        scheduleInfoArray[cellNum]["wednesday"] = String(dayInfo.todayIsWed)
        scheduleInfoArray[cellNum]["thursday"] = String(dayInfo.todayIsThu)
        scheduleInfoArray[cellNum]["friday"] = String(dayInfo.todayIsFri)
        scheduleInfoArray[cellNum]["saturday"] = String(dayInfo.todayIsSat)
        scheduleInfoArray[cellNum]["sunday"] = String(dayInfo.todayIsSun)
        scheduleInfoArray[cellNum]["startTime"] = startDate
        scheduleInfoArray[cellNum]["finishTime"] = finishDate
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
        }
        
    }
    @objc func cancelTapped (sender:UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
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
                NSLog("일정 수요일 아님!!!!!")
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
    func compareTime(array : Array<Array<Int>>) -> Bool{
        var string = ""
        var stringArray : [String] = []
        var checkBool = true
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
}
