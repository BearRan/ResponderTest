//
//  BaseViewController.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/16.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    let name :String = "BaseVC"
    var showTouchLog = true
    lazy var stackView :UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
