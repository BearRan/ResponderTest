//
//  TestContentView.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/21.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit

class BaseContentView: UIView {

    let titleLabel = UILabel()
    var name :String = "" {
        didSet {
            self.titleLabel.text = name
        }
    }
    
    
    init() {
        super.init(frame: .zero)
        
        configDefaultSize()
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configDefaultSize() {
        self.snp.makeConstraints { (make) in
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(200)
        }
    }
}
