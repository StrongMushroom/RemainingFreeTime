//
//  ScheduleCollectionViewController.swift
//  RemainingFreeTime
//
//  Created by 상일여고일 on 2018. 7. 6..
//  Copyright © 2018년 victory. All rights reserved.
//

import UIKit

class ScheduleCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var scheduleCollectonView: UICollectionView!
    let scheduleInfoModel : ScheduleInfoModel = ScheduleInfoModel()
    let aCollectionViewCell : ACollectionViewCell = ACollectionViewCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleCollectonView.dataSource = self
        scheduleCollectonView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scheduleInfoModel.scheduleInfoArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let firstCell = scheduleCollectonView.dequeueReusableCell(withReuseIdentifier: "aCell", for: indexPath) as! ACollectionViewCell
        firstCell.scheduleName = scheduleInfoModel.scheduleInfoArray[indexPath.row].scheduleName
        firstCell.scheduleTime = String(scheduleInfoModel.scheduleInfoArray[indexPath.row].startingTime.startingTimeHour) + ":" +  String(scheduleInfoModel.scheduleInfoArray[indexPath.row].startingTime.startingTimeMinute)
            + "~" + String(scheduleInfoModel.scheduleInfoArray[indexPath.row].finishingTime.finishingTimeHour)
            + ":" + String(scheduleInfoModel.scheduleInfoArray[indexPath.row].finishingTime.finishingTimeMinute)
        aCollectionViewCell.scheduleNameLabel.text = aCollectionViewCell.scheduleName
        aCollectionViewCell.scheduleTimeLabel.text = aCollectionViewCell.scheduleTime
        return firstCell
    }
    
}
