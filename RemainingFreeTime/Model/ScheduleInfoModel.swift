//
//  ScheduleInfoModel.swift
//  RemainingFreeTime
//
//  Created by 상일여고일 on 2018. 6. 12..
//  Copyright © 2018년 victory. All rights reserved.
//

import Foundation
class ScheduleInfoModel{
    var scheduleInfoArray:Array<[String:String]> = []
    func setScheduleDatafromUserDefaults() -> Array<[String:String]>{
        var array : Array<[String:String]> = []
        if UserDefaults.standard.array(forKey: "SCHEDULEARRAY") != nil{
            NSLog("UserDefaults.standard.array(forKey:SCHEDULEARRAY)값이 nil이 아니야!")
            if UserDefaults.standard.array(forKey: "SCHEDULEARRAY") as? Array<[String:String]> != nil{
                NSLog("UserDefaults.standard.array(forKey:SCHEDULEARRAY)를 형변환한 값이 nil이 아니야!")
                array = UserDefaults.standard.array(forKey: "SCHEDULEARRAY") as! Array<[String:String]>
            }
            NSLog("UserDefaults.standard.array(forKey:SCHEDULEARRAY)를 형변환한 값이 nil이야!")
        }
        NSLog("UserDefaults.standard.array(forKey:SCHEDULEARRAY)값이 nil이야")
        return array
    }
    func setScheduleDataIntoUserDefaults(scheduleArray : Array<[String:String]>){
        UserDefaults.standard.set(scheduleArray, forKey: "SCHEDULEARRAY")
    }
}
