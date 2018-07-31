//
//  ScheduleCollectionViewController.swift
//  RemainingFreeTime
//
//  Created by 상일여고일 on 2018. 7. 6..
//  Copyright © 2018년 victory. All rights reserved.
//

import UIKit

class ScheduleCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate{
    // UISearchControllerDelegate : 검색 컨트롤러 개체에 대한 대리자 메서드 집합
    // UISearchBarDelegate : 검색 막대 컨트롤 기능을 구현하기 위해 구현하는 선택적 메서드 모음
    // UISearchResultsUpdating : 사용자가 검색 창에 입력 한 정보를 기반으로 검색 결과를 업데이트 할 수 있는 메서드 집합
    @IBOutlet weak var scheduleCollectonView: UICollectionView!
    // search bar 연결시킴!
    @IBOutlet weak var scheduleSearchBar: UISearchBar!
    var scheduleInfoModel : ScheduleInfoModel = ScheduleInfoModel()
    var scheduleArray : Array<[String:String]> = []
    var scheduleNameArray : [String] = []
    var filtered:[String] = []
    var searchActive : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleCollectonView.dataSource = self
        scheduleCollectonView.delegate = self
        scheduleSearchBar.delegate = self

    }
    override func viewWillAppear(_ animated: Bool){
        scheduleArray = scheduleInfoModel.setScheduleDatafromUserDefaults()
        for a in scheduleArray {
            scheduleNameArray.append(a["name"]!)
        }
        scheduleCollectonView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let scheduleCell = scheduleCollectonView.dequeueReusableCell(withReuseIdentifier: "aCell", for: indexPath) as! ACollectionViewCell
        if searchActive {
            scheduleCell.scheduleNameLabel.text = filtered[indexPath.row]
        }else{
            scheduleCell.scheduleNameLabel.text = scheduleArray[indexPath.row]["name"]
        }
        scheduleCell.scheduleTimeLabel.text = scheduleArray[indexPath.row]["startTime"]! + "~" + scheduleArray[indexPath.row]["finishTime"]!
        /*
         scheduleCell.mondayLabel.text = filtered[indexPath.row]
        scheduleCell.tuesdayLabel.text = filtered[indexPath.row]
        scheduleCell.wednesdayLabel.text = filtered[indexPath.row]
        scheduleCell.thursdayLabel.text = filtered[indexPath.row]
        scheduleCell.fridayLabel.text = filtered[indexPath.row]
        scheduleCell.saturdayLabel.text = filtered[indexPath.row]
        scheduleCell.sundayLabel.text = filtered[indexPath.row]
         */
        
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //혹시 설치 엑티브된 상태에서도 필요? 나중에 확인
        let modifyCellVC = self.storyboard?.instantiateViewController(withIdentifier: "ModifyCellViewController") as! ModifyCellViewController
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
        self.navigationController?.pushViewController(modifyCellVC, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        scheduleArray.remove(at: indexPath.row)
        scheduleNameArray.remove(at: indexPath.row)
        scheduleInfoModel.setScheduleDataIntoUserDefaults(scheduleArray: scheduleArray)
        collectionView.reloadData()
    }
    
    // search 관련 함수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchActive {
            return filtered.count
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
        filtered = scheduleNameArray.filter({ (item) -> Bool in
            let countryText: NSString = item as NSString
            return (countryText.range(of: searchString, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
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
