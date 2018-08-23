//
//  Extensions.swift
//  O! Application
//
//  Created by Baha Ganyev on 23.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showErrorAlert(aMessage: String) {
        let alert = UIAlertController(title: "Ошибка", message: aMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
extension UILabel {
    func textDropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
    }
    
    static func createCustomLabel() -> UILabel {
        let label = UILabel()
        label.textDropShadow()
        return label
    }
}

