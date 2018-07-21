//
//  Counter.swift
//  RemainingFreeTime
//
//  Created by 상일여고삼 on 2018. 7. 17..
//  Copyright © 2018년 victory. All rights reserved.
//
import UIKit
import Foundation
class Counter
{
    @IBOutlet weak var timerHourLable: UILabel!
    @IBOutlet weak var timerMinuteLable: UILabel!
    @IBOutlet weak var timerSecondLable: UILabel!
    
    
    var remaningSecond = 86400
    let date = Date()
    let timer = Timer()
    
    @objc func counter()
    {
        remaningSecond -= 1
        var daySecond = remaningSecond%60
        var dayMinute :Int = Int(remaningSecond/60)
        var timerHour :Int = dayMinute/60
        var timerMinute = dayMinute%60
        
        timerHourLable.text = String(timerHour)
        timerMinuteLable.text = String(timerMinute)
    }
    //86400을 60으로 나누어 분단위로 바꾸고 1440을 60으로 나누어 몫과 나머지를 구한다 몫은 시간, 나머지는 분
    
}


