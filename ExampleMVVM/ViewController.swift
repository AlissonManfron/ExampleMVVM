//
//  ViewController.swift
//  ExampleMVVM
//
//  Created by Vendpago on 14/09/2018.
//  Copyright © 2018 Alisson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var uitableView: UITableView!
    
    // the view model should be injected into this class
    private var model: UsersViewModel!
    static func create(model: UsersViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: ViewController.self))
        let vc = storyboard.instantiateInitialViewController() as! ViewController
        vc.model = model
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        uitableView.delegate = self
        uitableView.dataSource = self
        uitableView.tableFooterView = UIView()
        model.delegate = self
        model.bootstrap()
    }
}

extension ViewController: ViewModelDelegate {
    
    func willLoadData() {
        activityIndicator?.startAnimating()
    }
    
    func didLoadData() {
        uitableView.reloadData()
        activityIndicator?.stopAnimating()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.sections[section].name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = model.sections[indexPath.section].rows[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        return cell
    }
    
}
