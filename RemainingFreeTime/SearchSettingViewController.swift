//
//  SearchSettingViewController.swift
//  RemainingFreeTime
//
//  Created by 상일여고이 on 2018. 7. 11..
//  Copyright © 2018년 victory. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class SearchSettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeItem as String)
        attributeSet.title = title
        attributeSet.keywords = title?.components(separatedBy: "")
        
        let searchableItem = CSSearchableItem(uniqueIdentifier: title, domainIdentifier: nil, attributeSet: attributeSet)
        var searchableItems: [CSSearchableItem] = []
        searchableItems.append(searchableItem)
        CSSearchableIndex.default().indexSearchableItems(searchableItems, completionHandler: nil)
    }

    
}
