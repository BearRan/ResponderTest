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

        self.showTouchLog = false
        testA()
        testB()
    }
    
    func testA() {
        let testViewWithGR :BaseViewWithGesture = {
            let view = BaseViewWithGesture(name: "testA")
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
    
    func testB() {
        let testViewWithGR :BaseViewWithGesture = {
            let view = BaseViewWithGesture(name: "testB")
            view.tapGR.cancelsTouchesInView = true
            
            return view
        }()
        
        let contentTestView = BaseContentView()
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "tapGR.cancelsTouchesInView = true"
        
        contentTestView.addSubview(testViewWithGR)
        testViewWithGR.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
    }
}
