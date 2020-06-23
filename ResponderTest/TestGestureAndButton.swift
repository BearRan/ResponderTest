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
        testB()
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
        contentTestView.name = "view(contain gesture)+button"
        
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
    
    func testB() {
        let testViewWithGR :BaseViewWithGesture = {
            let view = BaseViewWithGesture(name: "testB")
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
        
        
        let testBtn = BaseButtonWithGesture(name: "buttonB")
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
