//
//  User.swift
//  Test
//
//  Created by 陈钢强 on 2019/3/4.
//  Copyright © 2019 陈钢强. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: String?
    var profileImageName: String?
    var grossScore: String?
    var holeScore: String?
}

class HoleData: NSObject {
    var holeNumber: String?
    var par: Int?
    
    var user: User?
}

extension BeginGolfController {
    func setupData() {
 
        let greg = User()
        greg.name = "陈钢强"
        greg.profileImageName = "greg"
        greg.grossScore = "102"
        greg.holeScore = "7"
        
        let jolin = User()
        jolin.name = "刘德华"
        jolin.profileImageName = "user3"
        jolin.grossScore = "86"
        jolin.holeScore = "5"
        
        let h1 = HoleData()
        h1.user = greg
        h1.holeNumber = "1"
        h1.par = 5
        
        let h2 = HoleData()
        h2.user = jolin
        h2.holeNumber = "2"
        h2.par = 5
        
        testHoleData = [h1, h2]
    }
}


