//
//  CSTableViewCell.swift
//  hackchallenge_schedulerapp
//
//  Created by Caroline Battiato on 11/21/19.
//  Copyright © 2019 Caroline Battiato. All rights reserved.
//

import UIKit

class CSTableViewCell: UITableViewCell {

    var nameLabel: UILabel!
    var subLabel: UILabel!
    
    let padding: CGFloat = 8
    let labelHeight: CGFloat = 16
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style
            , reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        subLabel = UILabel()
        subLabel.font = UIFont.systemFont(ofSize: 10)
        subLabel.textColor = .gray
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
        ])
        
        NSLayoutConstraint.activate([
            subLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            subLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding)
        ])
    }
    
    func configure(for cscourse: CSCourse) {
        nameLabel.text = cscourse.courseID + ": " + cscourse.className
        subLabel.text = cscourse.professor + ", " + cscourse.semester
    }


}
