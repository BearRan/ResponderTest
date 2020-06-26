//
//  TestButtonVC.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/25.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit

class TestButtonVC: BaseViewController {

    var tmpPerson: TestPerson?
    override func viewDidLoad() {
        super.viewDidLoad()

        testA()
        testB()
        testC()
//        getBtnProperties()
//        getBtnFunctions()
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
    
    func testB() {
        let contentTestView = BaseContentViewA()
        
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "target=nil"
        
        let testBtnA = BaseButton(name: "buttonB", ifNeedDefaultEvent: false)
        testBtnA.backgroundColor = .brown
        contentTestView.addSubview(testBtnA)
        testBtnA.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(50)
        }
        
        testBtnA.addTarget(nil, action: #selector(touchUpInsideA), for: .touchUpInside)
    }
    
    func testC() {
        let contentTestView = BaseContentViewA()
        
        self.stackView.addArrangedSubview(contentTestView)
        contentTestView.name = "target=TestPerson"
        
        let testBtnA = TmpBaseButton(name: "buttonC", ifNeedDefaultEvent: false)
        testBtnA.backgroundColor = .brown
        contentTestView.addSubview(testBtnA)
        testBtnA.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(50)
        }
        
        let person = TestPerson()
        self.tmpPerson = person
        testBtnA.addTarget(person, action: person.sel, for: .touchUpInside)
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
    
    func getBtnProperties() {
        let btn = UIButton()
        let cls: AnyClass? = object_getClass(btn)
        var count: UInt32 = 0
        let plist = class_copyPropertyList(cls, &count)
        
        print("===开始获取属性名")
        for item in 0..<count {
            let property = plist?[Int(item)]
            let cname = property_getName(property!)
            let name = String(cString: cname)
            print("property: <\(name)>")
            
            if let attr = property_getAttributes(property!) {
                let attrName = String(cString: attr)
                print("attrName: <\(attrName)>")
            }
        }
        print("===结束获取属性名")
    }
    
    func getBtnFunctions() {
        let btn = UIButton()
        let cls: AnyClass? = object_getClass(btn)
        var count: UInt32 = 0
        let plist = class_copyMethodList(cls, &count)
        
        print("===开始获取方法名")
        for item in 0..<count {
            let property = plist?[Int(item)]
            let m = method_getName(property!)
            let name = NSStringFromSelector(m)
            
            print("Function: <\(name)>")
        }
        print("===结束获取方法名")
    }
}

class BaseContentViewA: BaseContentView {
    @objc func touchUpInsideA() {
        print("--BaseContentViewA touchUpInsideA")
    }
}

class TmpBaseButton: BaseButton {
    @objc func testEvent() {
        print("--TmpBaseButton testEvent")
    }
}
class TestPerson: NSObject {
    let sel: Selector = #selector(testEvent)
    @objc func testEvent() {
        print("--TestPerson testEvent")
    }
    
    deinit {
        print("--TestPerson deinit")
    }
}
