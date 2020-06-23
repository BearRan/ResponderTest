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
        testD()
    }
    
    func testA() {
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        
        
        let viewA = UIView(frame: CGRect.init(x: 50, y: 50, width: 100, height: 100))
        viewA.backgroundColor = .orange
        contentTestView.addSubview(viewA)
        
        let viewB = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        viewB.backgroundColor = .yellow
        viewA.addSubview(viewB)
        
        contentTestView.name = "bounds未修改, viewB.center\(viewB.center)"
    }
    
    func testB() {
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        
        let viewA = UIView(frame: CGRect.init(x: 50, y: 50, width: 100, height: 100))
        viewA.backgroundColor = .orange
        contentTestView.addSubview(viewA)
        
        viewA.bounds = CGRect.init(x: -25, y: -25, width: 100, height: 100)
        
        let viewB = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        viewB.backgroundColor = .yellow
        viewA.addSubview(viewB)
        
        contentTestView.name = "bounds修改后 viewA.bounds = CGRect.init(x: -25, y: -25, width: 100, height: 100), viewB.center\(viewB.center)"
    }
    
    func testC() {
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        
        let viewA = UIView(frame: CGRect.init(x: 50, y: 50, width: 100, height: 100))
        viewA.backgroundColor = .orange
        contentTestView.addSubview(viewA)
        
        viewA.bounds = CGRect.init(x: 25, y: 25, width: 100, height: 100)
        
        let viewB = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        viewB.backgroundColor = .yellow
        viewA.addSubview(viewB)
        
        contentTestView.name = "bounds修改后 viewA.bounds = CGRect.init(x: 25, y: 25, width: 100, height: 100), viewB.center\(viewB.center)"
    }
    
    func testD() {
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        
        let viewA = UIView(frame: CGRect.init(x: 50, y: 50, width: 100, height: 100))
        viewA.backgroundColor = .orange
        contentTestView.addSubview(viewA)
        
        let viewB = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        viewB.backgroundColor = .yellow
        viewA.addSubview(viewB)
        
        viewA.bounds = CGRect.init(x: -50, y: -50, width: 100, height: 100)
        viewB.center = CGPoint.init(x: 0, y: 0)
        
        contentTestView.name = "bounds修改后 viewA.bounds = CGRect.init(x: -50, y: -50, width: 100, height: 100), viewB.center\(viewB.center)"
    }

}
