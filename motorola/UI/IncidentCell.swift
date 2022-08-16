//
//  IncidentCell.swift
//  motorola
//
//  Created by Bence Fulop on 16/8/2022.
//

import UIKit

class IncidentCell: UITableViewCell {
    static let reuseID = "incidentCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(incident: Incident) {
        titleLabel.text = incident.title
    }
    
    private func configure() {
        addSubview(titleLabel)
        self.accessoryType = .disclosureIndicator
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo:  self.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
