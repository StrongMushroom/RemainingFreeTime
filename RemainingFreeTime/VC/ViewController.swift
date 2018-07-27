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
    //일정을 뺄 하루의 초 이다.
    var oneDaySecond = 86400
    //[현재시간or종료시간 + 뒤의 일정을 다 더한거]를 하루에서 빼서 오늘의 남은 시간을 저장해 줄 변수이다.
    var myRemainingSecond = 0
    //시.분.초를 출력해줄 라벨변수들이다.
    @IBOutlet weak var timerHourLabel: UILabel!
    @IBOutlet weak var timerMinuteLabel: UILabel!
    @IBOutlet weak var timerSecondLabel: UILabel!
    //왜 했는지는 모르겠는데 그냥 타이머가 돌아간다는 의미이다.
    var isRunning = true
    //일정 간격마다 함수를 반복해서 실행해주는 코드가 필요해서 Timer을 객채화 시켰다.
    var timer = Timer()
    //현재의 시.분.초를 구해주기 위해서 Calendar를 current 해줬다.
    var calendar = Calendar.current
    var scheduleInfoModel : ScheduleInfoModel = ScheduleInfoModel()
    var scheduleArray : Array<[String:String]> = []
    //시작시간을 추가해줄 어레이
    var scheduleStartTimeArray : [Int] = []
    //종료시간을 추가해줄 어레이
    var scheduleFinishTimeArray : [Int] = []
    
    
    
    
    //뷰가 보일때 실행해 줄 함수
    override func viewWillAppear(_ animated: Bool)
    {
        NSLog("뷰어피어 시작")
        //오늘의 날짜를 구해줘야 하기 때문에 Date를 객체화 해준다. (여기서 date를 초기화 해주는 이유는 뷰가 어피어 될 시점의 시간을 구해야 하기 때문이다.(맨 위에다가 놓으면 자꾸 똑같은 시간으로 돌아가서 나옴.))
        let date = Date()
        //오늘의 요일을 파악해주기 위해 요일을 구한다.
        let weekDay = calendar.component(.weekdayOrdinal, from: date)
        //scheduleArray = scheduleInfoModel.setScheduleDatafromUserDefaults() 왜 한거지.//
        
        switch weekDay {
        case 1:
            for a in scheduleArray
            {
                if Bool(a["monday"]!)! == true
                {
                    scheduleStartTimeArray.append(Int(a["startTime"]!)!)
                    scheduleFinishTimeArray.append(Int(a["finishTime"]!)!)
                }
            }
        case 2:
            for a in scheduleArray
            {
                if Bool(a["tuesday"]!)! == true
                {
                    scheduleStartTimeArray.append(Int(a["startTime"]!)!)
                    scheduleFinishTimeArray.append(Int(a["finishTime"]!)!)
                }
            }
        case 3:
            for a in scheduleArray
            {
                if Bool(a["wednesday"]!)! == true
                {
                    scheduleStartTimeArray.append(Int(a["startTime"]!)!)
                    scheduleFinishTimeArray.append(Int(a["finishTime"]!)!)
                }
            }
        case 4:
            for a in scheduleArray
            {
                if Bool(a["thursday"]!)! == true
                {
                    scheduleStartTimeArray.append(Int(a["startTime"]!)!)
                    scheduleFinishTimeArray.append(Int(a["finishTime"]!)!)
                }
            }
        case 5:
            for a in scheduleArray
            {
                if Bool(a["friday"]!)! == true
                {
                    scheduleStartTimeArray.append(Int(a["startTime"]!)!)
                    NSLog("어레이에 추가됩니다")
                    scheduleFinishTimeArray.append(Int(a["finishTime"]!)!)
                }
            }
        case 6:
            for a in scheduleArray
            {
                if Bool(a["saturday"]!)! == true
                {
                    scheduleStartTimeArray.append(Int(a["startTime"]!)!)
                    scheduleFinishTimeArray.append(Int(a["finishTime"]!)!)
                }
                
            }
        default :
            for a in scheduleArray
            {
                if Bool(a["sunday"]!)! == true
                {
                    scheduleStartTimeArray.append(Int(a["startTime"]!)!)
                    scheduleFinishTimeArray.append(Int(a["finishTime"]!)!)
                }
            }
        }
        
        
        //현재(뷰가 나타날 때)의 시.분.초
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        // 시.분.초 를 더해서 현재시간을 구해준다.
        let nowSecond = hour*3600 + minute*60 + second
        //일정밖일 때 하루에서 현재를 빼준다.
        
        //일정중인지 일정밖인지 파악해서 남은시간을 계산해준다.(for문 돌릴때 for i in Array.count하기(startArray와 finishArray의 수가 같으니까 하나만 구해줘도 됨))
        //현재시간과 어레이 속 시간을 비교해서 구하겠다!
        
        
        
        var scheduleTimeInterval = 0
        var delay = 0
        let last = scheduleStartTimeArray.count
        if last == 0
        {
            myRemainingSecond = oneDaySecond-nowSecond
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerIsRunningTrueCounter), userInfo: nil, repeats: true)
            isRunning = true
            NSLog("")
        }
        else if last != 0
        {
            if nowSecond<scheduleStartTimeArray[1]
            {
                for a in 1...last
                {
                    scheduleTimeInterval += scheduleFinishTimeArray[a]-scheduleStartTimeArray[a]
                }
                myRemainingSecond = oneDaySecond-nowSecond-scheduleTimeInterval
                
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerIsRunningTrueCounter), userInfo: nil, repeats: true)
                isRunning = true
            }
            else if nowSecond>scheduleStartTimeArray[last]
            {
                myRemainingSecond = oneDaySecond-nowSecond
                
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerIsRunningTrueCounter), userInfo: nil, repeats: true)
                isRunning = true
            }
            for x in 1...last
            {
                if scheduleStartTimeArray[x]<nowSecond
                {
                    if nowSecond<scheduleFinishTimeArray[x]
                    {
                        for a in x...last
                        {
                            scheduleTimeInterval += scheduleFinishTimeArray[a+1]-scheduleStartTimeArray[a+1]
                        }
                    }
                    myRemainingSecond = oneDaySecond-scheduleFinishTimeArray[x]-scheduleTimeInterval
                    timerIsRunningFalseCounter()
                    delay = scheduleFinishTimeArray[x]-nowSecond
                    //현재시간이 속한 일정의 종료시간까지 남은 시간 만큼 시간이 흐르면 timerRunning 함수를 실행해준다
                    timer.invalidate()
                    //정지하고 delay=(종료시간-현재시간) 이후에 실행되는 타이머도 추가하기.
                }
                else if scheduleFinishTimeArray[x]<nowSecond
                {
                    if nowSecond<scheduleStartTimeArray[x+1]
                    {
                        for a in x...last
                        {
                            scheduleTimeInterval += scheduleFinishTimeArray[a+1]-scheduleStartTimeArray[a+1]
                        }
                    }
                    myRemainingSecond = oneDaySecond-nowSecond-scheduleTimeInterval
                    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerIsRunningTrueCounter), userInfo: nil, repeats: true)
                    isRunning = true
                }
            }
            
            //현재시간<시작[0]
            //timeIntervar=(종료[0]-시작[0])+(종료[0+1]-시작[0+1)....(종료[startArray.count]-시작[startArray.count])
            //->myRemainingTime = 하루-현재-timeInterval
            
            //for x in 0...startArray.count
            //종료[x]<현재시간<시작[x+1]
            //timeIntervar=(종료[x+1]-시작[x+1])+(종료[x+1+1]-시작[x+1+1)....(종료[startArray.count]-시작[startArray.count])
            //->myRemainingTime = 하루-현재-timeInterval 하고 진행 타이머 실행
            
            //시작[x]<현재시간<종료[x]
            //timeIntervar=(종료[x+1]-시작[x+1])...(종료[startArray.count]-시작[startArray.count])
            //->myRemainingTime = 하루-종료[x]-timeInterval 하고 정지타이머 실행
        }
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        timer.invalidate()
        isRunning = false
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
    }
    
}

