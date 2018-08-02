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
    var scheduleInfoModel : ScheduleInfoModel = ScheduleInfoModel()
    var scheduleArray : Array<[String:String]> = []
    var scheduleStartTimeArray : [Int] = []
    var scheduleFinishTimeArray : [Int] = []
   
    override func viewWillAppear(_ animated: Bool)
    {
        NSLog("뷰 어피어 시작")
        let date = Date()
        let weekDay = calendar.component(.weekday, from: date)
        scheduleArray = scheduleInfoModel.setScheduleDatafromUserDefaults()
        
        switch weekDay {
        case 2:
            for a in scheduleArray
            {
                if Bool(a["monday"]!)! == true
                {
                    let startTime = a["startTime"]
                    let startArray = startTime?.components(separatedBy: ":")
                    let startHour :Int = Int(startArray![0])!
                    let startMinute :Int = Int(startArray![1])!
                    let startSecond = startHour*3600 + startMinute*60
                    scheduleStartTimeArray.append(startSecond)
                    scheduleStartTimeArray.sort()
                    let finishTime = a["finishTime"]
                    let finishArray = finishTime?.components(separatedBy: ":")
                    let finishHour :Int = Int(finishArray![0])!
                    let finishMinute :Int = Int(finishArray![1])!
                    let finishSecond = finishHour*3600 + finishMinute*60
                    scheduleFinishTimeArray.append(finishSecond)
                    scheduleFinishTimeArray.sort()
                    NSLog("월요일 어레이에 추가됩니다.")
                }
            }
        case 3:
            for a in scheduleArray
            {
                if Bool(a["tuesday"]!)! == true
                {
                    let startTime = a["startTime"]
                    let startArray = startTime?.components(separatedBy: ":")
                    let startHour :Int = Int(startArray![0])!
                    let startMinute :Int = Int(startArray![1])!
                    let startSecond = startHour*3600 + startMinute*60
                    scheduleStartTimeArray.append(startSecond)
                    scheduleStartTimeArray.sort()
                    let finishTime = a["finishTime"]
                    let finishArray = finishTime?.components(separatedBy: ":")
                    let finishHour :Int = Int(finishArray![0])!
                    let finishMinute :Int = Int(finishArray![1])!
                    let finishSecond = finishHour*3600 + finishMinute*60
                    scheduleFinishTimeArray.append(finishSecond)
                    scheduleFinishTimeArray.sort()
                    NSLog("화요일 어레이에 추가됩니다.")
                }
            }
        case 4:
            for a in scheduleArray
            {
                if Bool(a["wednesday"]!)! == true
                {
                    let startTime = a["startTime"]
                    let startArray = startTime?.components(separatedBy: ":")
                    let startHour :Int = Int(startArray![0])!
                    let startMinute :Int = Int(startArray![1])!
                    let startSecond = startHour*3600 + startMinute*60
                    scheduleStartTimeArray.append(startSecond)
                    scheduleStartTimeArray.sort()
                    let finishTime = a["finishTime"]
                    let finishArray = finishTime?.components(separatedBy: ":")
                    let finishHour :Int = Int(finishArray![0])!
                    let finishMinute :Int = Int(finishArray![1])!
                    let finishSecond = finishHour*3600 + finishMinute*60
                    scheduleFinishTimeArray.append(finishSecond)
                    scheduleFinishTimeArray.sort()
                    NSLog("수요일 어레이에 추가됩니다.")
                }
            }
        case 5:
            for a in scheduleArray
            {
                if Bool(a["thursday"]!)! == true
                {
                    let startTime = a["startTime"]
                    let startArray = startTime?.components(separatedBy: ":")
                    let startHour :Int = Int(startArray![0])!
                    let startMinute :Int = Int(startArray![1])!
                    let startSecond = startHour*3600 + startMinute*60
                    scheduleStartTimeArray.append(startSecond)
                    scheduleStartTimeArray.sort()
                    let finishTime = a["finishTime"]
                    let finishArray = finishTime?.components(separatedBy: ":")
                    let finishHour :Int = Int(finishArray![0])!
                    let finishMinute :Int = Int(finishArray![1])!
                    let finishSecond = finishHour*3600 + finishMinute*60
                    scheduleFinishTimeArray.append(finishSecond)
                    scheduleFinishTimeArray.sort()
                    NSLog("목요일 어레이에 추가됩니다.")
                }
            }
        case 6:
            for a in scheduleArray
            {
                if Bool(a["friday"]!)! == true
                {
                    let startTime = a["startTime"]
                    let startArray = startTime?.components(separatedBy: ":")
                    let startHour :Int = Int(startArray![0])!
                    let startMinute :Int = Int(startArray![1])!
                    let startSecond = startHour*3600 + startMinute*60
                    scheduleStartTimeArray.append(startSecond)
                    scheduleStartTimeArray.sort()
                    let finishTime = a["finishTime"]
                    let finishArray = finishTime?.components(separatedBy: ":")
                    let finishHour :Int = Int(finishArray![0])!
                    let finishMinute :Int = Int(finishArray![1])!
                    let finishSecond = finishHour*3600 + finishMinute*60
                    scheduleFinishTimeArray.append(finishSecond)
                    scheduleFinishTimeArray.sort()
                    NSLog("금요일 어레이에 추가됩니다")
                }
            }
        case 7:
            for a in scheduleArray
            {
                if Bool(a["saturday"]!)! == true
                {
                    let startTime = a["startTime"]
                    let startArray = startTime?.components(separatedBy: ":")
                    let startHour :Int = Int(startArray![0])!
                    let startMinute :Int = Int(startArray![1])!
                    let startSecond = startHour*3600 + startMinute*60
                    scheduleStartTimeArray.append(startSecond)
                    scheduleStartTimeArray.sort()
                    let finishTime = a["finishTime"]
                    let finishArray = finishTime?.components(separatedBy: ":")
                    let finishHour :Int = Int(finishArray![0])!
                    let finishMinute :Int = Int(finishArray![1])!
                    let finishSecond = finishHour*3600 + finishMinute*60
                    scheduleFinishTimeArray.append(finishSecond)
                    scheduleFinishTimeArray.sort()
                    NSLog("토요일 어레이에 추가됩니다")
                }
            }
        default :
            for a in scheduleArray
            {
                if Bool(a["sunday"]!)! == true
                {
                    let startTime = a["startTime"]
                    let startArray = startTime?.components(separatedBy: ":")
                    let startHour :Int = Int(startArray![0])!
                    let startMinute :Int = Int(startArray![1])!
                    let startSecond = startHour*3600 + startMinute*60
                    scheduleStartTimeArray.append(startSecond)
                    scheduleStartTimeArray.sort()
                    let finishTime = a["finishTime"]
                    let finishArray = finishTime?.components(separatedBy: ":")
                    let finishHour :Int = Int(finishArray![0])!
                    let finishMinute :Int = Int(finishArray![1])!
                    let finishSecond = finishHour*3600 + finishMinute*60
                    scheduleFinishTimeArray.append(finishSecond)
                    scheduleFinishTimeArray.sort()
                    NSLog("일요일 어레이에 추가됩니다")
                }
            }
        }
      
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let nowSecond = hour*3600 + minute*60 + second
        
        var scheduleTimeInterval = 0
        var delay = 0
        let arrayCount = scheduleStartTimeArray.count
        let last = arrayCount-1
        if arrayCount == 0
        {
            NSLog("일정이 없을 때")
            myRemainingSecond = oneDaySecond-nowSecond
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerIsRunningTrueCounter), userInfo: nil, repeats: true)
            isRunning = true
            NSLog("하루에서 현재시간을 빼서 타이머 실행")
        }
        else if arrayCount != 0
        {
            NSLog("일정이 있을 때")
            if nowSecond<scheduleStartTimeArray[0]
            {
                NSLog("첫 일정보다 이른 시간일 때")
                for a in 0...last
                {
                    NSLog("뒤에 있는 일정들의 시간을 남은일정시간 변수에 넣어주고")
                    scheduleTimeInterval += scheduleFinishTimeArray[a]-scheduleStartTimeArray[a]
                }
                myRemainingSecond = oneDaySecond-nowSecond-scheduleTimeInterval
                NSLog("[\(myRemainingSecond).나머지 시간=\(oneDaySecond).하루-\(nowSecond).현재시간-\(scheduleTimeInterval).남은일정시간]")
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerIsRunningTrueCounter), userInfo: nil, repeats: true)
                isRunning = true
                NSLog("타이머 실행")
            }
            else if nowSecond>scheduleFinishTimeArray[last]
            {
                NSLog("마지막 일정보다 늦은 시간일 때")
                myRemainingSecond = oneDaySecond-nowSecond
                NSLog("[\(myRemainingSecond).나머지 시간=\(oneDaySecond).하루-\(nowSecond).현재시간]")
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerIsRunningTrueCounter), userInfo: nil, repeats: true)
                isRunning = true
                NSLog("타이머 실행")
            }
            else
            {
                for x in 0...last
                {
                    NSLog("[\(x)]일정을 기준으로 일정 안인지 일정 밖인지 파악")
                    if scheduleStartTimeArray[x]<=nowSecond && nowSecond<scheduleFinishTimeArray[x]
                    {
                        NSLog("[\(x)]일정 안에 있을 때")
                        for a in x...last
                        {
                            if arrayCount>x+1
                            {
                                NSLog("나의 일정이 \(x)보다 많다면")
                                for a in x+1...last
                                {
                                    scheduleTimeInterval += scheduleFinishTimeArray[a]-scheduleStartTimeArray[a]
                                    NSLog("[\(x)]~[\(last)]일정들의 시간을 남은일정시간 변수에 넣어주고")
                                }
                                NSLog("나의 일정이 \(x)보다 많지 않다면 남은일정시간 변수를 0으로")
                            }
                        }
                        myRemainingSecond = oneDaySecond-scheduleFinishTimeArray[x]-scheduleTimeInterval
                        NSLog("\(oneDaySecond).하루-\(scheduleFinishTimeArray).일정종료시간-\(scheduleTimeInterval).남은일정시간")
                        timerIsRunningFalseCounter()
                        delay = scheduleFinishTimeArray[x]-nowSecond
                        //현재시간이 속한 일정의 종료시간까지 남은 시간 만큼 시간이 흐르면 timerRunning 함수를 실행해준다
                        timer.invalidate()
                        NSLog("타이머 정지")
                        //정지하고 delay=(종료시간-현재시간) 이후에 실행되는 타이머도 추가하기.
                    }
                    else if scheduleFinishTimeArray[x]<=nowSecond //&& nowSecond<scheduleStartTimeArray[x+1]
                    {
                        NSLog("[\(x)]일정 후 [\(x+1)]일정 전")
                        
                        if arrayCount>x+1
                        {
                            for a in x...last-1
                            {
                                scheduleTimeInterval += scheduleFinishTimeArray[a+1]-scheduleStartTimeArray[a+1]
                            }
                        }
                        myRemainingSecond = oneDaySecond-nowSecond-scheduleTimeInterval
                        NSLog("\(oneDaySecond).하루-\(nowSecond).현재간-\(scheduleTimeInterval).남은일정시간")
                        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerIsRunningTrueCounter), userInfo: nil, repeats: true)
                        isRunning = true
                        NSLog("\(myRemainingSecond)을 나머지 시간으로 타이머 실행")
                    }
                }
            }
        }
    }
    //타이머가 돌아갈 때의 카운터 함수
    @objc func timerIsRunningTrueCounter()
    {
        let timerSecond :Int = myRemainingSecond % 60
        let dayMinute :Int = myRemainingSecond / 60
        let timerMinute :Int = dayMinute % 60
        let timerHour : Int = dayMinute / 60
        
        timerHourLabel.text = String(timerHour)
        timerMinuteLabel.text = String(timerMinute)
        timerSecondLabel.text = String(timerSecond)
        myRemainingSecond -= 1
        NSLog("타이머가 계산")
    }
    //타이머가 정지해 있을때의 카운터 함수
    @objc func timerIsRunningFalseCounter()
    {
        let timerSecond :Int = myRemainingSecond % 60
        let dayMinute :Int = myRemainingSecond / 60
        let timerMinute :Int = dayMinute % 60
        let timerHour : Int = dayMinute / 60
        
        timerHourLabel.text = String(timerHour)
        timerMinuteLabel.text = String(timerMinute)
        timerSecondLabel.text = String(timerSecond)
        NSLog("타이머가 계산")
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        NSLog("뷰가 사라질 때")
        timer.invalidate()
        isRunning = false
        scheduleStartTimeArray.removeAll()
        scheduleFinishTimeArray.removeAll()
        NSLog("타이머가 멈춤")
    }
}

