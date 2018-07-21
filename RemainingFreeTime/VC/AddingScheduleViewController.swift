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
        //스케쥴 이름이나 시간의 텍스트를 입력받지 않았을 때
        clearLabelColor()
        if scheduleNameTextField.text == "" || startingTimeLabel.text == "" || startingTimeLabel.text == ""{
            warningLabel.textColor = UIColor.red
        }
        //요일 선택을 하나도 하지 않았을 때
        else if dayInfo.todayIsMon == false && dayInfo.todayIsTue == false && dayInfo.todayIsWed == false && dayInfo.todayIsThu == false && dayInfo.todayIsFri == false && dayInfo.todayIsSat == false && dayInfo.todayIsSun == false{
            warningLabel.textColor = UIColor.red
        }
        // 일정 시간이 겹칠 때(아직 안함)
        else{
            dateFormatter.dateFormat = "HH:mm a"
            let startDate = dateFormatter.string(from: (startingDatePicker?.date)!)
            let finishDate = dateFormatter.string(from: (finishingDatePicker?.date)!)
            /*String을 Date로 바꾸기
            let startTimeDate : Date = dateFormatter.date(from: startDate)!
            let finishTimeDate : Date = dateFormatter.date(from: finishDate)!*/
            var scheduleDic = ["":""]
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
            scheduleInfoArray = scheduleModel.setScheduleDatafromUserDefaults()
            scheduleInfoArray.append(scheduleDic)
            scheduleModel.setScheduleDataIntoUserDefaults(scheduleArray: scheduleInfoArray)
            self.navigationController?.popViewController(animated: true)
        }
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
    func clearLabelColor(){
        warningLabel.textColor = UIColor.clear
    }
    func changeButtonBackgroundColor(button : UIButton){
        button.backgroundColor = UIColor(red: 1.00, green: 0.98, blue: 0.50, alpha: 0.9)
    }
}

