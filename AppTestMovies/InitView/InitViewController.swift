//
//  InitViewController.swift
//  AppTestMovies
//
//  Created by Mario Vargas on 09/11/24.
//

import UIKit


protocol ProtocolInitViewController {
    var presenter: ProtocolInitViewPresenter? { get set }
    
    func receiveMovies(movies: [Results])
}

class InitViewController: UIViewController, ProtocolInitViewController {
    var movies = [Results]() {
        didSet {
            DispatchQueue.main.async {
                self.tblMovies.reloadData()
            }
        }
    }
    var presenter: (any ProtocolInitViewPresenter)?
    var counterPage: Int = 1
    
    
    var headerView: UIView = {
      let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .color900
        return view
    }()
    
    var lblTitleHeader: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = Strings.WelcomeScreen.titleHeader
        lbl.font =  UIFont(name: CUSTOM_FONT_GEISTMONO_EXTRABOLD, size: 24)
        lbl.textColor = .white
        return lbl
    }()
    
    var tblMovies: UITableView = {
      let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.allowsSelection = true
        table.separatorStyle = .none
        table.register(MovieCell.self, forCellReuseIdentifier: "Cell")
        table.backgroundColor = .color500
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addingSubViews()
        setupComponentsView()
        
        configureTable()
        
        view.backgroundColor = .color500
        sendRequest()
        
    }
    
    func receiveMovies(movies: [Results]) {
        self.movies = self.movies + movies
    }
    
    func sendRequest() {
        Loader.sharedInstance.showIndicator(view: self)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presenter?.invokeTopRatedService(forPage: self.counterPage)
        }
    }


}

