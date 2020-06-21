//
//  BaseView.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/16.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit

class BaseView: UIView {

    let titleLabel = UILabel()
    var name :String = "" {
        didSet {
            self.titleLabel.text = name
        }
    }
    
    var showTouchLog = true
    var showHitTestLog = true
    
    var gestureShouldBegin = true
    var shouldRecognizeSimultaneously = false
    var shouldRequireFailureOf = false

    init(name: String) {
        self.name = name
        super.init(frame: .zero)
        
        self.titleLabel.text = name
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if showHitTestLog {
            print("------hitTest name:\(self.name)")
        }
        return super.hitTest(point, with: event)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if showHitTestLog {
            print("------pointInside name:\(self.name)")
        }
        return super.point(inside: point, with: event)
    }
    
    
    // MARK: - Touch message
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

// MARK: - UIGestureRecognizerDelegate
extension BaseView: UIGestureRecognizerDelegate {
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.gestureShouldBegin
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.shouldRecognizeSimultaneously
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.shouldRequireFailureOf
    }
}

// MARK: - RX Linstener Gesture Log
extension BaseView {
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
        print("--------view:\(self.name) gesture:\(gestureName) \(String(describing: type(of: gesture))) status:\(self.convertGesState(state: state))")
    }
}
