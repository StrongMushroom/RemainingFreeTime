//
//  ViewController.swift
//  RemainingFreeTime
//
//  Created by 상일여고일 on 2018. 6. 12..
//  Copyright © 2018년 victory. All rights reserved.
//

import UIKit
import Foundation
import Gifu

class ViewController: UIViewController
{
    var oneDaySecond = 86400
    var myRemainingSecond = 0
    var betweenScheduleRemainingSecond = 0
    var inScheduleRemainingSecond = 0
    @IBOutlet weak var timerHourLabel: UILabel!
    @IBOutlet weak var timerMinuteLabel: UILabel!
    @IBOutlet weak var timerSecondLabel: UILabel!
    @IBOutlet weak var scheduleTrueOrNot: UILabel!
    @IBOutlet weak var scheduleHourLable: UILabel!
    @IBOutlet weak var scheduleMinuteLable: UILabel!
    @IBOutlet weak var scheduleSecondLable: UILabel!
    @IBOutlet weak var H: UILabel!
    @IBOutlet weak var M: UILabel!
    @IBOutlet weak var S: UILabel!
    var timer = Timer()
    var otherTimer = Timer()
    var calendar = Calendar.current
    var scheduleInfoModel : ScheduleInfoModel = ScheduleInfoModel()
    var scheduleArray : Array<[String:String]> = []
    var scheduleStartTimeArray : [Int] = []
    var scheduleFinishTimeArray : [Int] = []
    var scheduleNameArray : [String] = []
    
    
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
                    scheduleNameArray.append(a["name"]!)
                    //scheduleNameArray.sort()
                    NSLog("\(scheduleNameArray)")
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
                    scheduleNameArray.append(a["name"]!)
                    scheduleNameArray.sort()
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
                    scheduleNameArray.append(a["name"]!)
                    scheduleNameArray.sort()
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
                    scheduleNameArray.append(a["name"]!)
                    scheduleNameArray.sort()
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
                    scheduleNameArray.append(a["name"]!)
                    scheduleNameArray.sort()
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
                    scheduleNameArray.append(a["name"]!)
                    scheduleNameArray.sort()
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
                    scheduleNameArray.append(a["name"]!)
                    scheduleNameArray.sort()
                    NSLog("일요일 어레이에 추가됩니다")
                }
            }
        }
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let nowSecond = hour*3600 + minute*60 + second
        var scheduleTimeInterval = 0
        let arrayCount = scheduleStartTimeArray.count
        let last = arrayCount-1
        if arrayCount == 0
        {
            NSLog("일정이 없을 때")
            myRemainingSecond = oneDaySecond-nowSecond
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerIsRunningTrueCounter), userInfo: nil, repeats: true)
            NSLog("하루에서 현재시간을 빼서 타이머 실행")
            scheduleTrueOrNot.text = "오늘의 일정이 없습니다."
            scheduleHourLable.isHidden = true
            scheduleMinuteLable.isHidden = true
            scheduleSecondLable.isHidden = true
            H.isHidden = true
            M.isHidden = true
            S.isHidden = true
            NSLog("라벨 숨기기")
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
                NSLog("전체 타이머 실행")
                scheduleTrueOrNot.text = "[\(scheduleNameArray[0])]까지 남은시간"
                NSLog("\(scheduleNameArray)")
                NSLog("\(scheduleNameArray[0])까지 남은시간")
                betweenScheduleRemainingSecond = scheduleStartTimeArray[0] - nowSecond
                otherTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(betweenScheduleTimerCounter), userInfo: nil, repeats: true)
                NSLog("일정 밖 타이머 실행")
            }
            else if nowSecond>=scheduleFinishTimeArray[last]
            {
                NSLog("마지막 일정보다 늦은 시간일 때")
                myRemainingSecond = oneDaySecond-nowSecond
                NSLog("[\(myRemainingSecond).나머지 시간=\(oneDaySecond).하루-\(nowSecond).현재시간]")
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerIsRunningTrueCounter), userInfo: nil, repeats: true)
                NSLog("타이머 실행")
                scheduleTrueOrNot.text = "모든 일정이 끝났습니다."
                scheduleHourLable.isHidden = true
                scheduleMinuteLable.isHidden = true
                scheduleSecondLable.isHidden = true
                H.isHidden = true
                M.isHidden = true
                S.isHidden = true
                NSLog("라벨 숨기기")
            }
            else
            {
                for x in 0...last
                {
                    NSLog("[\(x)]일정을 기준으로 일정 안인지 일정 밖인지 파악")
                    if scheduleStartTimeArray[x]<=nowSecond && nowSecond<scheduleFinishTimeArray[x]
                    {
                        NSLog("[\(x)]일정 안에 있을 때")
                        
                            if arrayCount>x+1
                            {
                                NSLog("나의 일정이 \(x)보다 많다면")
                                for a in x+1...last
                                {
                                    scheduleTimeInterval += scheduleFinishTimeArray[a]-scheduleStartTimeArray[a]
                                    NSLog("[\(a)]일정들의 시간을 남은일정시간 변수에 넣어주고")
                                }
                            }
                            else
                            {
                                NSLog("나의 일정이 \(x)보다 많지 않다면 남은일정시간 변수를 0으로")
                            }
                        
                        myRemainingSecond = oneDaySecond-scheduleFinishTimeArray[x]-scheduleTimeInterval
                        NSLog("\(oneDaySecond).하루-\(scheduleFinishTimeArray[x]).현재일정종료시간-\(scheduleTimeInterval).남은일정시간")
                        timerIsRunningFalseCounter()
                        NSLog("전체 타이머(정지) 실행")
                        timer.invalidate()
                        NSLog("전체 타이머 정지")
                        scheduleTrueOrNot.text = "\(scheduleNameArray[x]) 일정 중."
                        inScheduleRemainingSecond = scheduleFinishTimeArray[x]-nowSecond
                        otherTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(inScheduleTimerCounter), userInfo: nil, repeats: true)
                        NSLog("일정 안 타이머 실행")
                        //라벨들을 숨긴 상태로 현재시간에서 내가 속한 일정의 종료시간까지 남은 시간을 1초씩 깎는 타이머를 실행한다.
                        //일정사이 남은시간 변수가 0이 되면 라벨들을 보이게 하고 타이머를 실행시킨다.
                    }
                    else if scheduleFinishTimeArray[x]<=nowSecond && nowSecond<scheduleStartTimeArray[x+1]
                    {
                        NSLog("[\(x)]일정 후 [\(x+1)]일정 전")
                            for a in x...last-1
                            {
                                scheduleTimeInterval += scheduleFinishTimeArray[a+1]-scheduleStartTimeArray[a+1]
                                NSLog("[\(x)]일정의 소요시간을 남은일정시간 변수에 넣어주고")
                            }
                       
                        myRemainingSecond = oneDaySecond-nowSecond-scheduleTimeInterval
                        NSLog("\(oneDaySecond).하루-\(nowSecond).현재간-\(scheduleTimeInterval).남은일정시간")
                        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerIsRunningTrueCounter), userInfo: nil, repeats: true)
                        NSLog("전체 타이머 실행")
                        scheduleTrueOrNot.text = "\(scheduleNameArray[x+1]) 일정까지 남은 시간."
                        betweenScheduleRemainingSecond = scheduleStartTimeArray[x+1] - nowSecond
                        otherTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(betweenScheduleTimerCounter), userInfo: nil, repeats: true)
                        NSLog("일정 밖 타이머 실행")
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
        NSLog("전체 타이머가 계산")
        if myRemainingSecond == 0
        {
            timer.invalidate()
            viewWillAppear(true)
            NSLog("하루가 끝나면 타이머 멈추고 뷰를 다시 시작")
        }
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
        NSLog("전체 타이머가 계산(정지)")
    }
    //다음일정까지 남은시간을 계산해준다.
    @objc func betweenScheduleTimerCounter()
    {
        scheduleHourLable.isHidden = false
        scheduleMinuteLable.isHidden = false
        scheduleSecondLable.isHidden = false
        H.isHidden = false
        M.isHidden = false
        S.isHidden = false
        let timerSecond :Int = betweenScheduleRemainingSecond % 60
        let dayMinute :Int = betweenScheduleRemainingSecond / 60
        let timerMinute :Int = dayMinute % 60
        let timerHour : Int = dayMinute / 60
        
        scheduleHourLable.text = String(timerHour)
        scheduleMinuteLable.text = String(timerMinute)
        scheduleSecondLable.text = String(timerSecond)
        betweenScheduleRemainingSecond -= 1
        NSLog("일정밖 타이머가 계산")
        if betweenScheduleRemainingSecond == 0
        {
            timer.invalidate()
            otherTimer.invalidate()
            scheduleStartTimeArray.removeAll()
            scheduleFinishTimeArray.removeAll()
            viewWillAppear(true)
            NSLog("일정이 시작하면 모든 타이머 멈추고 뷰를 다시 시작")
        }
        
    }
    //지금 일정이 끝날때까지 남은 시간을 구해준다.
    @objc func inScheduleTimerCounter()
    {
        scheduleHourLable.isHidden = false
        scheduleMinuteLable.isHidden = false
        scheduleSecondLable.isHidden = false
        H.isHidden = false
        M.isHidden = false
        S.isHidden = false
        let timerSecond :Int = inScheduleRemainingSecond % 60
        let dayMinute :Int = inScheduleRemainingSecond / 60
        let timerMinute :Int = dayMinute % 60
        let timerHour : Int = dayMinute / 60
        
        scheduleHourLable.text = String(timerHour)
        scheduleMinuteLable.text = String(timerMinute)
        scheduleSecondLable.text = String(timerSecond)
        inScheduleRemainingSecond -= 1
        NSLog("일정 안 타이머가 계산")
        if inScheduleRemainingSecond == 0
        {
            timer.invalidate()
            otherTimer.invalidate()
            scheduleStartTimeArray.removeAll()
            scheduleFinishTimeArray.removeAll()
            viewWillAppear(true)
            NSLog("일정이 끝나면 모든 타이머 멈추고 뷰를 다시 시작")
        }
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        NSLog("뷰가 사라질 때")
        timer.invalidate()
        otherTimer.invalidate()
        scheduleStartTimeArray.removeAll()
        scheduleFinishTimeArray.removeAll()
        NSLog("모든 타이머가 멈춤")
    }
}

