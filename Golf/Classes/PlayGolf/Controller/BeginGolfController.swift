//
//  HomeController.swift
//  Test
//
//  Created by 陈钢强 on 2019/3/4.
//  Copyright © 2019 陈钢强. All rights reserved.
//

import UIKit

class BeginGolfController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellID"
    let headerId = "headerID"
    let footerId = "footerId"
    // toolbar
    lazy var toolBar: UIToolbar = {
        let toolBar = UIToolbar()
        //创建后退按钮
        let digitalbutton =  UIBarButtonItem(image:UIImage(named:"digital-2"),
                                       style: .plain, target:self,
                                       action:nil)
        //第一个分隔按钮
        let btngap1 =  UIBarButtonItem(barButtonSystemItem:.flexibleSpace,
                                       target:nil,
                                       action:nil)
        // 创建前进按钮 UIBarButtonItem
        let shareButton = UIBarButtonItem(image:UIImage(named:"fenxiang"),
                                         style: .plain, target:self,
                                         action:#selector(toolBarButtonTest))
        
        //添加按钮
        toolBar.setItems([digitalbutton, btngap1,  shareButton], animated: false)
        return toolBar
        
    }()
    @objc func toolBarButtonTest() {
        print("toolBar botton Pressed")
    }
    //测试数据
    var testHoleData: [HoleData]?
    //MARK: 启动
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Golf"
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(ScoreCardCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(ScoreCardUserCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(ScoreCardResultCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
        
        
        //测试数据
        setupData()
        
        //toolbar
        self.view.addSubview(toolBar)
        //设置导航栏
        setupNavigationBar()
        //设置layout
        setupLayout()
        
    }
    
    //MARK:- 设置导航栏
    func setupNavigationBar() {
    
        let img = UIImage(named: "xinxi")
        let right = UIBarButtonItem(image: img, style: UIBarButtonItem.Style.plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = right

    }
    
    
    //MARK:- 内容数量
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = testHoleData?.count {
            return count
        }
        return 0
    }
    //MARK:- 内容cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScoreCardCell
        if let testData = testHoleData?[indexPath.item] {
            cell.testData = testData
        }
        return cell
    }
    
    func finishAddUser() {
        print("Finish Add user in BeginGolfController")
    }
    
    //MARK:- 内容高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    //MARK:- header设置
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! ScoreCardUserCell
            header.backgroundColor = UIColor.white
            
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath) as! ScoreCardResultCell
            footer.backgroundColor = UIColor.white
            return footer
        }
        
    }
    //header高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 80)
    }
    
    //MARK:- footer设置
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 80)
    }
    
    
    
}









