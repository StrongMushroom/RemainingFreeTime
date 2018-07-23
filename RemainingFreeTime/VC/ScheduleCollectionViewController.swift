//
//  ScheduleCollectionViewController.swift
//  RemainingFreeTime
//
//  Created by 상일여고일 on 2018. 7. 6..
//  Copyright © 2018년 victory. All rights reserved.
//

import UIKit

class ScheduleCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating{
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
    let searchController = UISearchController(searchResultsController: nil)
    // UISearchController : 검색 막대와의 상호 작용을 기반으로 검색 결과의 표시를 관리하는 보기 컨트롤러
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleCollectonView.dataSource = self
        scheduleCollectonView.delegate = self
        // 검색 결과 콘트롤러의 내용의 갱신을 실시하는 오브젝트
        self.searchController.searchResultsUpdater = self
        // searchController의 대리자
        self.searchController.delegate = self
        // 인터페이스에 설치할 검색 창(의 대리자?)
        self.searchController.searchBar.delegate = self
        // 탐색 할 때 탐색 막대를 숨겨야 하는지 여부를 나타내는 불 값
        self.searchController.hidesNavigationBarDuringPresentation = false
        // 검색 중에 기본 컨텐츠가 흐리게 표시되는지 여부를 나타내는 불 값
        self.searchController.dimsBackgroundDuringPresentation = false
        // 검색 중에 기본 내용이 가려져 있는지 여부를 나타내는 불 값
        self.searchController.obscuresBackgroundDuringPresentation = false
        // 인터페이스에 설치할 검색 창(수신기 뷰를 크기 조정하고 이동하여 서브 뷰를 둘러 쌉니다.)
        searchController.searchBar.sizeToFit()
        // 인터페이스에 설치할 검색 창(uikit에게 이 객체를 윈도우의 첫 번째 응답자로 만들도록 요청합니다.)
        searchController.searchBar.becomeFirstResponder()
        // 리시버가 최상위 항목 일 때 탐색 모음의 가운데에 표시되는 사용자 정의보기 (? 무슨 소리람 이게)
        self.navigationItem.titleView = searchController.searchBar
    }
    override func viewWillAppear(_ animated: Bool){
        scheduleArray = scheduleInfoModel.setScheduleDatafromUserDefaults()
        for a in scheduleArray {
            scheduleNameArray.append(a["name"]!)
        }
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
    
    func updateSearchResults(for searchController: UISearchController)
    {
        let searchString = searchController.searchBar.text
        filtered = scheduleNameArray.filter({ (item) -> Bool in
            let countryText: NSString = item as NSString
            
            return (countryText.range(of: searchString!, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
        })
        scheduleCollectonView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
        scheduleCollectonView.reloadData()
    }
    
    
    @IBAction func showingAddingScheduleVC(_ sender: Any) {
        let AddingScheduleVC = self.storyboard?.instantiateViewController(withIdentifier: "AddingScheduleViewController")
        self.navigationController?.pushViewController(AddingScheduleVC!, animated: true)
    }
}
