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
    @IBOutlet weak var timerHourLable: UILabel!
    @IBOutlet weak var timerMinuteLable: UILabel!
    @IBOutlet weak var timerSecondLabel: UILabel!
    var isRuning = true
    var date = Date()
    var timer = Timer()
    var calendar = Calendar.current
    
    //남는시간 구하기

    override func viewWillAppear(_ animated: Bool)
    {
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let nowSecond = hour*3600 + minute*60 + second
        myRemainingSecond = oneDaySecond-nowSecond
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        isRuning = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        timer.invalidate()
        isRuning = false
    }
    
   
    
    @objc func counter()
    {
        myRemainingSecond -= 1
        let timerSecond :Int = myRemainingSecond % 60
        let dayMinute :Int = myRemainingSecond / 60
        let timerMinute :Int = dayMinute % 60
        let timerHour : Int = dayMinute / 60
        
        timerHourLable.text = String(timerHour)
        timerMinuteLable.text = String(timerMinute)
        timerSecondLabel.text = String(timerSecond)
    }

}

