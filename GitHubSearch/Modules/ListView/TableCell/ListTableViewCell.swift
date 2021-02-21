//
//  ListTableViewCell.swift
//  GitHubSearch
//
//  Created by Aravind Sekar on 21/02/21.
//

import Foundation
import UIKit
class ListCell: UITableViewCell {
    var data:RepoModel? {
        didSet{
            setupData()
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var imgView: ImageView!
    func setupData() {
        self.titleLabel?.text = data?.fullName
        let desc = "\(data?.language ?? ""), \( data?.createdAt ?? ""), \( data?.itemDescription ?? "")"
        self.descLabel?.text = desc
        self.imgView?.loadImageWithUrl( URL(string: data?.owner.avatarURL ?? "")!)
        self.imgView?.maskCircle()
    }
}
