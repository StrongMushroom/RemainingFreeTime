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
    @IBOutlet weak var startingTimeHour: UITextField!
    @IBOutlet weak var startingTimeMinute: UITextField!
    @IBOutlet weak var finishingTimeHour: UITextField!
    @IBOutlet weak var finishingTimeMinute: UITextField!
    let dayInfo : DayInfoObject = DayInfoObject()
    let userScheduleInfo : ScheduleInfoObject = ScheduleInfoObject()
    let scheduleInfoModel : ScheduleInfoModel = ScheduleInfoModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleTimeMonBtn.backgroundColor = UIColor.clear
        scheduleTimeTueBtn.backgroundColor = UIColor.clear
        scheduleTimeWedBtn.backgroundColor = UIColor.clear
        scheduleTimeThuBtn.backgroundColor = UIColor.clear
        scheduleTimeFriBtn.backgroundColor = UIColor.clear
        scheduleTimeSatBtn.backgroundColor = UIColor.clear
        scheduleTimeSunBtn.backgroundColor = UIColor.clear
    }
    
    @IBAction func scheduleTimeMonBtn(_ sender: Any) {
        if scheduleTimeMonBtn.backgroundColor == UIColor.clear{
            scheduleTimeMonBtn.backgroundColor = UIColor.yellow
            dayInfo.todayIsMon = true
        }else{
            scheduleTimeMonBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsMon = false
        }
    }
    @IBAction func scheduleTimeTueBtn(_ sender: Any) {
        if scheduleTimeTueBtn.backgroundColor == UIColor.clear{
            scheduleTimeTueBtn.backgroundColor = UIColor.yellow
            dayInfo.todayIsTue = true
        }else{
            scheduleTimeTueBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsTue = false
        }
    }
    @IBAction func scheduleTimeWedBtn(_ sender: Any) {
        if scheduleTimeWedBtn.backgroundColor == UIColor.clear{
            scheduleTimeWedBtn.backgroundColor = UIColor.yellow
            dayInfo.todayIsWed = true
        }else{
            scheduleTimeWedBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsWed = false
        }
    }
    @IBAction func scheduleTimeThuBtn(_ sender: Any) {
        if scheduleTimeThuBtn.backgroundColor == UIColor.clear{
            scheduleTimeThuBtn.backgroundColor = UIColor.yellow
            dayInfo.todayIsThu = true
        }else{
            scheduleTimeThuBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsThu = false
        }
    }
    @IBAction func scheduleTimeFriBtn(_ sender: Any) {
        if scheduleTimeFriBtn.backgroundColor == UIColor.clear{
            scheduleTimeFriBtn.backgroundColor = UIColor.yellow
            dayInfo.todayIsFri = true
        }else{
            scheduleTimeFriBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsFri = false
        }
    }
    @IBAction func scheduleTimeSatBtn(_ sender: Any) {
        if scheduleTimeSatBtn.backgroundColor == UIColor.clear{
            scheduleTimeSatBtn.backgroundColor = UIColor.yellow
            dayInfo.todayIsSat = true
        }else{
            scheduleTimeSatBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsSat = false
        }
    }
    @IBAction func scheduleTimeSunBtn(_ sender: Any) {
        if scheduleTimeSunBtn.backgroundColor == UIColor.clear{
            scheduleTimeSunBtn.backgroundColor = UIColor.yellow
            dayInfo.todayIsSun = true
        }else{
            scheduleTimeSunBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsSun = false
        }
    }
    @IBAction func addingScheduleIsDone(_ sender: Any) {
        
        
        
        
        
        
        
        
        
        userScheduleInfo.scheduleName = scheduleNameTextField.text!
        userScheduleInfo.scheduleDay = dayInfo
        userScheduleInfo.startingTime.startingTimeHour = Int(startingTimeHour.text!)!
        userScheduleInfo.startingTime.startingTimeMinute = Int(startingTimeMinute.text!)!
        userScheduleInfo.finishingTime.finishingTimeHour = Int(finishingTimeHour.text!)!
        userScheduleInfo.finishingTime.finishingTimeMinute = Int(finishingTimeMinute.text!)!
        scheduleInfoModel.scheduleInfoArray.append(userScheduleInfo)
        self.navigationController?.popViewController(animated: true)
    }
    
}
