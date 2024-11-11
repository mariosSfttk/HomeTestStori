//
//  InitViewController+Table.swift
//  AppTestMovies
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation
import UIKit


extension InitViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTable() {
        tblMovies.delegate = self
        tblMovies.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MovieCell
        let info = movies[indexPath.row]
        cell.setData(data: info)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(DetailViewRouter.start(results: movies[indexPath.row]).view!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == movies.count - 1 {
            counterPage += 1
            sendRequest()
        }
    }
    
    
}
