//
//  ScheduleTimeDayChange.swift
//  RemainingFreeTime
//
//  Created by 상일여고일 on 2018. 7. 6..
//  Copyright © 2018년 victory. All rights reserved.
//

import Foundation
import UIKit
class ScheduleTimeDayChange{
    func scheduleTimeMonChange(button: UIButton, dayBool : DayInfoObject){
        if button.backgroundColor == UIColor.clear{
            button.backgroundColor = UIColor.yellow
            dayBool.todayIsMon = true
        }else{
            button.backgroundColor = UIColor.clear
            dayBool.todayIsMon = false
        }
    }
    func scheduleTimeTueChange(button: UIButton, dayBool : DayInfoObject){
        if button.backgroundColor == UIColor.clear{
            button.backgroundColor = UIColor.yellow
            dayBool.todayIsTue = true
        }else{
            button.backgroundColor = UIColor.clear
            dayBool.todayIsTue = false
        }
    }
    func scheduleTimeWedChange(button: UIButton, dayBool : DayInfoObject){
        if button.backgroundColor == UIColor.clear{
            button.backgroundColor = UIColor.yellow
            dayBool.todayIsWed = true
        }else{
            button.backgroundColor = UIColor.clear
            dayBool.todayIsWed = false
        }
    }
    func scheduleTimeThuChange(button: UIButton, dayBool : DayInfoObject){
        if button.backgroundColor == UIColor.clear{
            button.backgroundColor = UIColor.yellow
            dayBool.todayIsThu = true
        }else{
            button.backgroundColor = UIColor.clear
            dayBool.todayIsThu = false
        }
    }
    func scheduleTimeFriChange(button: UIButton, dayBool : DayInfoObject){
        if button.backgroundColor == UIColor.clear{
            button.backgroundColor = UIColor.yellow
            dayBool.todayIsFri = true
        }else{
            button.backgroundColor = UIColor.clear
            dayBool.todayIsFri = false
        }
    }
    func scheduleTimeSatChange(button: UIButton, dayBool : DayInfoObject){
        if button.backgroundColor == UIColor.clear{
            button.backgroundColor = UIColor.yellow
            dayBool.todayIsSat = true
        }else{
            button.backgroundColor = UIColor.clear
            dayBool.todayIsSat = false
        }
    }
    func scheduleTimeSunChange(button: UIButton, dayBool : DayInfoObject){
        if button.backgroundColor == UIColor.clear{
            button.backgroundColor = UIColor.yellow
            dayBool.todayIsSun = true
        }else{
            button.backgroundColor = UIColor.clear
            dayBool.todayIsSun = false
        }
    }
    
}
