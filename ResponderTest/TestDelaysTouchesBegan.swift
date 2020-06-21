//
//  TestDelaysTouchesBegan.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/21.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit

class TestDelaysTouchesBegan: BaseViewController {

     override func viewDidLoad() {
           super.viewDidLoad()

           self.showTouchLog = true
           
           testA()
           testB()
       }
       
       func testA() {
           let testViewWithGR :BaseViewWithGesture = {
               let view = BaseViewWithGesture(name: "testA")
//               view.showHitTestLog = true
               view.showTouchLog = true
               view.tapGR.delaysTouchesBegan = false
               
               return view
           }()
           
           let contentTestView = BaseContentView()
           self.stackView.addArrangedSubview(contentTestView)
           contentTestView.name = "tapGR.delaysTouchesBegan = false (default)"
           
           contentTestView.addSubview(testViewWithGR)
           testViewWithGR.snp.makeConstraints { (make) in
               make.width.height.equalTo(100)
               make.centerX.centerY.equalToSuperview()
           }
       }
       
       func testB() {
           let testViewWithGR :BaseViewWithGesture = {
               let view = BaseViewWithGesture(name: "testB")
//               view.showHitTestLog = true
               view.showTouchLog = true
               view.tapGR.delaysTouchesBegan = true
               
               return view
           }()
           
           let contentTestView = BaseContentView()
           self.stackView.addArrangedSubview(contentTestView)
           contentTestView.name = "tapGR.delaysTouchesBegan = true"
           
           contentTestView.addSubview(testViewWithGR)
           testViewWithGR.snp.makeConstraints { (make) in
               make.width.height.equalTo(100)
               make.centerX.centerY.equalToSuperview()
           }
       }

}
