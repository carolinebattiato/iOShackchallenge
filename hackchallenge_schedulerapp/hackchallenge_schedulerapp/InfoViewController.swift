//
//  InfoViewController.swift
//  hackchallenge_schedulerapp
//
//  Created by Caroline Battiato on 11/21/19.
//  Copyright © 2019 Caroline Battiato. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    var infoLabel: UILabel!
    var infoSaveButton: UIBarButtonItem!

       override func viewDidLoad() {
           super.viewDidLoad()

           view.backgroundColor = .white

           infoLabel = UILabel()
           infoLabel.translatesAutoresizingMaskIntoConstraints = false
           infoLabel.text = "Information Science Major Requirements"
           infoLabel.textColor = .black
           infoLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
           view.addSubview(infoLabel)
           
           infoSaveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(infoSaveButtonPressed))

           setUpConstraints()

       }
       
       @objc func infoSaveButtonPressed() {
           navigationController?.popViewController(animated: true)
           dismiss(animated: true, completion: nil)
       }

       func setUpConstraints() {
           NSLayoutConstraint.activate([
               infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
           ])
           
           navigationItem.rightBarButtonItem = infoSaveButton
       }

}
