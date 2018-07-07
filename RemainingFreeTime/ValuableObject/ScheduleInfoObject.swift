//
//  ScheduleInfoObject.swift
//  RemainingFreeTime
//
//  Created by 상일여고일 on 2018. 6. 12..
//  Copyright © 2018년 victory. All rights reserved.
//

import Foundation
import UIKit

class ScheduleInfoObject {
    var scheduleName : String = ""
    var scheduleDay : DayInfoObject = DayInfoObject()
    var startingTime : StartingTimeInfoObject = StartingTimeInfoObject()
    var finishingTime : FinishingTimeInfoObject = FinishingTimeInfoObject()
}

