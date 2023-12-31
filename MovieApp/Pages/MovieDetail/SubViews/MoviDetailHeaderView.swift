//
//  MovieDetailHeaderView.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//


import UIKit
import iOSUtilities
//import iOSUtilities

// MARK: - MovieDetailHeaderView
/// Defines the header view for displaying movie details.
final class MovieDetailHeaderView: UIView {
    
    lazy var posterImage:ImageLoader = {
        let this = ImageLoader()
        this.setUpImageLoader(image: "", contentMode: .scaleAspectFill)
        return this
    }()
    
    lazy var titleLabel:UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: "",textColor: .white, font: UIFont.preferredFont(forTextStyle: .title3), numberOfLines: 2)
        return this
    }()
    
    lazy var ratingImage:UIImageView = {
        let this = UIImageView()
        this.setUpImageView(image: StringConstants.rateImageUnselect, contentMode: .scaleAspectFill)
        return this
    }()
    
    lazy var ratingLabel:UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: StringConstants.rate, textColor: .movieColorGray2,font: .systemFont(ofSize: CGFloat.margin3x, weight: .regular))
        return this
    }()
    
    lazy var directorLabel:UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: StringConstants.director, textColor: .movieColorGray2,font: .systemFont(ofSize: CGFloat.size10, weight: .light))
        return this
    }()
    
    lazy var lineView:UIView = {
        let this = UIView()
        this.backgroundColor = .movieColorDarkGray
        this.translatesAutoresizingMaskIntoConstraints = false
        return this
    }()
    
}
