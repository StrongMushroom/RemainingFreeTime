//
//  ACollectionViewCell.swift
//  RemainingFreeTime
//
//  Created by 상일여고이 on 2018. 7. 10..
//  Copyright © 2018년 victory. All rights reserved.
//

import UIKit

class ACollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate{
    @IBOutlet weak var scheduleNameLabel: UILabel!
    @IBOutlet weak var scheduleTimeLabel: UILabel!
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    @IBOutlet weak var saturdayLabel: UILabel!
    @IBOutlet weak var sundayLabel: UILabel!
    var cellLabel : UILabel!
    var deleteLabel : UILabel!
    var deleteBtn : UIButton!
    var pan : UIPanGestureRecognizer!
    override init(frame: CGRect) {
        super.init(frame: frame)
        gestureInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        gestureInit()
    }
    func gestureInit(){
        //contentView가 뭐지? 내가 스토리보드에서 만든애들은 다 여기로 들어가네
        self.contentView.backgroundColor = UIColor.white
        //콜렉션뷰셀의 색
        self.backgroundColor = UIColor.white
        //아니 라벨 스토리보드에 추가해서 하면 왜 안되는거지
        cellLabel = UILabel()
        cellLabel.backgroundColor = UIColor(red: 0.34, green: 0.337, blue: 0.125, alpha: 0.9)
        cellLabel.textColor = UIColor.white
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(cellLabel)
        cellLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        cellLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        cellLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        cellLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        deleteBtn = UIButton()
        self.insertSubview(deleteBtn, belowSubview: self.contentView)
        deleteLabel = UILabel()
        //텍스트 가운데 오게.이렇게 말고
        deleteLabel.text = " delete"
        deleteLabel.textColor = UIColor.white
        deleteLabel.backgroundColor = UIColor.red
        self.insertSubview(deleteLabel, belowSubview: self.deleteBtn)
        
        pan = UIPanGestureRecognizer(target: self, action: #selector(onPan(pan:)))
        pan.delegate = self
        self.addGestureRecognizer(pan)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if pan.state == UIGestureRecognizerState.changed{
            let p: CGPoint = pan.translation(in: self)
            let width = self.contentView.frame.width
            let height = self.contentView.frame.height
            self.contentView.frame = CGRect(x: p.x,y: 0, width: width, height: height)
            self.deleteBtn.frame = CGRect(x: width - width*0.15, y: 0, width: width*0.15, height: height)
            self.deleteLabel.frame = CGRect(x: width - width*0.15, y: 0, width: width*0.15, height: height)
        }
    }
    @objc func onPan(pan: UIPanGestureRecognizer) {
        let p: CGPoint = pan.translation(in: self)
        NSLog("움직임을 봅시다 : \(p)")
        let width = self.contentView.frame.width
        let height = self.contentView.frame.height
        deleteBtn.addTarget(self, action: #selector(btnTouched(sender:)), for: UIControlEvents.touchUpInside)
        if pan.state == UIGestureRecognizerState.began{
        }else if pan.state == UIGestureRecognizerState.changed{
            //이해안감 반대로 해야 되는게 정상아닌가
            if p.x > -width*0.15{
                NSLog("이 안으로 들어오나요?")
                self.setNeedsLayout()
            }else{
                print("여기여기여깅!!!!!!!!")
                self.contentView.frame = CGRect(x: -width*0.15,y: 0, width: width, height: height)
            }
        }else{
            if p.x > -width*0.15{
                UIView.animate(withDuration: 0.2, animations: {
                    self.setNeedsLayout()
                    self.layoutIfNeeded()
                })
            }
        }
    }
    @objc func btnTouched(sender: Any){
        let collectionView: UICollectionView = self.superview as! UICollectionView
        let indexPath = collectionView.indexPathForItem(at: self.center)!
        collectionView.delegate?.collectionView!(collectionView, performAction: #selector(onPan(pan:)), forItemAt: indexPath, withSender: nil)
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return abs((pan.velocity(in: pan.view)).x) > abs((pan.velocity(in: pan.view)).y)
    }
}
