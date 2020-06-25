//
//  TestButtonVC.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/25.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit

class TestButtonVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        testA()
    }
    

    func testA() {
        let contentTestView = BaseContentView()
        
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "view(contain gesture)+button"
        
        let testBtnA = BaseButton(name: "buttonA", ifNeedDefaultEvent: false)
        testBtnA.backgroundColor = .brown
        contentTestView.addSubview(testBtnA)
        testBtnA.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(50)
        }
        
        testBtnA.addTarget(self, action: #selector(touchUpInsideA), for: .touchUpInside)
        testBtnA.addTarget(self, action: #selector(touchUpInsideB), for: .touchUpInside)
        testBtnA.addTarget(self, action: #selector(touchUpOutside), for: .touchUpOutside)
    }
    
    @objc func touchUpInsideA() {
        print("--touchUpInsideA")
    }
    
    @objc func touchUpInsideB() {
        print("--touchUpInsideB")
    }
    
    @objc func touchUpOutside() {
        print("--touchUpOutside")
    }
}
