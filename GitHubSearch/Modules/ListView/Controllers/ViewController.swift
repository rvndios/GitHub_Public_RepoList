//
//  ViewController.swift
//  GitHubSearch
//
//  Created by Aravind Sekar on 21/02/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableList: UITableView!
    var viewModel: ListViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModelUpdate()
        updateDelegates()
    }
    override func reloadViews(){
        tableList.reloadData()
    }
}
extension ViewController {
    /// Method for link VC with VM
    func viewModelUpdate(){
        viewModel = ListViewModel(viewCtrl: self)
        self.viewModel?.updateData()
    }
    /// Methodfor update table delegate and datasource
    func updateDelegates(){
        self.tableList.dataSource = viewModel
        self.tableList.delegate = viewModel
    }
}

