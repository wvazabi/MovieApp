//
//  MovieDetailBodyView.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import UIKit

// MARK: - MovieDetailBodyView

/// Defines the body view for displaying movie details. It includes properties for a genre label, line view, synopsis label, and synopsis text.

final class MovieDetailBodyView: UIView {
   
    lazy var genreLabel:UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text:StringConstants.genre, textColor: .white, font: .systemFont16Medium)
        return this
    }()
    
    lazy var lineViewTwo:UIView = {
        let this = UIView()
        this.backgroundColor = .movieColorDarkGray
        this.translatesAutoresizingMaskIntoConstraints = false
        return this
    }()
    
    lazy var synopsisLabel:UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: StringConstants.synopsis, textColor: .white, font: .systemFont16Medium)
        return this
    }()
    
    lazy var synopsisText:UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: "", textColor: .movieColorGray2, font: .systemFont12Regular, numberOfLines: 5)
        return this
    }()
}
