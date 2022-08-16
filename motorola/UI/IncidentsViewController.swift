//
//  IncidentsViewController.swift
//  motorola

import UIKit

class IncidentsViewController: UIViewController {

    var tableView: UITableView!
    let dataManager = DataManager.shared
    var incidents: [Incident] = []
    let sortImage = UIImage(systemName: "arrow.up.arrow.down")

    override func viewDidLoad() {
        super.viewDidLoad()
        loadIncidents()
        configureTableView()
        configureNavigationBar()
    }
    
    @objc func reverseSorting() {
        print("🎉 reverseSorting")
    }

    private func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        tableView.register(IncidentCell.self, forCellReuseIdentifier: "incidentCell")
        tableView.backgroundColor = .systemBackground
        tableView.rowHeight = 60
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let barButton = UIBarButtonItem(image: sortImage, style: .plain, target: self, action: #selector(reverseSorting))
        navigationItem.rightBarButtonItem = barButton
    }
    
    private func loadIncidents() {
        dataManager.getSortedIncidents()
        incidents = dataManager.incidents
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




