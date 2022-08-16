//
//  IncidentCell.swift
//  motorola
//
//  Created by Bence Fulop on 16/8/2022.
//

import UIKit

class IncidentCell: UITableViewCell {
    static let reuseID = "incidentCell"
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var iconView = IconView(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(incident: Incident) {
        dateLabel.text = incident.lastUpdated
        titleLabel.text = incident.title
        iconView.downloadImageFrom(from: incident.typeIcon)
        configureStatusLabel(incident)
    }
    
    private func configure() {
        addSubview(dateLabel)
        addSubview(titleLabel)
        addSubview(iconView)
        
        addSubview(statusLabel)
        self.accessoryType = .disclosureIndicator
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo:  self.topAnchor, constant: 12),
            dateLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.topAnchor.constraint(equalTo:  dateLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            statusLabel.topAnchor.constraint(equalTo:  titleLabel.bottomAnchor, constant: 8),
            statusLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 10),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            iconView.heightAnchor.constraint(equalToConstant: 30),
            iconView.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func configureStatusLabel(_ incident: Incident) {
        statusLabel.text = incident.status
        switch statusLabel.text {
        case "On Scene" :
            statusLabel.backgroundColor = .systemBlue
        case "Pending" :
            statusLabel.backgroundColor = .systemYellow
        case "Under control" :
            statusLabel.backgroundColor = .systemGreen
        case "Out of control" :
            statusLabel.backgroundColor = .systemRed
        default:
            statusLabel.backgroundColor = .systemYellow
        }
    }
}
