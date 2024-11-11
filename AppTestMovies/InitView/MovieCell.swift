//
//  MovieCell.swift
//  AppTestMovies
//
//  Created by Mario Vargas on 09/11/24.
//

import UIKit

class MovieCell: UITableViewCell {
    
    var generalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.color800.cgColor
        view.backgroundColor = .color600
        return view
    }()
    
    var borderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.color800.cgColor
        return view
    }()
    
    lazy var posterView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: Strings.Icons.movieIcon)
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    var lblTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: CUSTOM_FONT_GEISTMONO_EXTRABOLD,size: 18)
        label.numberOfLines = 0
        return label
    }()
    
    var lblLanguage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: CUSTOM_FONT_GEISTMONO_MEDIUM,size: 14)
        return label
    }()
    
    var lblDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: CUSTOM_FONT_GEISTMONO_MEDIUM,size: 14)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .color500
        self.selectionStyle = .none
        addSubview(generalView)
        generalView.addSubview(borderView)
        borderView.addSubview(posterView)
        generalView.addSubview(lblTitle)
        generalView.addSubview(lblLanguage)
        generalView.addSubview(lblDate)
        
        generalViewConstraints()
        borderViewConstraints()
        posterViewConstraints()
        lblTitleConstraints()
        lblLanguageConstraints()
        lblDateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func generalViewConstraints() {
        NSLayoutConstraint.activate([
            generalView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            generalView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            generalView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            generalView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        ])
    }
    
    func borderViewConstraints() {
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 2),
            borderView.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: -2),
            borderView.leadingAnchor.constraint(equalTo: generalView.leadingAnchor, constant: 2),
        ])
    }
    
    func posterViewConstraints() {
        NSLayoutConstraint.activate([
            posterView.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 1),
            posterView.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -1),
            posterView.leadingAnchor.constraint(equalTo: borderView .leadingAnchor, constant: 1),
            posterView.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -1),
            posterView.widthAnchor.constraint(equalToConstant: 80),
            posterView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func lblTitleConstraints() {
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 8),
            lblTitle.leadingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: 12),
            lblTitle.trailingAnchor.constraint(equalTo: generalView.trailingAnchor, constant: -12),
        ])
    }
    
    func lblLanguageConstraints() {
        NSLayoutConstraint.activate([
            lblLanguage.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: -8),
            lblLanguage.leadingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: 12),
        ])
    }
    
    func lblDateConstraints() {
        NSLayoutConstraint.activate([
            lblDate.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: -8),
            lblDate.trailingAnchor.constraint(equalTo: generalView.trailingAnchor, constant: -12),
        ])
    }
    
    func setData(data: Results) {
        lblTitle.text = data.title
        lblDate.text = data.release_date
        lblLanguage.text = data.original_language.uppercased()
        getImage(forUrl: data.backdrop_path) { image in
            self.posterView.image = image as UIImage
        }
    }
    
}
