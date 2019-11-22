//
//  InfoTableViewCell.swift
//  hackchallenge_schedulerapp
//
//  Created by Caroline Battiato on 11/22/19.
//  Copyright © 2019 Caroline Battiato. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    var nameLabel: UILabel!
    var subLabel: UILabel!
    var emptyImage: UIImageView!
    var checkImage: UIImageView!
    
    let padding: CGFloat = 8
    let labelHeight: CGFloat = 16
    let imageSize: CGFloat = 10
    
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
        
        emptyImage = UIImageView(image: UIImage(named: "emptycircle"))
        emptyImage.translatesAutoresizingMaskIntoConstraints = false
        emptyImage.contentMode = .scaleToFill
        emptyImage.isHidden = false
        contentView.addSubview(emptyImage)
        
        checkImage = UIImageView(image: UIImage(named: "checkcircle"))
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        checkImage.contentMode = .scaleToFill
        checkImage.isHidden = true
        contentView.addSubview(checkImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            nameLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
        ])
        
        NSLayoutConstraint.activate([
            subLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            subLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            subLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            emptyImage.widthAnchor.constraint(equalToConstant: imageSize),
            emptyImage.heightAnchor.constraint(equalToConstant: imageSize),
            emptyImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            emptyImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            checkImage.widthAnchor.constraint(equalToConstant: imageSize),
            checkImage.heightAnchor.constraint(equalToConstant: imageSize),
            checkImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            checkImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
    }
    
    func configure(for infocourse: Course) {
        nameLabel.text = infocourse.courseID + ": " + infocourse.className
        subLabel.text = infocourse.professor + ", " + infocourse.semester
    }
    
    func toggleImage(for taken: Bool) {
        checkImage.isHidden = !taken
    }

}
