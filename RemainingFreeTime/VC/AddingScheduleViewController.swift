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
    @IBOutlet weak var warningLabel: UILabel!
    let dayInfo : DayInfoObject = DayInfoObject()
    let userScheduleInfo : ScheduleInfoObject = ScheduleInfoObject()
    let scheduleInfoModel : ScheduleInfoModel = ScheduleInfoModel()
    //왜 두 번 초기화 하는 것 같냐
    var scheduleInfoArray = ScheduleInfoModel.init().scheduleInfoArray
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleTimeMonBtn.backgroundColor = UIColor.clear
        scheduleTimeTueBtn.backgroundColor = UIColor.clear
        scheduleTimeWedBtn.backgroundColor = UIColor.clear
        scheduleTimeThuBtn.backgroundColor = UIColor.clear
        scheduleTimeFriBtn.backgroundColor = UIColor.clear
        scheduleTimeSatBtn.backgroundColor = UIColor.clear
        scheduleTimeSunBtn.backgroundColor = UIColor.clear
        warningLabel.textColor = UIColor.clear
        //view로 꺼내야 하는 것 같은데 어떻게 하는건지 잘 모르겠다
        scheduleTimeMonBtn.layer.cornerRadius = 0.5 * scheduleTimeMonBtn.bounds.size.width
        scheduleTimeTueBtn.layer.cornerRadius = 0.5 * scheduleTimeTueBtn.bounds.size.width
        scheduleTimeWedBtn.layer.cornerRadius = 0.5 * scheduleTimeWedBtn.bounds.size.width
        scheduleTimeThuBtn.layer.cornerRadius = 0.5 * scheduleTimeThuBtn.bounds.size.width
        scheduleTimeFriBtn.layer.cornerRadius = 0.5 * scheduleTimeFriBtn.bounds.size.width
        scheduleTimeSatBtn.layer.cornerRadius = 0.5 * scheduleTimeSatBtn.bounds.size.width
        scheduleTimeSunBtn.layer.cornerRadius = 0.5 * scheduleTimeSunBtn.bounds.size.width
    }
    @IBAction func scheduleTimeMonBtn(_ sender: Any) {
        if scheduleTimeMonBtn.backgroundColor == UIColor.clear{
            scheduleTimeMonBtn.backgroundColor = UIColor(red: 1.00, green: 0.98, blue: 0.50, alpha: 0.9)
            dayInfo.todayIsMon = true
        }else{
            scheduleTimeMonBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsMon = false
        }
    }
    @IBAction func scheduleTimeTueBtn(_ sender: Any) {
        if scheduleTimeTueBtn.backgroundColor == UIColor.clear{
            scheduleTimeTueBtn.backgroundColor = UIColor(red: 1.00, green: 0.98, blue: 0.50, alpha: 0.9)
            dayInfo.todayIsTue = true
        }else{
            scheduleTimeTueBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsTue = false
        }
    }
    @IBAction func scheduleTimeWedBtn(_ sender: Any) {
        if scheduleTimeWedBtn.backgroundColor == UIColor.clear{
            scheduleTimeWedBtn.backgroundColor = UIColor(red: 1.00, green: 0.98, blue: 0.50, alpha: 0.9)
            dayInfo.todayIsWed = true
        }else{
            scheduleTimeWedBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsWed = false
        }
    }
    @IBAction func scheduleTimeThuBtn(_ sender: Any) {
        if scheduleTimeThuBtn.backgroundColor == UIColor.clear{
            scheduleTimeThuBtn.backgroundColor = UIColor(red: 1.00, green: 0.98, blue: 0.50, alpha: 0.9)
            dayInfo.todayIsThu = true
        }else{
            scheduleTimeThuBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsThu = false
        }
    }
    @IBAction func scheduleTimeFriBtn(_ sender: Any) {
        if scheduleTimeFriBtn.backgroundColor == UIColor.clear{
            scheduleTimeFriBtn.backgroundColor = UIColor(red: 1.00, green: 0.98, blue: 0.50, alpha: 0.9)
            dayInfo.todayIsFri = true
        }else{
            scheduleTimeFriBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsFri = false
        }
    }
    @IBAction func scheduleTimeSatBtn(_ sender: Any) {
        if scheduleTimeSatBtn.backgroundColor == UIColor.clear{
            scheduleTimeSatBtn.backgroundColor = UIColor(red: 1.00, green: 0.98, blue: 0.50, alpha: 0.9)
            dayInfo.todayIsSat = true
        }else{
            scheduleTimeSatBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsSat = false
        }
    }
    @IBAction func scheduleTimeSunBtn(_ sender: Any) {
        if scheduleTimeSunBtn.backgroundColor == UIColor.clear{
            scheduleTimeSunBtn.backgroundColor = UIColor(red: 1.00, green: 0.98, blue: 0.50, alpha: 0.9)
            dayInfo.todayIsSun = true
        }else{
            scheduleTimeSunBtn.backgroundColor = UIColor.clear
            dayInfo.todayIsSun = false
        }
    }
    //숫자입력칸에 문자넣었을 때. 일정 시간이 겹칠 때
    @IBAction func addingScheduleIsDone(_ sender: Any) {
        if scheduleNameTextField.text == "" || startingTimeHour.text == "" || startingTimeMinute.text == "" || finishingTimeHour.text == "" || finishingTimeMinute.text == ""{
            warningLabel.textColor = UIColor.red
        }else if dayInfo.todayIsMon == false && dayInfo.todayIsTue == false && dayInfo.todayIsWed == false && dayInfo.todayIsThu == false && dayInfo.todayIsFri == false && dayInfo.todayIsSat == false && dayInfo.todayIsSun == false{
            warningLabel.textColor = UIColor.red
        }else{
            userScheduleInfo.scheduleName = scheduleNameTextField.text!
            userScheduleInfo.scheduleDay = dayInfo
            userScheduleInfo.startingTime.startingTimeHour = Int(startingTimeHour.text!)!
            userScheduleInfo.startingTime.startingTimeMinute = Int(startingTimeMinute.text!)!
            userScheduleInfo.finishingTime.finishingTimeHour = Int(finishingTimeHour.text!)!
            userScheduleInfo.finishingTime.finishingTimeMinute = Int(finishingTimeMinute.text!)!
            scheduleInfoModel.scheduleInfoArray.append(userScheduleInfo)
            UserDefaults.standard.set(scheduleInfoArray, forKey: "userScheduleInfo")
            self.navigationController?.popViewController(animated: true)
        }
    }
}
/*
 UserDefaults.standard.set(userScheduleInfo.scheduleName, forKey: "scheduleName")
 UserDefaults.standard.set(userScheduleInfo.scheduleDay.todayIsMon, forKey: "todayIsMon")
 UserDefaults.standard.set(userScheduleInfo.scheduleDay.todayIsTue, forKey: "todayIsTue")
 UserDefaults.standard.set(userScheduleInfo.scheduleDay.todayIsWed, forKey: "todayIsWed")
 UserDefaults.standard.set(userScheduleInfo.scheduleDay.todayIsThu, forKey: "todayIsThu")
 UserDefaults.standard.set(userScheduleInfo.scheduleDay.todayIsFri, forKey: "todayIsFri")
 UserDefaults.standard.set(userScheduleInfo.scheduleDay.todayIsSat, forKey: "todayIsSat")
 UserDefaults.standard.set(userScheduleInfo.scheduleDay.todayIsSun, forKey: "todayIsSun")
 UserDefaults.standard.set(userScheduleInfo.startingTime.startingTimeHour, forKey: "startingTimeHour")
 UserDefaults.standard.set(userScheduleInfo.startingTime.startingTimeMinute, forKey: "startingTimeMinute")
 UserDefaults.standard.set(userScheduleInfo.finishingTime.finishingTimeHour, forKey: "finishingTimeHour")
 UserDefaults.standard.set(userScheduleInfo.finishingTime.finishingTimeMinute, forKey: "finishingTimeMinute")
 scheduleInfoObject.scheduleName = userDefaults.value(forKey: "scheduleName") as! String
 scheduleInfoObject.scheduleDay.todayIsMon = userDefaults.value(forKey: "todayIsMon") as! Bool
 scheduleInfoObject.scheduleDay.todayIsTue = userDefaults.value(forKey: "todayIsTue") as! Bool
 scheduleInfoObject.scheduleDay.todayIsWed = userDefaults.value(forKey: "todayIsWed") as! Bool
 scheduleInfoObject.scheduleDay.todayIsThu = userDefaults.value(forKey: "todayIsThu") as! Bool
 scheduleInfoObject.scheduleDay.todayIsFri = userDefaults.value(forKey: "todayIsFri") as! Bool
 scheduleInfoObject.scheduleDay.todayIsSat = userDefaults.value(forKey: "todayIsSat") as! Bool
 scheduleInfoObject.scheduleDay.todayIsSun = userDefaults.value(forKey: "todayIsSun") as! Bool
 scheduleInfoObject.startingTime.startingTimeHour = userDefaults.value(forKey: "startingTimeHour") as! Int
 scheduleInfoObject.startingTime.startingTimeMinute = userDefaults.value(forKey: "startingTimeMinute") as! Int
 scheduleInfoObject.finishingTime.finishingTimeHour = userDefaults.value(forKey: "finishingTimeHour") as! Int
 scheduleInfoObject.finishingTime.finishingTimeMinute = userDefaults.value(forKey: "finishingTimeMinute") as! Int
 */
