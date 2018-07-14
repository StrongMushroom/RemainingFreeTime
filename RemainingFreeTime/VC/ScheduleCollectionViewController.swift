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
    var scheduleInfoModel : ScheduleInfoModel = ScheduleInfoModel()
    var scheduleArray = ScheduleInfoModel.init().scheduleInfoArray
    var aCollectionViewCell : ACollectionViewCell = ACollectionViewCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleCollectonView.dataSource = self
        scheduleCollectonView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool){
        scheduleInfoModel.setScheduleDatafromUserDefaults()
        scheduleArray = scheduleInfoModel.scheduleInfoArray
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scheduleInfoModel.scheduleInfoArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let scheduleCell = scheduleCollectonView.dequeueReusableCell(withReuseIdentifier: "aCell", for: indexPath) as! ACollectionViewCell
        scheduleCell.scheduleNameLabel.text = scheduleArray[indexPath.row]["name"]
        scheduleCell.scheduleTimeLabel.text = scheduleArray[indexPath.row]["startHour"]! + ":" + scheduleArray[indexPath.row]["startMinute"]! + "~" + scheduleArray[indexPath.row]["finishHour"]! + ":" + scheduleArray[indexPath.row]["finishMinute"]!
        return scheduleCell
    }

}
