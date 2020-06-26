//
//  BaseViewController.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/16.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    lazy var tapGR = UITapGestureRecognizer(target: self, action: #selector(vcTapEvent))
    let name :String = "BaseVC"
    var showTouchLog = true
    lazy var stackView :UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addGestureRecognizer(tapGR)
        tapGR.rx.observe(UIGestureRecognizer.State.self, "state").bind {[weak self] (state) in
            guard let self = self else { return }
            if let state = state {
                self.showGestureLog(state: state, gestureName: "\(self.name).tapGesture", gesture: self.tapGR)
            }
        }.disposed(by: self.rx.disposeBag)
        
        if let tmpClass = object_getClass(self) {
            let tmpName = NSStringFromClass(tmpClass)
            self.title = String(tmpName.split(separator: ".")[1])
        }
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
        }
        self.navigationController?.navigationBar.isTranslucent = false
        self.edgesForExtendedLayout = [.bottom]
    }
    
    
    
    @objc func vcTapEvent() {
        print("--vcTapEvent \(self.name)")
    }
    
    
        
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if showTouchLog {
            print("--touchesBegan name:\(self.name)")
        }
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if showTouchLog {
            print("--touchesMoved name:\(self.name)")
        }
        super.touchesMoved(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if showTouchLog {
            print("--touchesEnded name:\(self.name)")
        }
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if showTouchLog {
            print("--touchesCancelled name:\(self.name)")
        }
        super.touchesCancelled(touches, with: event)
    }

}

// MARK: - RX Linstener Gesture Log
extension BaseViewController {
    func convertGesState(state: UIGestureRecognizer.State) -> String {
        var resString = ""
        switch state {
        
        case .possible:
            resString = "possible"
        case .began:
            resString = "began"
        case .changed:
            resString = "changed"
        case .ended:
            resString = "ended"
        case .cancelled:
            resString = "cancelled"
        case .failed:
            resString = "failed"
        @unknown default:
            resString = "unknown"
        }
        return resString
    }
    
    func showGestureLog(state: UIGestureRecognizer.State, gestureName: String, gesture: UIGestureRecognizer) {
        print("--GestureStatusListener view:\(self.name) gesture:\(gestureName) \(String(describing: type(of: gesture))) status:\(self.convertGesState(state: state))")
    }
}
