//
//  ScoreCardResultCell.swift
//  Test
//
//  Created by 陈钢强 on 2019/3/4.
//  Copyright © 2019 陈钢强. All rights reserved.
//

import UIKit
class ScoreCardResultCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame:frame)
        //设置UI界面
        setupView()
    }
    let parTotalScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "总计"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment=NSTextAlignment.center
        return label
    }()
    let parTotalNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "标准杆 72"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment=NSTextAlignment.center
        return label
    }()
    
    let parTotalScoreView: UIView = {
        let parTotalScore = UIView()
        //parTotalScore.backgroundColor = UIColor.purple
        return parTotalScore
        
    }()
    
    let usre1TotalScore: UILabel = {
        let userLabel = UILabel()
        userLabel.text = "97"
        userLabel.font = UIFont.boldSystemFont(ofSize: 30)
        userLabel.textAlignment=NSTextAlignment.center
        return userLabel
        
    }()
    let usre2TotalScore: UILabel = {
        let userLabel = UILabel()
        userLabel.text = "104"
        userLabel.font = UIFont.boldSystemFont(ofSize: 30)
        userLabel.textAlignment=NSTextAlignment.center
        return userLabel
        
    }()
    let usre3TotalScore: UILabel = {
        let userLabel = UILabel()
        userLabel.text = "74"
        userLabel.font = UIFont.boldSystemFont(ofSize: 30)
        userLabel.textAlignment=NSTextAlignment.center
        return userLabel
        
    }()
    let usre4TotalScore: UILabel = {
        let userLabel = UILabel()
        userLabel.text = "120"
        userLabel.font = UIFont.boldSystemFont(ofSize: 30)
        userLabel.textAlignment=NSTextAlignment.center
        return userLabel
        
    }()
    //一条线
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    func setupView() {
        backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        
        addSubview(parTotalScoreView)
        addSubview(usre1TotalScore)
        addSubview(usre2TotalScore)
        addSubview(usre3TotalScore)
        addSubview(usre4TotalScore)
        addSubview(dividerLineView)
        parTotalScoreView.addSubview(parTotalScoreLabel)
        parTotalScoreView.addSubview(parTotalNumberLabel)
        
        setupLayout()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
