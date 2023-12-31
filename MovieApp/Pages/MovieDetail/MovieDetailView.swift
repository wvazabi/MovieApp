//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import UIKit
import iOSUtilities

final class MovieDetailView: UIView {
    
    let collectionView: UICollectionView = {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(200),
            heightDimension: .fractionalHeight(1.0))
        let itemLayout = NSCollectionLayoutItem(layoutSize: itemSize)
        itemLayout.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: CGFloat.margin2x)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(CGFloat.size35))
        
        let groupLayout = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: itemLayout,
            count: 2)

        groupLayout.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: groupLayout)
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.interGroupSpacing = 8
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        let this = UICollectionView(frame: .zero, collectionViewLayout: layout)
        this.translatesAutoresizingMaskIntoConstraints = false
        this.backgroundColor = .clear
        return this
    }()
    
    lazy var movieDetailHeaderViewOne = MovieDetailHeaderView()
    lazy var movieDetailHeaderViewTwo = MovieDetailHeaderViewTwo()
    lazy var movieDetailBodyView = MovieDetailBodyView()
    
  
    convenience init() {
        self.init(frame: .zero)
        configureView()
        configureSubviews()
        configureConstraints()
    }

    private func configureView() {
        backgroundColor = .movieBackgroundColor
    }

    private func configureSubviews() {
        addSubview(movieDetailHeaderViewOne.posterImage)
        addSubview(movieDetailHeaderViewOne.titleLabel)
        addSubview(movieDetailHeaderViewOne.ratingLabel)
        addSubview(movieDetailHeaderViewOne.ratingImage)
        addSubview(movieDetailHeaderViewOne.directorLabel)
        addSubview(movieDetailHeaderViewOne.lineView)
        addSubview(movieDetailHeaderViewTwo.fourKView)
        addSubview(movieDetailHeaderViewTwo.fourKLabel)
        addSubview(movieDetailHeaderViewTwo.releaseDateLabel)
        addSubview(movieDetailHeaderViewTwo.releaseDateText)
        addSubview(movieDetailBodyView.genreLabel)
        addSubview(collectionView)
        addSubview(movieDetailBodyView.lineViewTwo)
        addSubview(movieDetailBodyView.synopsisLabel)
        addSubview(movieDetailBodyView.synopsisText)
    }

   
}

