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
    var infoTableView: UITableView!
    
    let infoReuseIdentifier = "infoCellReuse"
    let cellHeight: CGFloat = 50
    var infocourses: [Course]!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
//        let info2040 = Course(courseID: "INFO2040", className: "Networks", professor: "Austin Benson & David Easley", semester: "Fall", taken: false)
        infocourses = []
        
            

        infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.text = "Information Science Major Requirements"
        infoLabel.textColor = .black
        infoLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.addSubview(infoLabel)
           
        infoSaveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(infoSaveButtonPressed))
        
        infoTableView = UITableView()
        infoTableView.dataSource = self
        infoTableView.delegate = self
        infoTableView.translatesAutoresizingMaskIntoConstraints = false
        infoTableView.register(InfoTableViewCell.self, forCellReuseIdentifier: infoReuseIdentifier)
        view.addSubview(infoTableView)

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
        
        NSLayoutConstraint.activate([
            infoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoTableView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
            infoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            infoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

extension InfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infocourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let infocell = tableView.dequeueReusableCell(withIdentifier: infoReuseIdentifier, for: indexPath) as! InfoTableViewCell
        let infocourse = infocourses[indexPath.row]
        infocell.configure(for: infocourse)
        infocell.selectionStyle = .none
        return infocell
    }
    
    
}

extension InfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var course = infocourses[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath) as! InfoTableViewCell
        course.taken.toggle()
        cell.toggleImage(for: course.taken)
    }
}
