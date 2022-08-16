//
//  IncidentsViewController.swift
//  motorola

import UIKit

class IncidentsViewController: UIViewController {

    var tableView: UITableView!
    let dataManager = DataManager.shared
    var incidents: [Incident] = []
    let sortImage = UIImage(systemName: "arrow.up.arrow.down")
    var reversed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadIncidents()
        configureTableView()
        configureNavigationBar()
    }
    
    private func loadIncidents() {
        dataManager.getSortedIncidents()
        incidents = dataManager.incidents
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        tableView.register(IncidentCell.self, forCellReuseIdentifier: "incidentCell")
        tableView.backgroundColor = .systemBackground
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let barButton = UIBarButtonItem(image: sortImage, style: .plain, target: self, action: #selector(reverseIncidentSorting))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func reverseIncidentSorting() {
        incidents = incidents.sorted { (first: Incident, second: Incident) -> Bool in
            let dateFormatter = DateFormatter.dateWithTimeZoneFormat
            let firstDate = dateFormatter.date(from: first.lastUpdated)
            let secondDate = dateFormatter.date(from: second.lastUpdated)
            if reversed {
                return firstDate?.compare(secondDate!) == .orderedDescending
            } else {
                return firstDate?.compare(secondDate!) == .orderedAscending
            }
        }
        reversed.toggle()
        tableView.reloadData()
    }
}

// - MARK: UITableViewDataSource
extension IncidentsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "incidentCell", for: indexPath) as! IncidentCell
        let current = incidents[indexPath.row]
        cell.set(incident: current)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incidents.count
    }
    
}

// - MARK: UITableViewDataSource
extension IncidentsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}




