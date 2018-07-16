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
    var scheduleModel = ScheduleInfoModel()
    var scheduleInfoArray : Array<[String:String]> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleTimeMonBtn.backgroundColor = UIColor.clear
        scheduleTimeTueBtn.backgroundColor = UIColor.clear
        scheduleTimeWedBtn.backgroundColor = UIColor.clear
        scheduleTimeThuBtn.backgroundColor = UIColor.clear
        scheduleTimeFriBtn.backgroundColor = UIColor.clear
        scheduleTimeSatBtn.backgroundColor = UIColor.clear
        scheduleTimeSunBtn.backgroundColor = UIColor.clear
        clearLabelColor()
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
    //조건에 맞게 동시에 실행될 수 있는 코드는 없을까? 
    @IBAction func addingScheduleIsDone(_ sender: Any) {
        //스케쥴 이름이나 시간의 텍스트를 입력받지 않았을 때
        clearLabelColor()
        if scheduleNameTextField.text == "" || startingTimeHour.text == "" || startingTimeMinute.text == "" || finishingTimeHour.text == "" || finishingTimeMinute.text == ""{
            warningLabel.textColor = UIColor.red
        }
        //요일 선택을 하나도 하지 않았을 때
        else if dayInfo.todayIsMon == false && dayInfo.todayIsTue == false && dayInfo.todayIsWed == false && dayInfo.todayIsThu == false && dayInfo.todayIsFri == false && dayInfo.todayIsSat == false && dayInfo.todayIsSun == false{
            warningLabel.textColor = UIColor.red
        }
        //시간 입력에 문자를 넣었을 때
        else if Int(startingTimeHour.text!) == nil || Int(startingTimeMinute.text!) == nil || Int(finishingTimeHour.text!) == nil || Int(finishingTimeMinute.text!) == nil{
            warningLabel.textColor = UIColor.red
        }
        //시간을 24이상으로 입력하거나 분을 60이상으로 입력했을 때 + 숫자 마이너스로 입력했을 때(그러는 사람이 있을까...)
        else if Int(startingTimeHour.text!)!>=24 || Int(startingTimeHour.text!)!<0 || Int(finishingTimeHour.text!)!>=60 || Int(finishingTimeMinute.text!)!<0 {
            warningLabel.textColor = UIColor.red
        }
        // 일정 시간이 겹칠 때(아직 안함)
        else{
            var scheduleDic = ["":""]
            scheduleDic["name"] = scheduleNameTextField.text!
            scheduleDic["monday"] = String(dayInfo.todayIsMon)
            scheduleDic["tuesday"] = String(dayInfo.todayIsTue)
            scheduleDic["wednesday"] = String(dayInfo.todayIsWed)
            scheduleDic["thursday"] = String(dayInfo.todayIsThu)
            scheduleDic["friday"] = String(dayInfo.todayIsFri)
            scheduleDic["saturday"] = String(dayInfo.todayIsSat)
            scheduleDic["sunday"] = String(dayInfo.todayIsSun)
            scheduleDic["startHour"] = startingTimeHour.text!
            scheduleDic["startMinute"] = startingTimeMinute.text!
            scheduleDic["finishHour"] = finishingTimeHour.text!
            scheduleDic["finishMinute"] = finishingTimeMinute.text!
            scheduleInfoArray.append(scheduleDic)
            scheduleModel.setScheduleDataIntoUserDefaults(scheduleArray: scheduleInfoArray)
            let collectionViewScheduleVC = self.storyboard?.instantiateViewController(withIdentifier: "ScheduleCollectionViewController")
            self.navigationController?.popViewController(animated: true)
            self.navigationController?.pushViewController(collectionViewScheduleVC!, animated: true)

        }
    }
    func clearLabelColor(){
        warningLabel.textColor = UIColor.clear
    }
}

