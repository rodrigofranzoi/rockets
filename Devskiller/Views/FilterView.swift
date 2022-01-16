//
//  FilterView.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 07/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation
import UIKit

class FilterView: UIViewController {
    
    let model: FilterViewModel

    var tableView: UITableView = {
        let view = UITableView()
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.allowsMultipleSelection = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    init(model: FilterViewModel) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = "Filters"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                            style: .done,
                                                            target: self,
                                                            action:  #selector(dismissView))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(filter))
    }
    
    @objc private func filter() {
        self.model.doneTap(indexes: tableView.indexPathsForSelectedRows)
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc private func dismissView() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        setupTableConstraints()

    }
    
    private func setupTableConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FilterView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.accessoryType = .none
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.headers[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        cell.textLabel?.text = model.data[indexPath.section][indexPath.row]
        cell.selectionStyle = .none
        cell.accessoryType = .none
        if let indexes = tableView.indexPathsForSelectedRows, indexes.contains(indexPath) {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
}

extension FilterView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let indexes = tableView.indexPathsForSelectedRows else { return indexPath }
        for selectedIndex in indexes {
            if selectedIndex.section == indexPath.section {
                tableView.deselectRow(at: selectedIndex, animated: true)
                guard let cell = tableView.cellForRow(at: selectedIndex) else { return indexPath}
                cell.accessoryType = .none
            }
        }
        return indexPath
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.headers.count
    }
}
