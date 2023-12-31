//
//  MovieDetailHeaderViewTwo.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import UIKit
import iOSUtilities

// MARK: - MovieDetailHeaderViewTwo

/// This class defines the header view for displaying details about a movie. It includes properties for a 4K view, 4K label, release date label, and release date text.

final class MovieDetailHeaderViewTwo: UIView {
   
    lazy var fourKView:UIView = {
        let this = UIView()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.backgroundColor = .movieColorGrayWhite2
        this.layer.cornerRadius = CGFloat.size5
        this.layer.borderWidth = CGFloat.lineHeight
        this.layer.borderColor = UIColor.movieColorGray3.cgColor
        return this
    }()
    
    lazy var fourKLabel:UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: StringConstants.fourK, textColor: .white,font: .systemFont12Regular)
        return this
    }()
    
    lazy var releaseDateLabel:UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: StringConstants.releaseDate, textColor: .white, font: .systemFont16Medium)
        return this
    }()
    
    lazy var releaseDateText:UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: "", textColor: .movieColorGray2,font: .systemFont12Regular)
        return this
    }()
}
