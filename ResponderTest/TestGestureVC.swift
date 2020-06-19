//
//  TestGestureVC.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/16.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit
import RxSwift
import NSObject_Rx
import RxRelay
import RxCocoa

class TestGestureVC: BaseViewController {

    lazy var viewA :BaseView = {
        let view = BaseView(name: "viewA")
        view.showHitTestLog = false
        view.showTouchLog = true
//        view.gestureShouldBegin = false
        
        
//        let tapGRA = UITapGestureRecognizer(target: self, action: #selector(tapEventA))
//        view.addGestureRecognizer(tapGRA)
//        tapGRA.rx.observe(UIGestureRecognizer.State.self, "state").bind { (state) in
//            if let state = state {
//                view.showGestureLog(state: state, gesture: tapGRA)
//            }
//        }.disposed(by: self.rx.disposeBag)
        
        return view
    }()
    
    lazy var viewB :BaseView = {
        let view = BaseView(name: "viewB")
        view.showHitTestLog = false
        view.showTouchLog = true
        view.gestureShouldBegin = false
        
        let tapGRB = UITapGestureRecognizer(target: self, action: #selector(tapEventB))
        view.addGestureRecognizer(tapGRB)
        tapGRB.delegate = view
        tapGRB.rx.observe(UIGestureRecognizer.State.self, "state").bind { (state) in
            if let state = state {
                view.showGestureLog(state: state, gesture: tapGRB)
            }
        }.disposed(by: self.rx.disposeBag)
        
//        let tapGRB = UITapGestureRecognizer(target: self, action: #selector(tapEventB))
//        view.addGestureRecognizer(tapGRB)
//        tapGRB.delegate = view
//        tapGRB.rx.observe(UIGestureRecognizer.State.self, "state").bind { (state) in
//            if let state = state {
//                view.showGestureLog(state: state, gesture: tapGRB)
//            }
//        }.disposed(by: self.rx.disposeBag)
        
//        tapGRB.cancelsTouchesInView = false
//        tapGRB.delaysTouchesBegan = true
//        tapGRB.delaysTouchesEnded = true
        
        return view
    }()
    
    let viewC :BaseView = {
        let view = BaseView(name: "viewC")
        view.showHitTestLog = false
        view.showTouchLog = false
        return view
    }()
    
    let viewD :BaseView = {
        let view = BaseView(name: "viewD")
        view.showHitTestLog = false
        view.showTouchLog = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.showTouchLog = false
        createUI()
    }
    
    // MARK: - Create UI
    fileprivate func createUI() {
        createTestViewHaveGesture()
        createTestViewNoGesture()
    }
    
    func createTestViewHaveGesture() {
        self.view.addSubview(viewA)
        viewA.backgroundColor = .orange
        viewA.snp.makeConstraints { (make) in
            make.width.height.equalTo(200)
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        
        self.viewA.addSubview(self.viewB)
//        self.viewB.isUserInteractionEnabled = false
        viewB.backgroundColor = .blue
        viewB.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
        
        let label = UILabel()
        label.text = "have gesture"
        label.textColor = .white
        self.viewB.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
        
    }
    
    func createTestViewNoGesture() {
        self.view.addSubview(viewC)
        viewC.backgroundColor = .orange
        viewC.snp.makeConstraints { (make) in
            make.width.height.equalTo(200)
            make.top.equalTo(self.viewA.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
        }
        
        
        self.viewC.addSubview(self.viewD)
        viewD.backgroundColor = .blue
        viewD.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
        
        let label = UILabel()
        label.text = "no gesture"
        label.textColor = .white
        self.viewD.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    @objc func tapEventA() {
        print("--tapEventA")
    }
    
    @objc func tapEventB() {
        print("--tapEventB")
    }
}
