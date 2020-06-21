//
//  ViewController.swift
//  ResponderTest
//
//  Created by Chobits on 2020/6/16.
//  Copyright © 2020 Chobits. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    lazy var vcNames = [
        "TestGestureVC",
        "TestCancelsTouchesInView",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--select name:\(vcNames[indexPath.row])")
        
        let calssName = vcNames[indexPath.row]
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        if let tmpClass = NSClassFromString("\(namespace).\(calssName)") as? UIViewController.Type {
            let tmpVC = tmpClass.init()
            self.navigationController?.pushViewController(tmpVC, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vcNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellId)
        }
        cell?.textLabel?.text = vcNames[indexPath.row]
        
        return cell!
    }
}

