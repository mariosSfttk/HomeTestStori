//
//  DetailViewController.swift
//  AppTestMovies
//
//  Created by Mario Vargas on 09/11/24.
//

import UIKit


protocol ProtocolDetailView {
    var presenter: ProtocolDetailViewPresenter? { get set }
    
    var results: Results? { get set }
}

class DetailViewController: UIViewController, ProtocolDetailView {
    var results: Results?
    var presenter: (any ProtocolDetailViewPresenter)?
    
    var safeView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .color900
        return view
    }()
    
    lazy var btnBack: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didPressBack), for: .touchUpInside)
        btn.setImage(UIImage(systemName: Strings.Icons.backArrow)?.withTintColor(.color0, renderingMode: .alwaysOriginal), for: .normal)
        return btn
    }()
    
    var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    var contentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var lblTitleMovie: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.WelcomeScreen.titleHeader
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: CUSTOM_FONT_GEISTMONO_EXTRABOLD, size: 24)
        return lbl
    }()
    
    lazy var posterView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: Strings.Icons.movieIcon)
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    var blurView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.backgroundColor = .color800
        view.alpha = 0.6
        return view
    }()
    
    var lblDescription: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.WelcomeScreen.titleHeader
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: CUSTOM_FONT_GEISTMONO_SEMIBOLD, size: 20)
        lbl.textAlignment = .justified
        return lbl
    }()
    
    var lblDate: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.WelcomeScreen.titleHeader
        lbl.font = UIFont(name: CUSTOM_FONT_GEISTMONO_REGULAR,size: 12)
        lbl.textColor = .color100
        lbl.shadowColor = .color900
        lbl.shadowOffset = CGSize(width: 2, height: 1)
        return lbl
    }()
    
    var lblRate: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.WelcomeScreen.titleHeader
        lbl.font = UIFont(name: CUSTOM_FONT_GEISTMONO_REGULAR,size: 12)
        lbl.textColor = .color100
        lbl.shadowColor = .color900
        lbl.shadowOffset = CGSize(width: 2, height: 1)
        return lbl
    }()
    
    lazy var btnPlay: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didPressPlay), for: .touchUpInside)
        btn.setImage(UIImage(systemName: Strings.Icons.playIcon )?.withTintColor(.color0, renderingMode: .alwaysOriginal), for: .normal)
        btn.setTitle(Strings.DetailScreen.btnPlay, for: .normal)
        btn.backgroundColor = .color800
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addingSubViews()
        setupComponentsView()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .color500
        setInfo()
    }
    
    @objc func didPressBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didPressPlay() {
        AlertHelpper.showAlert(parent: self) {
            print(Strings.DetailScreen.okAction)
        } completionCancel: {
            print(Strings.DetailScreen.cancelAction)
        }
    }
    
    func setInfo() {
        if let info = results {
            lblTitleMovie.text = info.title
            getImage(forUrl: info.poster_path) { image in
                self.posterView.image = image as UIImage
            }
            lblDescription.text = info.overview
            lblDate.text = info.release_date
            lblRate.text = String(format: "⭐️ %.1f", info.vote_average)
        }
    }

}
