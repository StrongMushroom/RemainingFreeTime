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
    var monBtn = false
    var tueBtn = false
    var wedBtn = false
    var thuBtn = false
    var friBtn = false
    var satBtn = false
    var sunBtn = false
    override func viewDidLoad(){
        super.viewDidLoad()
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
        if dayInfo.todayIsMon == true {
            changeButtonBackgroundColor(button: mondayBtn)
        }
        if dayInfo.todayIsMon == true {
            changeButtonBackgroundColor(button: mondayBtn)
        }
        if dayInfo.todayIsMon == true {
            changeButtonBackgroundColor(button: mondayBtn)
        }
        if dayInfo.todayIsMon == true {
            changeButtonBackgroundColor(button: mondayBtn)
        }
        if dayInfo.todayIsMon == true {
            changeButtonBackgroundColor(button: mondayBtn)
        }
        if dayInfo.todayIsMon == true {
            changeButtonBackgroundColor(button: mondayBtn)
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
            dayInfo.todayIsMon = true
        }else{
            tuesdayBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsMon = false
        }
    }
    @IBAction func wedBtn(_ sender: Any) {
        if wednesdayBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: wednesdayBtn)
            dayInfo.todayIsMon = true
        }else{
            wednesdayBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsMon = false
        }
    }
    @IBAction func thuBtn(_ sender: Any) {
        if thursdayBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: thursdayBtn)
            dayInfo.todayIsMon = true
        }else{
            thursdayBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsMon = false
        }
    }
    @IBAction func friBtn(_ sender: Any) {
        if fridayBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: fridayBtn)
            dayInfo.todayIsMon = true
        }else{
            fridayBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsMon = false
        }
    }
    @IBAction func satBTn(_ sender: Any) {
        if saturdayBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: saturdayBtn)
            dayInfo.todayIsMon = true
        }else{
            saturdayBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsMon = false
        }
    }
    @IBAction func sunBtn(_ sender: Any) {
        if sundayBtn.backgroundColor == UIColor.clear{
            changeButtonBackgroundColor(button: sundayBtn)
            dayInfo.todayIsMon = true
        }else{
            sundayBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsMon = false
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
        button.backgroundColor = UIColor(red: 1.00, green: 0.98, blue: 0.50, alpha: 0.9)
    }
    
}
