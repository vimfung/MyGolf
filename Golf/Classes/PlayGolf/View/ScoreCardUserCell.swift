//
//  ScoreCardUserCell.swift
//  Test
//
//  Created by 陈钢强 on 2019/3/4.
//  Copyright © 2019 陈钢强. All rights reserved.
//

import UIKit
import SnapKit

class ScoreCardUserCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame:frame)
        //设置UI界面
        setupView()
    }
    
//    let textLabel : UILabel = {
//        let lb = UILabel()
//        lb.text = "Header"
//        lb.translatesAutoresizingMaskIntoConstraints = false
//        return lb
//
//    }()
    
    lazy var addUserButton: UIButton = {
        let button = UIButton()
        //adb.backgroundColor = UIColor.red
        button.setImage(UIImage(named: "plus-circle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(addUser), for: .touchUpInside)
        return button
    }()
    
    @objc func addUser() {
        print("aaaa")
        
        
       
    }
    
    let user1ImageView: UIImageView = {
        let imv = UIImageView()
        imv.image = UIImage(named: "user1")
        imv.layer.cornerRadius = 25
        imv.clipsToBounds = true
        return imv
        
    }()
    let user2ImageView: UIImageView = {
        let imv = UIImageView()
        imv.image = UIImage(named: "user2")
        imv.layer.cornerRadius = 25
        imv.clipsToBounds = true
        return imv
        
    }()
    let user3ImageView: UIImageView = {
        let imv = UIImageView()
        imv.image = UIImage(named: "user3")
        imv.layer.cornerRadius = 25
        imv.clipsToBounds = true
        return imv
        
    }()
    let user4ImageView: UIImageView = {
        let imv = UIImageView()
        imv.image = UIImage(named: "user4")
        imv.layer.cornerRadius = 25
        imv.clipsToBounds = true
        return imv
        
    }()
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    func setupView() {
        
        
        addSubview(addUserButton)
        addSubview(user1ImageView)
        addSubview(user2ImageView)
        addSubview(user3ImageView)
        addSubview(user4ImageView)
        addSubview(dividerLineView)
        
        setupLayout()
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
