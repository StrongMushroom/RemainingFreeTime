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
        ScheduleTimeDayChange().scheduleTimeMonChange(button: scheduleTimeMonBtn, dayBool: dayInfo)
    }
    @IBAction func scheduleTimeTueBtn(_ sender: Any) {
        ScheduleTimeDayChange().scheduleTimeTueChange(button: scheduleTimeTueBtn, dayBool: dayInfo)
    }
    @IBAction func scheduleTimeWedBtn(_ sender: Any) {
        ScheduleTimeDayChange().scheduleTimeTueChange(button: scheduleTimeWedBtn, dayBool: dayInfo)
    }
    @IBAction func scheduleTimeThuBtn(_ sender: Any) {
        ScheduleTimeDayChange().scheduleTimeTueChange(button: scheduleTimeThuBtn, dayBool: dayInfo)
    }
    @IBAction func scheduleTimeFriBtn(_ sender: Any) {
        ScheduleTimeDayChange().scheduleTimeTueChange(button: scheduleTimeFriBtn, dayBool: dayInfo)
    }
    @IBAction func scheduleTimeSatBtn(_ sender: Any) {
        ScheduleTimeDayChange().scheduleTimeTueChange(button: scheduleTimeSatBtn, dayBool: dayInfo)
    }
    @IBAction func scheduleTimeSunBtn(_ sender: Any) {
        ScheduleTimeDayChange().scheduleTimeTueChange(button: scheduleTimeSunBtn, dayBool: dayInfo)
    }
    
    
    @IBAction func addingScheduleIsDone(_ sender: Any) {
        userScheduleInfo.scheduleName = scheduleNameTextField.text!
        userScheduleInfo.scheduleDay = dayInfo
        userScheduleInfo.startingTime.startingTimeHour = Int(startingTimeHour.text!)!
        userScheduleInfo.startingTime.startingTimeMinute = Int(startingTimeMinute.text!)!
        userScheduleInfo.finishingTime.finishingTimeHour = Int(finishingTimeHour.text!)!
        userScheduleInfo.finishingTime.finishingTimeMinute = Int(finishingTimeMinute.text!)!
        ScheduleInfoModel.init().scheduleInfoArray.append(userScheduleInfo)
    }
    
}
