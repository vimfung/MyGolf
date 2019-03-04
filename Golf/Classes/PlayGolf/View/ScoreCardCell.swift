//
//  ScoreCardCell.swift
//  Test
//
//  Created by 陈钢强 on 2019/3/4.
//  Copyright © 2019 陈钢强. All rights reserved.
//

import UIKit

class ScoreCardCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame:frame)
        //设置UI界面
        setupView()
    }
    
    var testData: HoleData? {
        didSet {
            
            //传了用户1和洞的数据
            if let holeNumber = testData?.holeNumber {
                holeNameLabel.text = holeNumber
            }
            if let holeScore = testData?.user?.holeScore {
                user1ScoreLabel.text = holeScore
            }
            //
        }
    }
    //MARK:- 属性定义
    let user1ScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "N"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment=NSTextAlignment.center
        return label
    }()
    let user2ScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "N"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment=NSTextAlignment.center
        return label
    }()
    let user3ScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "N"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment=NSTextAlignment.center
        return label
    }()
    let user4ScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "N"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment=NSTextAlignment.center
        return label
    }()

    let holeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "N"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment=NSTextAlignment.center
        return label
    }()
    let holeView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor.purple
        return view
    }()
    let usre1ScoreView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = UIColor(red: 228/255, green: 253/255, blue: 224/255, alpha: 1)
        return view
    }()
    let usre2ScoreView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = UIColor(red: 253/255, green: 249/255, blue: 225/255, alpha: 1)
        return view
    }()
    let usre3ScoreView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = UIColor(red: 251/255, green: 236/255, blue: 223/255, alpha: 1)
        return view
    }()
    let usre4ScoreView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = UIColor(red: 249/255, green: 223/255, blue: 223/255, alpha: 1)
        return view
    }()
    
    func setupView() {
        //backgroundColor = UIColor.yellow
        
        addSubview(holeView)
        addSubview(usre1ScoreView)
        addSubview(usre2ScoreView)
        addSubview(usre3ScoreView)
        addSubview(usre4ScoreView)
        holeView.addSubview(holeNameLabel)
        usre1ScoreView.addSubview(user1ScoreLabel)
        usre2ScoreView.addSubview(user2ScoreLabel)
        usre3ScoreView.addSubview(user3ScoreLabel)
        usre4ScoreView.addSubview(user4ScoreLabel)
        
        setupLayout()
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
