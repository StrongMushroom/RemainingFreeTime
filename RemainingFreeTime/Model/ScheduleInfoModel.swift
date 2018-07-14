//
//  ScheduleInfoModel.swift
//  RemainingFreeTime
//
//  Created by 상일여고일 on 2018. 6. 12..
//  Copyright © 2018년 victory. All rights reserved.
//

import Foundation
class ScheduleInfoModel{
    func setScheduleDatafromUserDefaults() -> Array<[String:String]>{
        var array : Array<[String:String]> = []
        if UserDefaults.standard.array(forKey: "SCHEDULEARRAY") != nil{
            if UserDefaults.standard.array(forKey: "SCHEDULEARRAY") as? Array<[String:String]> != nil{
                array = UserDefaults.standard.array(forKey: "SCHEDULEARRAY") as! Array<[String:String]>
            }
        }
        return array
    }
    func setScheduleDataIntoUserDefaults(scheduleArray : Array<[String:String]>){
        UserDefaults.standard.set(scheduleArray, forKey: "SCHEDULEARRAY")
    }
}
