//
//  CSViewController.swift
//  hackchallenge_schedulerapp
//
//  Created by Caroline Battiato on 11/18/19.
//  Copyright © 2019 Caroline Battiato. All rights reserved.
//

import UIKit

class CSViewController: UIViewController {

    var csLabel: UILabel!
    

//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        csLabel = UILabel()
        csLabel.translatesAutoresizingMaskIntoConstraints = false
        csLabel.text = "Computer Science Major Requirements"
        csLabel.textColor = .black
        csLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.addSubview(csLabel)

        setUpConstraints()

    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            csLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            csLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }



}
