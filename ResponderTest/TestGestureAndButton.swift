//
//  TestGestureAndButton.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/22.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit

class TestGestureAndButton: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.showTouchLog = true
        
        testA()
        testB_0()
        testB_1()
        testC()
    }
    
    func testA() {
        let testViewWithGR :BaseViewWithGesture = {
            let view = BaseViewWithGesture(name: "testA")
            view.showHitTestLog = true
            view.showTouchLog = true
            
            return view
        }()
        
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "view(contain gesture)+button(have event)"
        
        contentTestView.addSubview(testViewWithGR)
        testViewWithGR.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
        
        
        let testBtn = BaseButton(name: "buttonA")
        testBtn.backgroundColor = .brown
        testViewWithGR.addSubview(testBtn)
        testBtn.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func testB_0() {
        let testViewWithGR :BaseViewWithGesture = {
            let view = BaseViewWithGesture(name: "testB_0")
            view.showHitTestLog = true
            view.showTouchLog = true
            
            return view
        }()
        
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "view(contain gesture)+button(enable, no event)"
        
        contentTestView.addSubview(testViewWithGR)
        testViewWithGR.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
        
        
        let testBtn = BaseButton(name: "buttonB_0", ifNeedDefaultEvent: false)
        testBtn.backgroundColor = .brown
        testViewWithGR.addSubview(testBtn)
        testBtn.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func testB_1() {
        let testViewWithGR :BaseViewWithGesture = {
            let view = BaseViewWithGesture(name: "testB_1")
            view.showHitTestLog = true
            view.showTouchLog = true
            
            return view
        }()
        
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "view(contain gesture)+button(disable, no event)"
        
        contentTestView.addSubview(testViewWithGR)
        testViewWithGR.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
        
        
        let testBtn = BaseButton(name: "buttonB_1", ifNeedDefaultEvent: false)
        testBtn.isEnabled = false
        testBtn.backgroundColor = .brown
        testViewWithGR.addSubview(testBtn)
        testBtn.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func testC() {
        let testViewWithGR :BaseViewWithGesture = {
            let view = BaseViewWithGesture(name: "testC")
            view.showHitTestLog = true
            view.showTouchLog = true
            
            return view
        }()
        
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "view(contain gesture)+button(contain gesture)"
        
        contentTestView.addSubview(testViewWithGR)
        testViewWithGR.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
        
        
        let testBtn = BaseButtonWithGesture(name: "buttonC")
        testBtn.backgroundColor = .brown
        testViewWithGR.addSubview(testBtn)
        testBtn.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    @objc func tapEvent() {
        print("--tapEvent")
    }

}
