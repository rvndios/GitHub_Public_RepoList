//
//  ListViewModel.swift
//  GitHubSearch
//
//  Created by Aravind Sekar on 21/02/21.
//

import Foundation
import UIKit
let cellIdentifier = "ListCell"
let detailSegueIdentifier = "detailSegueid"
var selectedRepo: RepoModel?
class ListViewModel: NSObject {
    var viewController: UIViewController?
    var tableData: [RepoModel] = []
    var currentPage: Int! = 1
    var totalPage: Int = 0
    var isLoadingList : Bool = false
    init(viewCtrl: UIViewController) {
        self.viewController = viewCtrl
    }
    /// Method for update data from API
    func updateData() {
        isLoadingList = true
        WebService.shared.makeRequest(urlStr: "search/repositories?q=+language:swift&sort=stars&order=desc&page=\(currentPage ?? 0 )&per_page=10", parameter: "") { [weak self] (data, err) in
            if err == nil {
                let user = try! JSONDecoder().decode(SerachAPIModel.self, from: data!)
                if let total = user.totalCount {
                    self?.totalPage = total
                }
                if let loadData = user.items {
                    DispatchQueue.main.async {
                        self?.tableData.append(contentsOf: loadData)
                        self?.viewController?.reloadViews()
                        self?.isLoadingList = false
                    }
                }
                
            }
        }
    }
    /// Method to load more data on the list
    func loadMore(){
        currentPage += 1
        updateData()
    }
}
// MARK: UITableViewDataSource
extension ListViewModel: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListCell
        cell?.data = tableData[indexPath.row]
        return cell!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
}
// MARK: UITableViewDelegate
extension ListViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRepo = tableData[indexPath.row]
        self.viewController?.performSegue(withIdentifier: detailSegueIdentifier, sender: nil)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.tableData.count - 1 {
            if self.currentPage < self.totalPage-1 {
                self.currentPage += 1
                loadMore()
            }
        }
    }
}

