//
//  BaseButtonWithGesture.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/23.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit

class BaseButtonWithGesture: BaseButton {

    lazy var tapGR = UITapGestureRecognizer(target: self, action: #selector(tapEvent))
    lazy var longPressGR = UILongPressGestureRecognizer(target: self, action: #selector(longPressEvent))
    
    override init(name: String, ifNeedDefaultEvent: Bool = true) {
        super.init(name: name, ifNeedDefaultEvent: ifNeedDefaultEvent)
        
        self.backgroundColor = .orange
        self.showHitTestLog = false
        self.showTouchLog = false
        
        self.addGestureRecognizer(tapGR)
        tapGR.rx.observe(UIGestureRecognizer.State.self, "state").bind {[weak self] (state) in
            guard let self = self else { return }
            if let state = state {
                self.showGestureLog(state: state, gestureName: "\(self.name).tapGesture", gesture: self.tapGR)
            }
        }.disposed(by: self.rx.disposeBag)
        
        self.addGestureRecognizer(longPressGR)
        longPressGR.isEnabled = false
        longPressGR.rx.observe(UIGestureRecognizer.State.self, "state").bind {[weak self] (state) in
            guard let self = self else { return }
            if let state = state {
                self.showGestureLog(state: state, gestureName: "\(self.name).longPressGesture", gesture: self.longPressGR)
            }
        }.disposed(by: self.rx.disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapEvent() {
        print("--tapEvent \(self.name)")
    }
    
    @objc func longPressEvent() {
        print("--longPressEvent \(self.name)")
    }

}
