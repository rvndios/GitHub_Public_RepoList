//
//  Extensions.swift
//  GitHubSearch
//
//  Created by Aravind Sekar on 21/02/21.
//

import Foundation
import UIKit
// MARK: UIImageView extesions
extension UIImageView{
    /// Method for make imageview as circle
    public func maskCircle() {
        self.contentMode = .scaleAspectFit
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
}

// MARK: UIViewController extesions
extension UIViewController{
    /// Method for reload view contents
    @objc func reloadViews() { }
}
