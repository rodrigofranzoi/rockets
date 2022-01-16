//
//  MainCell.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 06/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation
import UIKit

class MainCell: UITableViewCell {
    
    static let identifier = "MainCell"
    
    lazy var patchImg: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var checkImg: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    let missionLabel: UILabel = {
        let label = UILabel()
        label.text = "Mission"
        label.font = label.font.withSize(10)
        label.textColor = .black
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date/time"
        label.font = label.font.withSize(10)
        label.textColor = .black
        return label
    }()
    
    let rocketLabel: UILabel = {
        let label = UILabel()
        label.text = "Rocket"
        label.font = label.font.withSize(10)
        label.textColor = .black
        return label
    }()
    
    let daysLabel: UILabel = {
        let label = UILabel()
        label.text = "Days"
        label.font = label.font.withSize(10)
        label.textColor = .black
        return label
    }()
    
    let missionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Mission:"
        label.font = label.font.withSize(10)
        label.textColor = .gray
        return label
    }()
    
    let dateTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Date/time:"
        label.font = label.font.withSize(10)
        label.textColor = .gray
        return label
    }()
    
    let rocketTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Rocket:"
        label.font = label.font.withSize(10)
        label.textColor = .gray
        return label
    }()
    
    let daysTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Days:"
        label.font = label.font.withSize(10)
        label.textColor = .gray
        return label
    }()

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        
        missionLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        rocketLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        missionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        rocketTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        daysTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        patchImg.translatesAutoresizingMaskIntoConstraints = false
        checkImg.translatesAutoresizingMaskIntoConstraints = false

        addSubview(patchImg)
        addSubview(checkImg)
        addSubview(missionTitleLabel)
        addSubview(dateTitleLabel)
        addSubview(rocketTitleLabel)
        addSubview(daysTitleLabel)
        addSubview(patchImg)
        addSubview(checkImg)
        addSubview(missionLabel)
        addSubview(dateLabel)
        addSubview(rocketLabel)
        addSubview(daysLabel)
        setupConstraints()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        patchImg.image = nil
        checkImg.image = nil
    }
    
    func configure(model: MainCellModel) {
        missionLabel.text = model.missionName
        rocketLabel.text = model.rocketName
        checkImg.image = model.checkImg
        patchImg.downloadImage(url: model.patchUrl)
        daysTitleLabel.text = model.daysTitle
        daysLabel.text = model.days
        dateLabel.text = model.date
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            missionTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            missionTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            missionTitleLabel.leadingAnchor.constraint(equalTo: patchImg.trailingAnchor, constant: 8),
            dateTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            dateTitleLabel.leadingAnchor.constraint(equalTo: patchImg.trailingAnchor, constant: 8),
            dateTitleLabel.topAnchor.constraint(equalTo: missionTitleLabel.bottomAnchor, constant: 8),
            rocketTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            rocketTitleLabel.leadingAnchor.constraint(equalTo: patchImg.trailingAnchor, constant: 8),
            rocketTitleLabel.topAnchor.constraint(equalTo: dateTitleLabel.bottomAnchor, constant: 8),
            daysTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            daysTitleLabel.leadingAnchor.constraint(equalTo: patchImg.trailingAnchor, constant: 8),
            daysTitleLabel.topAnchor.constraint(equalTo: rocketTitleLabel.bottomAnchor, constant: 8),
            daysTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            patchImg.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            patchImg.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            patchImg.heightAnchor.constraint(equalToConstant: 32),
            patchImg.widthAnchor.constraint(equalToConstant: 32),
            checkImg.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            checkImg.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            checkImg.heightAnchor.constraint(equalToConstant: 32),
            checkImg.widthAnchor.constraint(equalToConstant: 32),
            missionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            missionLabel.trailingAnchor.constraint(equalTo: checkImg.leadingAnchor, constant: -8),
            missionLabel.leadingAnchor.constraint(equalTo: patchImg.trailingAnchor, constant: 90),
            dateLabel.trailingAnchor.constraint(equalTo: checkImg.leadingAnchor, constant: -8),
            dateLabel.leadingAnchor.constraint(equalTo: patchImg.trailingAnchor, constant: 90),
            dateLabel.topAnchor.constraint(equalTo: missionLabel.bottomAnchor, constant: 8),
            rocketLabel.trailingAnchor.constraint(equalTo: checkImg.leadingAnchor, constant: -8),
            rocketLabel.leadingAnchor.constraint(equalTo: patchImg.trailingAnchor, constant: 90),
            rocketLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            daysLabel.trailingAnchor.constraint(equalTo: checkImg.leadingAnchor, constant: -8),
            daysLabel.leadingAnchor.constraint(equalTo: patchImg.trailingAnchor, constant: 90),
            daysLabel.topAnchor.constraint(equalTo: rocketLabel.bottomAnchor, constant: 8),
            daysLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        patchImg.heightAnchor.constraint(equalToConstant: 32).isActive = true
        patchImg.widthAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
