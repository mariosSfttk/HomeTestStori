//
//  AlertHelper.swift
//  AppTestMovies
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation
import UIKit

class AlertHelpper {
    
    static func showAlert(parent: UIViewController, title: String = Strings.General.titleAlert, completionOk: (() -> Void)? = nil, completionCancel: (() -> Void)? = nil) {
        let alert = CustomAlertView(alertTitle: title) {
            completionOk!()
            parent.dismiss(animated: true)
        } completionCancel: {
            completionCancel!()
            parent.dismiss(animated: true)
        }
        
        alert.modalPresentationStyle = .overFullScreen
        alert.modalTransitionStyle = .crossDissolve
        parent.present(alert, animated: true)
    }
    
}
