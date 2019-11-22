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
    var csSaveButton: UIBarButtonItem!
    var csTableView: UITableView!
    
    let csReuseIdentifier = "csCellReuse"
    let cellHeight: CGFloat = 40
    var courses: [Course]!
    

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
        
        let cs3110 = Course(courseID: "CS3110", className: "Functional Programming", professor: "Michael Clarkson", semester: "Fall/Spring")
        
        courses = [cs3110]

        csLabel = UILabel()
        csLabel.translatesAutoresizingMaskIntoConstraints = false
        csLabel.text = "Computer Science Major Requirements"
        csLabel.textColor = .black
        csLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.addSubview(csLabel)

        csSaveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(csSaveButtonPressed))
        
        csTableView = UITableView()
        csTableView.dataSource = self
        csTableView.delegate = self
        csTableView.translatesAutoresizingMaskIntoConstraints = false
        csTableView.register(CSTableViewCell.self, forCellReuseIdentifier: csReuseIdentifier)
        view.addSubview(csTableView)
        
        setUpConstraints()

    }
    
    @objc func csSaveButtonPressed() {
           navigationController?.popViewController(animated: true)
           dismiss(animated: true, completion: nil)
         }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            csLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            csLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        navigationItem.rightBarButtonItem = csSaveButton
        
        NSLayoutConstraint.activate([
            csTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            csTableView.topAnchor.constraint(equalTo: csLabel.bottomAnchor, constant: 20),
            csTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            csTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }



}

extension CSViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: csReuseIdentifier, for: indexPath) as! CSTableViewCell
        let cscourse = courses[indexPath.row]
        cell.configure(for: cscourse)
        cell.selectionStyle = .none
        return cell
    }
    
    
}

extension CSViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
