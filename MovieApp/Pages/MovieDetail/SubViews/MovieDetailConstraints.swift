//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import UIKit

// MARK: - MovieDetailView (Constraints)

extension MovieDetailView{
    func configureConstraints() {
        
        NSLayoutConstraint.activate([
            movieDetailHeaderViewOne.posterImage.topAnchor.constraint(equalTo: topAnchor),
            movieDetailHeaderViewOne.posterImage.bottomAnchor.constraint(equalTo:centerYAnchor),
            movieDetailHeaderViewOne.posterImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieDetailHeaderViewOne.posterImage.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            movieDetailHeaderViewOne.titleLabel.topAnchor.constraint(equalTo: movieDetailHeaderViewOne.posterImage.bottomAnchor, constant: CGFloat.size10),
            movieDetailHeaderViewOne.titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.size20),
            movieDetailHeaderViewOne.titleLabel.trailingAnchor.constraint(equalTo: movieDetailHeaderViewTwo.fourKView.trailingAnchor, constant: -CGFloat.size40),
        ])
        
        NSLayoutConstraint.activate([
            movieDetailHeaderViewOne.ratingImage.topAnchor.constraint(equalTo: movieDetailHeaderViewOne.titleLabel.bottomAnchor, constant: CGFloat.size10),
            movieDetailHeaderViewOne.ratingImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.size20),
        ])
        
        NSLayoutConstraint.activate([
            movieDetailHeaderViewOne.ratingLabel.centerYAnchor.constraint(equalTo: movieDetailHeaderViewOne.ratingImage.centerYAnchor),
            movieDetailHeaderViewOne.ratingLabel.leadingAnchor.constraint(equalTo: movieDetailHeaderViewOne.ratingImage.trailingAnchor, constant: CGFloat.size5),
        ])
        
        NSLayoutConstraint.activate([
            movieDetailHeaderViewOne.directorLabel.topAnchor.constraint(equalTo: movieDetailHeaderViewOne.ratingImage.bottomAnchor, constant: CGFloat.size5),
            movieDetailHeaderViewOne.directorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.size20),
            movieDetailHeaderViewOne.directorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.size20),
        ])
        
        NSLayoutConstraint.activate([
            movieDetailHeaderViewOne.lineView.topAnchor.constraint(equalTo: movieDetailHeaderViewOne.directorLabel.bottomAnchor, constant: CGFloat.size10),
            movieDetailHeaderViewOne.lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.size20),
            movieDetailHeaderViewOne.lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.size20),
            movieDetailHeaderViewOne.lineView.heightAnchor.constraint(equalToConstant: CGFloat.lineHeight)
        ])
        
        NSLayoutConstraint.activate([
            movieDetailHeaderViewTwo.fourKView.centerYAnchor.constraint(equalTo: movieDetailHeaderViewOne.titleLabel.centerYAnchor),
            movieDetailHeaderViewTwo.fourKView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.size20),
            movieDetailHeaderViewTwo.fourKView.widthAnchor.constraint(equalToConstant: CGFloat.size25),
            movieDetailHeaderViewTwo.fourKView.heightAnchor.constraint(equalToConstant: CGFloat.size25)
        ])
        
        NSLayoutConstraint.activate([
            movieDetailHeaderViewTwo.fourKLabel.centerYAnchor.constraint(equalTo: movieDetailHeaderViewTwo.fourKView.centerYAnchor),
            movieDetailHeaderViewTwo.fourKLabel.centerXAnchor.constraint(equalTo: movieDetailHeaderViewTwo.fourKView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            movieDetailHeaderViewTwo.releaseDateLabel.topAnchor.constraint(equalTo: movieDetailHeaderViewOne.lineView.bottomAnchor, constant: CGFloat.size10),
            movieDetailHeaderViewTwo.releaseDateLabel.leadingAnchor.constraint(equalTo: movieDetailHeaderViewOne.titleLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            movieDetailHeaderViewTwo.releaseDateText.topAnchor.constraint(equalTo: movieDetailHeaderViewTwo.releaseDateLabel.bottomAnchor, constant: CGFloat.size5),
            movieDetailHeaderViewTwo.releaseDateText.leadingAnchor.constraint(equalTo: movieDetailHeaderViewTwo.releaseDateLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            movieDetailBodyView.genreLabel.centerYAnchor.constraint(equalTo: movieDetailHeaderViewTwo.releaseDateLabel.centerYAnchor),
            movieDetailBodyView.genreLabel.leadingAnchor.constraint(equalTo: movieDetailHeaderViewTwo.releaseDateLabel.trailingAnchor, constant: CGFloat.size50)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: movieDetailBodyView.genreLabel.bottomAnchor, constant: CGFloat.size10),
            collectionView.heightAnchor.constraint(equalToConstant: CGFloat.size20),
            collectionView.leadingAnchor.constraint(equalTo: movieDetailBodyView.genreLabel.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo:trailingAnchor, constant: -CGFloat.size20)
        ])
        
        NSLayoutConstraint.activate([
            movieDetailBodyView.lineViewTwo.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: CGFloat.size5),
            movieDetailBodyView.lineViewTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.size20),
            movieDetailBodyView.lineViewTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.size20),
            movieDetailBodyView.lineViewTwo.heightAnchor.constraint(equalToConstant: CGFloat.lineHeight)
        ])
        
        NSLayoutConstraint.activate([
            movieDetailBodyView.synopsisLabel.topAnchor.constraint(equalTo: movieDetailBodyView.lineViewTwo.bottomAnchor, constant: CGFloat.size20),
            movieDetailBodyView.synopsisLabel.leadingAnchor.constraint(equalTo: movieDetailHeaderViewOne.titleLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            movieDetailBodyView.synopsisText.topAnchor.constraint(equalTo: movieDetailBodyView.synopsisLabel.bottomAnchor, constant: CGFloat.size10),
            movieDetailBodyView.synopsisText.leadingAnchor.constraint(equalTo: movieDetailHeaderViewOne.titleLabel.leadingAnchor),
            movieDetailBodyView.synopsisText.trailingAnchor.constraint(equalTo: movieDetailBodyView.lineViewTwo.trailingAnchor)
        ])
        
    }
}
