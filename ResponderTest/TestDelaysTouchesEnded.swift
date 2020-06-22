//
//  TestDelaysTouchesEnded.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/21.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit

class TestDelaysTouchesEnded: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.showTouchLog = true
        
        testA()
        testB()
    }
    
    func testA() {
        let testViewWithGR :BaseViewWithGesture = {
            let view = BaseViewWithGesture(name: "testA")
//            view.showHitTestLog = true
            view.showTouchLog = true
            view.tapGR.delaysTouchesEnded = true
            
            view.longPressGR.isEnabled = true
            view.longPressGR.delaysTouchesEnded = true
            
            return view
        }()
        
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "tapGR.delaysTouchesEnded = true (default)"
        
        contentTestView.addSubview(testViewWithGR)
        testViewWithGR.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func testB() {
        let testViewWithGR :BaseViewWithGesture = {
            let view = BaseViewWithGesture(name: "testB")
//            view.showHitTestLog = true
            view.showTouchLog = true
            view.tapGR.delaysTouchesEnded = false
            
            view.longPressGR.isEnabled = true
            view.longPressGR.delaysTouchesEnded = true
            
            return view
        }()
        
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "tapGR.delaysTouchesEnded = false"
        
        contentTestView.addSubview(testViewWithGR)
        testViewWithGR.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
    }

}
