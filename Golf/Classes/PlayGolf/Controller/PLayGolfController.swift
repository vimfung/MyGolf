//
//  PLayGolfController.swift
//  Test
//
//  Created by 陈钢强 on 2019/3/5.
//  Copyright © 2019 陈钢强. All rights reserved.
//

import UIKit

class PLayGolfController: UIViewController {
    
    lazy var beginButton: UIButton = {
        let button = UIButton()
        button.setTitle("进入记分界面", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.9, alpha: 0.5)
        button.addTarget(self, action: #selector(beginButtonPress), for: .touchUpInside)
        return button
    }()
    
    lazy var addUser: UIButton = {
        let button = UIButton()
        button.setTitle("增加用户界面", for: .normal)
        button.backgroundColor = UIColor(white: 0.9, alpha: 0.5)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(addUserButtonPress), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(beginButton)
        view.addSubview(addUser)
        
        
        beginButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview()     //距离左边20
            make.right.equalToSuperview()    //距离右边20，注意，这里要为负的20
            make.top.equalTo(150)
            make.height.equalTo(50)
        }
        addUser.snp.makeConstraints { (make) in
            make.top.equalTo(beginButton.snp.bottom).offset(30)      //顶部靠着box1底部
            make.left.right.height.equalTo(beginButton)    //左右高和box1对齐
            
        }
        

        // Do any additional setup after loading the view.
    }
    

    @objc func beginButtonPress() {
        print(213)
        let layout = UICollectionViewFlowLayout()
        let beginGolf = BeginGolfController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(beginGolf, animated: true)
    }
    @objc func addUserButtonPress() {
        print(213)
       
        let addUser = PlayerProfileController()
        self.navigationController?.pushViewController(addUser, animated: true)
        
    }
    
}
