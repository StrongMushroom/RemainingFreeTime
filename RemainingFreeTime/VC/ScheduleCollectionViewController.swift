//
//  ScheduleCollectionViewController.swift
//  RemainingFreeTime
//
//  Created by 상일여고일 on 2018. 7. 6..
//  Copyright © 2018년 victory. All rights reserved.
//

import UIKit

class ScheduleCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate{
    @IBOutlet weak var scheduleCollectonView: UICollectionView!
    @IBOutlet weak var scheduleSearchBar: UISearchBar!
    var scheduleInfoModel : ScheduleInfoModel = ScheduleInfoModel()
    var scheduleArray : Array<[String:String]> = []
    var scheduleFilteredArray:Array<[String:String]> = []
    var searchActive : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleCollectonView.dataSource = self
        scheduleCollectonView.delegate = self
        scheduleSearchBar.delegate = self

    }
    override func viewWillAppear(_ animated: Bool){
        scheduleArray = scheduleInfoModel.setScheduleDatafromUserDefaults()
        scheduleCollectonView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let scheduleCell = scheduleCollectonView.dequeueReusableCell(withReuseIdentifier: "aCell", for: indexPath) as! ACollectionViewCell
        let cellTextColor = UIColor.black
        let grayColor = UIColor.lightGray
        
        if searchActive {
            scheduleCell.scheduleNameLabel.text = scheduleFilteredArray[indexPath.row]["name"]
            scheduleCell.scheduleTimeLabel.text = scheduleFilteredArray[indexPath.row]["startTime"]! + "~" + scheduleFilteredArray[indexPath.row]["finishTime"]!
            if Bool(scheduleFilteredArray[indexPath.row]["monday"]!)! == true {
                scheduleCell.mondayLabel.textColor = cellTextColor
            } else {
                scheduleCell.mondayLabel.textColor = grayColor
            }
            if Bool(scheduleFilteredArray[indexPath.row]["tuesday"]!)! == true {
                scheduleCell.tuesdayLabel.textColor = cellTextColor
            } else {
                scheduleCell.tuesdayLabel.textColor = grayColor
            }
            if Bool(scheduleFilteredArray[indexPath.row]["wednesday"]!)! == true {
                scheduleCell.wednesdayLabel.textColor = cellTextColor
            } else {
                scheduleCell.wednesdayLabel.textColor = grayColor
            }
            if Bool(scheduleFilteredArray[indexPath.row]["thursday"]!)! == true {
                scheduleCell.thursdayLabel.textColor = cellTextColor
            } else {
                scheduleCell.thursdayLabel.textColor = grayColor
            }
            if Bool(scheduleFilteredArray[indexPath.row]["friday"]!)! == true {
                scheduleCell.fridayLabel.textColor = cellTextColor
            } else {
                scheduleCell.fridayLabel.textColor = grayColor
            }
            if Bool(scheduleFilteredArray[indexPath.row]["saturday"]!)! == true {
                scheduleCell.saturdayLabel.textColor = cellTextColor
            } else {
                scheduleCell.saturdayLabel.textColor = grayColor
            }
            if Bool(scheduleFilteredArray[indexPath.row]["sunday"]!)! == true {
                scheduleCell.sundayLabel.textColor = cellTextColor
            } else {
                scheduleCell.sundayLabel.textColor = grayColor
            }
            
        }else{
            scheduleCell.scheduleNameLabel.text = scheduleArray[indexPath.row]["name"]
            scheduleCell.scheduleTimeLabel.text = scheduleArray[indexPath.row]["startTime"]! + "~" + scheduleArray[indexPath.row]["finishTime"]!
            if Bool(scheduleArray[indexPath.row]["monday"]!)! == true {
                scheduleCell.mondayLabel.textColor = cellTextColor
            } else {
                scheduleCell.mondayLabel.textColor = grayColor
            }
            if Bool(scheduleArray[indexPath.row]["tuesday"]!)! == true {
                scheduleCell.tuesdayLabel.textColor = cellTextColor
            } else {
                scheduleCell.tuesdayLabel.textColor = grayColor
            }
            if Bool(scheduleArray[indexPath.row]["wednesday"]!)! == true {
                scheduleCell.wednesdayLabel.textColor = cellTextColor
            } else {
                scheduleCell.wednesdayLabel.textColor = grayColor
            }
            if Bool(scheduleArray[indexPath.row]["thursday"]!)! == true {
                scheduleCell.thursdayLabel.textColor = cellTextColor
            } else {
                scheduleCell.thursdayLabel.textColor = grayColor
            }
            if Bool(scheduleArray[indexPath.row]["friday"]!)! == true {
                scheduleCell.fridayLabel.textColor = cellTextColor
            } else {
                scheduleCell.fridayLabel.textColor = grayColor
            }
            if Bool(scheduleArray[indexPath.row]["saturday"]!)! == true {
                scheduleCell.saturdayLabel.textColor = cellTextColor
            } else {
                scheduleCell.saturdayLabel.textColor = grayColor
            }
            if Bool(scheduleArray[indexPath.row]["sunday"]!)! == true {
                scheduleCell.sundayLabel.textColor = cellTextColor
            } else {
                scheduleCell.sundayLabel.textColor = grayColor
            }
        }
        return scheduleCell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let modifyCellVC = self.storyboard?.instantiateViewController(withIdentifier: "ModifyCellViewController") as! ModifyCellViewController
        if searchActive {
            modifyCellVC.scheduleName = scheduleFilteredArray[indexPath.row]["name"]!
            modifyCellVC.startTime = scheduleFilteredArray[indexPath.row]["startTime"]!
            modifyCellVC.finishTime = scheduleFilteredArray[indexPath.row]["finishTime"]!
            modifyCellVC.monBtn = Bool(scheduleFilteredArray[indexPath.row]["monday"]!)!
            modifyCellVC.tueBtn = Bool(scheduleFilteredArray[indexPath.row]["tuesday"]!)!
            modifyCellVC.wedBtn = Bool(scheduleFilteredArray[indexPath.row]["wednesday"]!)!
            modifyCellVC.thuBtn = Bool(scheduleFilteredArray[indexPath.row]["thursday"]!)!
            modifyCellVC.friBtn = Bool(scheduleFilteredArray[indexPath.row]["friday"]!)!
            modifyCellVC.satBtn = Bool(scheduleFilteredArray[indexPath.row]["saturday"]!)!
            modifyCellVC.sunBtn = Bool(scheduleFilteredArray[indexPath.row]["sunday"]!)!
            modifyCellVC.cellNum = indexPath.row
        }else{
            modifyCellVC.scheduleName = scheduleArray[indexPath.row]["name"]!
            modifyCellVC.startTime = scheduleArray[indexPath.row]["startTime"]!
            modifyCellVC.finishTime = scheduleArray[indexPath.row]["finishTime"]!
            modifyCellVC.monBtn = Bool(scheduleArray[indexPath.row]["monday"]!)!
            modifyCellVC.tueBtn = Bool(scheduleArray[indexPath.row]["tuesday"]!)!
            modifyCellVC.wedBtn = Bool(scheduleArray[indexPath.row]["wednesday"]!)!
            modifyCellVC.thuBtn = Bool(scheduleArray[indexPath.row]["thursday"]!)!
            modifyCellVC.friBtn = Bool(scheduleArray[indexPath.row]["friday"]!)!
            modifyCellVC.satBtn = Bool(scheduleArray[indexPath.row]["saturday"]!)!
            modifyCellVC.sunBtn = Bool(scheduleArray[indexPath.row]["sunday"]!)!
            modifyCellVC.cellNum = indexPath.row
        }
        self.navigationController?.pushViewController(modifyCellVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        scheduleArray.remove(at: indexPath.row)
//        scheduleNameArray.remove(at: indexPath.row)
        scheduleInfoModel.setScheduleDataIntoUserDefaults(scheduleArray: scheduleArray)
        scheduleCollectonView.reloadData()
    }
    
    // search 관련 함수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchActive {
            return scheduleFilteredArray.count
        }else{
            return scheduleArray.count
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        self.dismiss(animated: true, completion: nil)
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
        scheduleCollectonView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchString = searchText
        scheduleFilteredArray = scheduleArray.filter({ (item) -> Bool in
            let itemName: NSString = item["name"]! as NSString
            return (itemName.range(of: searchString, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
        })
        scheduleCollectonView.reloadData()
    }
    @IBAction func showingAddingScheduleVC(_ sender: Any) {
        let AddingScheduleVC = self.storyboard?.instantiateViewController(withIdentifier: "AddingScheduleViewController")
        self.navigationController?.pushViewController(AddingScheduleVC!, animated: true)
    }
    
    func changeButtonBackgroundColor(button : UIButton){
        button.backgroundColor = UIColor(red: 1.00, green: 0.98, blue: 0.50, alpha: 0.9)
    }
}
