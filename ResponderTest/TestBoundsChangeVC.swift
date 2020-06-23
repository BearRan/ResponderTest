//
//  TestBoundsChangeVC.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/23.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit

class TestBoundsChangeVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        testA()
        testB()
        testC()
    }
    
    func testA() {
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "bounds未修改"
        
        let viewA = UIView(frame: CGRect.init(x: 50, y: 50, width: 100, height: 100))
        viewA.backgroundColor = .orange
        contentTestView.addSubview(viewA)
        
        let viewB = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        viewB.backgroundColor = .yellow
        viewA.addSubview(viewB)
    }
    
    func testB() {
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "bounds修改后 viewA.bounds = CGRect.init(x: -25, y: -25, width: 100, height: 100)"
        
        let viewA = UIView(frame: CGRect.init(x: 50, y: 50, width: 100, height: 100))
        viewA.backgroundColor = .orange
        contentTestView.addSubview(viewA)
        
        viewA.bounds = CGRect.init(x: -25, y: -25, width: 100, height: 100)
        
        let viewB = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        viewB.backgroundColor = .yellow
        viewA.addSubview(viewB)
    }
    
    func testC() {
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "bounds修改后 viewA.bounds = CGRect.init(x: 25, y: 25, width: 100, height: 100)"
        
        let viewA = UIView(frame: CGRect.init(x: 50, y: 50, width: 100, height: 100))
        viewA.backgroundColor = .orange
        contentTestView.addSubview(viewA)
        
        viewA.bounds = CGRect.init(x: 25, y: 25, width: 100, height: 100)
        
        let viewB = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        viewB.backgroundColor = .yellow
        viewA.addSubview(viewB)
    }

}
