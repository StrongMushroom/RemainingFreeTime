//
//  ViewController.swift
//  RemainingFreeTime
//
//  Created by 상일여고일 on 2018. 6. 12..
//  Copyright © 2018년 victory. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController
{
    var oneDaySecond = 86400
    var myRemainingSecond = 0
    @IBOutlet weak var timerHourLabel: UILabel!
    @IBOutlet weak var timerMinuteLabel: UILabel!
    @IBOutlet weak var timerSecondLabel: UILabel!
    var isRunning = true
    
    var timer = Timer()
    var calendar = Calendar.current
    
    //남는시간 구하기
    override func viewWillAppear(_ animated: Bool)
    {
        let date = Date()
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let nowSecond = hour*3600 + minute*60 + second
        myRemainingSecond = oneDaySecond-nowSecond
        counter()
        
        //타이머인데요. 1초마나 counter를 실행해요.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        isRunning = true
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        timer.invalidate()
        isRunning = false
    }
   
    //이건 counter 코드인데요. 1초씩 깎아줘요...
    @objc func counter()
    {
        let timerSecond :Int = myRemainingSecond % 60
        let dayMinute :Int = myRemainingSecond / 60
        let timerMinute :Int = dayMinute % 60
        let timerHour : Int = dayMinute / 60
        
        timerHourLabel.text = String(timerHour)
        timerMinuteLabel.text = String(timerMinute)
        timerSecondLabel.text = String(timerSecond)
        myRemainingSecond -= 1
    }
    
}

