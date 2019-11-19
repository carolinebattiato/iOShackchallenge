//
//  ViewController.swift
//  hackchallenge_schedulerapp
//
//  Created by Caroline Battiato on 11/18/19.
//  Copyright © 2019 Caroline Battiato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pushCSButton: UIButton!
    var pushInfoSciButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Requirement Tracker"
        
        pushCSButton = UIButton()
        pushCSButton.translatesAutoresizingMaskIntoConstraints = false
        pushCSButton.setTitle("Computer Science", for: .normal)
        pushCSButton.setTitleColor(.black, for: .normal)
        pushCSButton.addTarget(self, action: #selector(pushCSView), for: .touchUpInside)
        view.addSubview(pushCSButton)
        
        pushInfoSciButton = UIButton()
        pushInfoSciButton.translatesAutoresizingMaskIntoConstraints = false
        pushInfoSciButton.setTitle("Information Science", for: .normal)
        pushInfoSciButton.setTitleColor(.black, for: .normal)
        view.addSubview(pushInfoSciButton)
        
        setUpConstraints()
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            pushCSButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushCSButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushCSButton.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            pushInfoSciButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushInfoSciButton.topAnchor.constraint(equalTo: pushCSButton.bottomAnchor, constant: 16),
            pushInfoSciButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    @objc func pushCSView() {
        let viewController = CSViewController()
        navigationController?.pushViewController(viewController, animated: true)

    }

}

