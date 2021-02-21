//
//  DetailViewController.swift
//  GitHubSearch
//
//  Created by Aravind Sekar on 21/02/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var avatar: ImageView!
    @IBOutlet weak var urlsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
    }
    /// Method for update data in thsi viewcontroller
    func updateData() {
        guard let data = selectedRepo else {
            return
        }
        self.labelName.text = data.name
        self.labelTitle.text = data.fullName
        self.labelDescription.text =  "\( data.itemDescription ?? "")"
        self.avatar.loadImageWithUrl( URL(string: data.owner.avatarURL ?? "")!)
        let strURLS = "Commits: \(data.commitsURL ?? "")\n\n Downloads: \(data.downloadsURL ?? "")\n\n Comments: \(data.commentsURL ?? "")\n\n Archives: \(data.archiveURL ?? "")\n\n Merges:\(data.mergesURL ?? "")\n\n Issues:\(data.issuesURL ?? "")"
        self.urlsLabel.text = strURLS
    }
}
