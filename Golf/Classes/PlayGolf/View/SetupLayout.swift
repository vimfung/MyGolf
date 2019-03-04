//
//  SetupLayout.swift
//  Test
//
//  Created by 陈钢强 on 2019/3/5.
//  Copyright © 2019 陈钢强. All rights reserved.
//

import UIKit

extension BeginGolfController {
    func setupLayout() {
        toolBar.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.bottom.equalToSuperview()
        }
    }
    
}

//MARK:扩展cell数据的布局
extension ScoreCardCell {
    
    func setupLayout() {
        user1ScoreLabel.snp.makeConstraints { (make) in
            make.size.equalTo(60)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        user2ScoreLabel.snp.makeConstraints { (make) in
            make.size.equalTo(60)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        user3ScoreLabel.snp.makeConstraints { (make) in
            make.size.equalTo(60)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        user4ScoreLabel.snp.makeConstraints { (make) in
            make.size.equalTo(60)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        holeNameLabel.snp.makeConstraints { (make) in
            make.size.equalTo(60)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        holeView.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(50)
            make.left.equalTo(10)
            make.centerY.equalToSuperview()
        }
        usre1ScoreView.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(50)
            make.centerX.equalToSuperview().multipliedBy(CGFloat(0.6))
            make.centerY.equalToSuperview()
        }
        usre2ScoreView.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(50)
            make.centerX.equalToSuperview().multipliedBy(CGFloat(1))
            make.centerY.equalToSuperview()
        }
        usre3ScoreView.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(50)
            make.centerX.equalToSuperview().multipliedBy(CGFloat(1.4))
            make.centerY.equalToSuperview()
        }
        usre4ScoreView.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(50)
            make.centerX.equalToSuperview().multipliedBy(CGFloat(1.8))
            make.centerY.equalToSuperview()
        }
        
    }
}

//MARK:扩展header用户的布局
extension ScoreCardUserCell {
    func setupLayout() {
        addUserButton.snp.makeConstraints { (make) in
            make.size.equalTo(45)
            //make.centerX.equalToSuperview().dividedBy(4)
            make.left.equalTo(15)
            make.centerY.equalToSuperview()
        }
        
        user1ImageView.snp.makeConstraints { (make) in
            make.size.equalTo(50)
            make.centerX.equalToSuperview().multipliedBy(CGFloat(0.6))
            make.centerY.equalToSuperview()
        }
        user2ImageView.snp.makeConstraints { (make) in
            make.size.equalTo(50)
            //make.left.equalTo(user1ImageView.snp.right).offset(20)
            make.centerX.equalToSuperview().multipliedBy(CGFloat(1))
            make.centerY.equalToSuperview()
        }
        user3ImageView.snp.makeConstraints { (make) in
            make.size.equalTo(50)
            make.centerX.equalToSuperview().multipliedBy(CGFloat(1.4))
            make.centerY.equalToSuperview()
        }
        user4ImageView.snp.makeConstraints { (make) in
            make.size.equalTo(50)
            make.centerX.equalToSuperview().multipliedBy(CGFloat(1.8))
            make.centerY.equalToSuperview()
        }
        dividerLineView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
        
    }
}


extension ScoreCardResultCell {
    
    func setupLayout() {
        parTotalScoreLabel.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.height.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(CGFloat(0.7))
            make.centerX.equalToSuperview()
        }
        parTotalNumberLabel.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.height.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(CGFloat(1.4))
            make.centerX.equalToSuperview()
        }
        parTotalScoreView.snp.makeConstraints { (make) in
            make.size.equalTo(60)
            //make.centerX.equalToSuperview().dividedBy(4)
            make.left.equalTo(10)
            make.centerY.equalToSuperview()
        }
        usre1TotalScore.snp.makeConstraints { (make) in
            make.size.equalTo(60)
            make.centerX.equalToSuperview().multipliedBy(CGFloat(0.6))
            make.centerY.equalToSuperview()
        }
        usre2TotalScore.snp.makeConstraints { (make) in
            make.size.equalTo(60)
            //make.left.equalTo(user1ImageView.snp.right).offset(20)
            make.centerX.equalToSuperview().multipliedBy(CGFloat(1))
            make.centerY.equalToSuperview()
        }
        usre3TotalScore.snp.makeConstraints { (make) in
            make.size.equalTo(60)
            make.centerX.equalToSuperview().multipliedBy(CGFloat(1.4))
            make.centerY.equalToSuperview()
        }
        usre4TotalScore.snp.makeConstraints { (make) in
            make.size.equalTo(60)
            make.centerX.equalToSuperview().multipliedBy(CGFloat(1.8))
            make.centerY.equalToSuperview()
        }
        dividerLineView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.top.equalToSuperview()
        }
        
    }
}


