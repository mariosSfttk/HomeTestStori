//
//  Loader.swift
//  AppTestMovies
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation
import UIKit

public class Loader {
    
    public static let sharedInstance = Loader()
    var blurImg = UIImageView()
    var indicator = UIActivityIndicatorView()
    
    private init() {
        blurImg.frame = UIScreen.main.bounds
        blurImg.backgroundColor = .color900
        blurImg.isUserInteractionEnabled = true
        blurImg.alpha = 0.5
        indicator.style = .large
        indicator.center = blurImg.center
        indicator.startAnimating()
        indicator.color = .color500
    }
    
    func showIndicator(view:UIViewController) {
        DispatchQueue.main.async( execute: {
            view.view.addSubview(self.blurImg)
            view.view.addSubview(self.indicator)
        })
    }
    
    func hideIndicator() {
        DispatchQueue.main.async( execute: {
            self.blurImg.removeFromSuperview()
            self.indicator.removeFromSuperview()
        })
    }
    
}
