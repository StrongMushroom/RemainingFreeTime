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
        scheduleCell.scheduleTimeLabel.text = scheduleArray[indexPath.row]["startTime"]! + "~" + scheduleArray[indexPath.row]["finishTime"]!
        let cellTextColor = UIColor.black
        if Bool(scheduleArray[indexPath.row]["monday"]!)! == true {
            scheduleCell.mondayLabel.textColor = cellTextColor
        }
        if Bool(scheduleArray[indexPath.row]["tuesday"]!)! == true {
            scheduleCell.tuesdayLabel.textColor = cellTextColor
        }
        if Bool(scheduleArray[indexPath.row]["wednesday"]!)! == true {
            scheduleCell.wednesdayLabel.textColor = cellTextColor
        }
        if Bool(scheduleArray[indexPath.row]["thursday"]!)! == true {
            scheduleCell.thursdayLabel.textColor = cellTextColor
        }
        if Bool(scheduleArray[indexPath.row]["friday"]!)! == true {
            scheduleCell.fridayLabel.textColor = cellTextColor
        }
        if Bool(scheduleArray[indexPath.row]["saturday"]!)! == true {
            scheduleCell.saturdayLabel.textColor = cellTextColor
        }
        if Bool(scheduleArray[indexPath.row]["sunday"]!)! == true {
            scheduleCell.sundayLabel.textColor = cellTextColor
        }
        return scheduleCell
    }
    func someMethod(sender: UISwipeGestureRecognizer) {
        let cell = sender.view as! UICollectionViewCell
        let itemIndex = self.scheduleCollectonView.indexPath(for: cell)!.item
        scheduleArray.remove(at: itemIndex)
        self.scheduleCollectonView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        scheduleArray.remove(at: indexPath.row)
        scheduleInfoModel.setScheduleDataIntoUserDefaults(scheduleArray: scheduleArray)
        collectionView.reloadData()
    }
    @IBAction func showingAddingScheduleVC(_ sender: Any) {
        let AddingScheduleVC = self.storyboard?.instantiateViewController(withIdentifier: "AddingScheduleViewController")
        self.navigationController?.pushViewController(AddingScheduleVC!, animated: true)
    }
}
