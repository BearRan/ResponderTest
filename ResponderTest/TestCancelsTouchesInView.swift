//
//  TestGestureVC1.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/21.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit

class TestCancelsTouchesInView: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.showTouchLog = true
        
        test0()
        testA()
        testB()
    }
    
    func test0() {
        let testViewWithGR :BaseView = {
            let view = BaseView(name: "test0")
            view.showHitTestLog = true
            view.showTouchLog = true
            view.backgroundColor = .orange
            
            return view
        }()
        
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "No gesture"
        
        contentTestView.addSubview(testViewWithGR)
        testViewWithGR.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func testA() {
        let testViewWithGR :BaseViewWithGesture = {
            let view = BaseViewWithGesture(name: "testA")
            view.showHitTestLog = true
            view.showTouchLog = true
            view.tapGR.cancelsTouchesInView = true
            
            return view
        }()
        
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "tapGR.cancelsTouchesInView = true (default)"
        
        contentTestView.addSubview(testViewWithGR)
        testViewWithGR.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func testB() {
        let testViewWithGR :BaseViewWithGesture = {
            let view = BaseViewWithGesture(name: "testB")
            view.showHitTestLog = true
            view.showTouchLog = true
            view.tapGR.cancelsTouchesInView = false
            
            return view
        }()
        
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "tapGR.cancelsTouchesInView = false"
        
        contentTestView.addSubview(testViewWithGR)
        testViewWithGR.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
    }
}
