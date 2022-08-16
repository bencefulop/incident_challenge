//
//  IncidentsViewController.swift
//  motorola

import UIKit

class IncidentsViewController: UIViewController {

    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        let values = DataManager().incidents
        print("🎉 \(values)")
    }

    private func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
    }
   
}

// - MARK: UITableViewDataSource
extension IncidentsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

}

// - MARK: UITableViewDataSource
extension IncidentsViewController: UITableViewDelegate { }




