//
//  ViewController.swift
//  Devskiller
//
//  Created by Ivo Silva on 18/09/2020.
//  Copyright © 2020 Mindera. All rights reserved.
//

import UIKit

protocol MainViewDelegate {
    func reloadTable()
    func configureTitle(_ title: String)
    func filterList(year: String?, success: Bool?, ascending: Bool?)
}

class MainViewController: UIViewController {
    
    let model: MainViewModel
    
    var tableView: UITableView = {
        let view = UITableView()
        view.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    @objc func buttonTapped() {
        navigationController?.present(UINavigationController(rootViewController: FilterView(model: FilterViewModel(years: model.years, delegate: self))), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        setupTableConstraints()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter"),
                                                            style: .plain,
                                                            target: self, action:  #selector(buttonTapped))

        model.loadData()
    }
    
    private func setupTableConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    init(model: MainViewModel = MainViewModel()) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainViewController: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = UITableViewCell()
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = model.info
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier) as? MainCell, indexPath.section == 1 else { return UITableViewCell() }
        cell.configure(model: MainCellModel(mission: model.missions[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 1 ? model.missions.count : 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.sectionsTitle[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.sectionsTitle.count
    }
    
    func createAction(title: String, urlStr: String, style : UIAlertAction.Style = .default) -> UIAlertAction {
        return UIAlertAction(title: title, style: style, handler:{ (UIAlertAction)in
            guard let url = URL(string: urlStr) else { return }
            UIApplication.shared.open(url)
        })
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "External Links", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        if let youtube = model.missions[indexPath.row].links.video_link {
            alert.addAction(createAction(title: "Youtube", urlStr: youtube))
        }
        
        if let wiki = model.missions[indexPath.row].links.wikipedia {
            alert.addAction(createAction(title: "Wikipedia", urlStr: wiki))
        }
        
        if let article = model.missions[indexPath.row].links.article_link {
            alert.addAction(createAction(title: "Article", urlStr: article))
        }
        
        alert.addAction(createAction(title: "Cencel", urlStr: "", style: .cancel))
        alert.popoverPresentationController?.sourceView = self.view

        self.present(alert, animated: true)
    }
}

extension MainViewController: MainViewDelegate {
    
    func filterList(year: String? = nil, success: Bool? = nil, ascending: Bool? = nil){
        model.filter(year: year, success: success, ascending: ascending)
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func configureTitle(_ title: String) {
        DispatchQueue.main.async {
            self.navigationItem.title = title
        }
    }
}
