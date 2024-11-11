//
//  InitViewFacade.swift
//  AppTestMovies
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation
import UIKit



extension InitViewController {
    
    func addingSubViews() {
        view.addSubview(headerView)
        headerView.addSubview(lblTitleHeader)
        
        view.addSubview(tblMovies)
    }
    
    func setupComponentsView() {
        setHeaderConstraints()
        setLblTitleHeaderConstraints()
        setTableConstraints()
    }
    
    func setHeaderConstraints() {
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 41),
        ])
    }
    
    func setLblTitleHeaderConstraints() {
        NSLayoutConstraint.activate([
            lblTitleHeader.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -4),
            lblTitleHeader.centerXAnchor.constraint(equalTo: headerView.centerXAnchor)
        ])
    }
    
    func setTableConstraints() {
        NSLayoutConstraint.activate([
            tblMovies.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            view.trailingAnchor.constraint(equalTo: tblMovies.trailingAnchor, constant: 12),
            tblMovies.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 12),
            tblMovies.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20)
        ])
    }
}


