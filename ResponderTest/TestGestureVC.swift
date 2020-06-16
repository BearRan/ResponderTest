//
//  TestGestureVC.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/16.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit

class TestGestureVC: BaseViewController {

    let viewA = BaseView(name: "viewA")
    let viewB = BaseView(name: "viewB")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
    }
    
    // MARK: - Create UI
    fileprivate func createUI() {
        self.view.addSubview(viewA)
        viewA.backgroundColor = .orange
        viewA.snp.makeConstraints { (make) in
            make.width.height.equalTo(200)
            make.centerX.centerY.equalToSuperview()
        }
        
        self.viewA.addSubview(self.viewB)
        viewB.backgroundColor = .blue
        viewB.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
    }
}
