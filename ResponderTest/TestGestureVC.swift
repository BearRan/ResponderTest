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

    let viewA = BaseView(name: "viewA")
    let viewB = BaseView(name: "viewB")
    
    let viewC = BaseView(name: "viewC")
    let viewD = BaseView(name: "viewD")
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        let tapGRA = UITapGestureRecognizer(target: self, action: #selector(tapEventA))
        self.viewA.addGestureRecognizer(tapGRA)
        
        tapGRA.rx.observe(Int.self, "state").bind { (state) in
            if let state = state, let resState = UIGestureRecognizer.State.init(rawValue: state) {
                print("--------viewA tap state:\(state) resState: \(resState)")
            }
        }.disposed(by: self.rx.disposeBag)
        
        
        self.viewA.addSubview(self.viewB)
//        self.viewB.isUserInteractionEnabled = false
        viewB.backgroundColor = .blue
        viewB.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
        
        let tapGRB = UILongPressGestureRecognizer(target: self, action: #selector(tapEventB))
        self.viewB.addGestureRecognizer(tapGRB)
        tapGRB.rx.observe(Int.self, "state").bind { (state) in
            if let state = state, let resState = UIGestureRecognizer.State.init(rawValue: state) {
                print("--------viewB long press state:\(state) resState: \(resState)")
            }
        }.disposed(by: self.rx.disposeBag)
        
        
        
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
