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
    var scheduleArray : Array<[String:String]> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleCollectonView.dataSource = self
        scheduleCollectonView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool){
        scheduleArray = scheduleInfoModel.setScheduleDatafromUserDefaults()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scheduleArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let scheduleCell = scheduleCollectonView.dequeueReusableCell(withReuseIdentifier: "aCell", for: indexPath) as! ACollectionViewCell
        scheduleCell.scheduleNameLabel.text = scheduleArray[indexPath.row]["name"]
        scheduleCell.scheduleTimeLabel.text = scheduleArray[indexPath.row]["startHour"]! + ":" + scheduleArray[indexPath.row]["startMinute"]! + "~" + scheduleArray[indexPath.row]["finishHour"]! + ":" + scheduleArray[indexPath.row]["finishMinute"]!
        if Bool(scheduleArray[indexPath.row]["monday"]!)! == true {
            scheduleCell.mondayLabel.textColor = UIColor.black
        }
        if Bool(scheduleArray[indexPath.row]["tuesday"]!)! == true {
            scheduleCell.tuesdayLabel.textColor = UIColor.black
        }
        if Bool(scheduleArray[indexPath.row]["wednesday"]!)! == true {
            scheduleCell.wednesdayLabel.textColor = UIColor.black
        }
        if Bool(scheduleArray[indexPath.row]["thursday"]!)! == true {
            scheduleCell.thursdayLabel.textColor = UIColor.black
        }
        if Bool(scheduleArray[indexPath.row]["friday"]!)! == true {
            scheduleCell.fridayLabel.textColor = UIColor.black
        }
        if Bool(scheduleArray[indexPath.row]["saturday"]!)! == true {
            scheduleCell.saturdayLabel.textColor = UIColor.black
        }
        if Bool(scheduleArray[indexPath.row]["sunday"]!)! == true {
            scheduleCell.sundayLabel.textColor = UIColor.black
        }
        return scheduleCell
    }
    @IBAction func showingAddingScheduleVC(_ sender: Any) {
        let AddingScheduleVC = self.storyboard?.instantiateViewController(withIdentifier: "AddingScheduleViewController")
        //애니메이티드는 실행되냐 아니냐를 말하는건가 애니메이션 효과인줄 알았는데 뭐징
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.pushViewController(AddingScheduleVC!, animated: true)
    }
}
