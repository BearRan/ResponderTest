//
//  TestGestureVC1.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/21.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit

class TestCancelsTouchesInView: BaseViewController {

    lazy var viewA :BaseView = {
        let view = BaseView(name: "viewA")
        view.backgroundColor = .orange
        view.showHitTestLog = true
        view.showTouchLog = true
        
        
        let tapGRA = UITapGestureRecognizer(target: self, action: #selector(tapEventA))
        view.addGestureRecognizer(tapGRA)
        tapGRA.rx.observe(UIGestureRecognizer.State.self, "state").bind { (state) in
            if let state = state {
                view.showGestureLog(state: state, gestureName: "tapGRA", gesture: tapGRA)
            }
        }.disposed(by: self.rx.disposeBag)
        
        tapGRA.cancelsTouchesInView = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let contentViewA = TestContentView()
        self.stackView.addArrangedSubview(contentViewA)
        contentViewA.name = "tapGRA.cancelsTouchesInView = false"
        
        contentViewA.addSubview(viewA)
        viewA.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    @objc func tapEventA() {
        print("--tapEventA")
    }
}
