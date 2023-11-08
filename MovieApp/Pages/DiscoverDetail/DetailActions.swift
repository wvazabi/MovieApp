//
//  DetailActions.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import UIKit
import iOSUtilities
// MARK: - MovieDetailViewController (Favorite Actions)

extension MovieDetailViewController {
    
    // MARK: - Image Click Action
    
    @objc func clickOnImage() {
        
        if isFavorite {
            contentView.discoverDetailHeaderViewOne.ratingImage.image = UIImage(named: StringConstants.rateImageUnselect)
            isFavorite = false
            deleteItemFromFavorites()
            
            animateView(action: { [weak self] in
                self?.contentView.discoverDetailHeaderViewOne.ratingImage.transform = .init(scaleX: 0.8, y: 0.8)
            }, completedaction: { [weak self] in
                self?.contentView.discoverDetailHeaderViewOne.ratingImage.transform = .identity
            })
            
        } else {
            contentView.discoverDetailHeaderViewOne.ratingImage.image = UIImage(named: StringConstants.rateImage)
            saveItemToFavorites()
            isFavorite = true
            
            animateView(action: { [weak self] in
                self?.contentView.discoverDetailHeaderViewOne.ratingImage.transform = .init(scaleX: 1.2, y: 1.2)
            }, completedaction: { [weak self] in
                self?.contentView.discoverDetailHeaderViewOne.ratingImage.transform = .identity
            })
        }
    }
    
    // MARK: - Set Up Favorite Image Clicked
    
    func setUpFavoriteImageClicked() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clickOnImage))
        contentView.discoverDetailHeaderViewOne.ratingImage.isUserInteractionEnabled = true
        contentView.discoverDetailHeaderViewOne.ratingImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK: - Save Item to Favorites
    
    func saveItemToFavorites() {
        if !checkIfInFavoriteList() {
            var favorites = retrieveArrayFromUserDefault(identifier: StringConstants.favorites)
            favorites.append(viewModel.id)
            saveArrayToUserDefault(array: favorites, identifier: StringConstants.favorites)
        }
    }
    
    // MARK: - Delete Item from Favorites
    
    func deleteItemFromFavorites() {
        let favorites = retrieveArrayFromUserDefault(identifier: StringConstants.favorites)
        let newFavorites = favorites.filter { $0 != viewModel.id }
        saveArrayToUserDefault(array: newFavorites, identifier: StringConstants.favorites)
    }
    
    // MARK: - Compute Is Favorite
    
    func computeIsFavorite() {
        if checkIfInFavoriteList() {
            isFavorite = true
            contentView.discoverDetailHeaderViewOne.ratingImage.image = UIImage(named: StringConstants.rateImage)
        } else {
            isFavorite = false
            contentView.discoverDetailHeaderViewOne.ratingImage.image = UIImage(named: StringConstants.rateImageUnselect)
        }
    }
    
    // MARK: - Check If Item in Favorite List
    
    func checkIfInFavoriteList() -> Bool {
        let favorites = retrieveArrayFromUserDefault(identifier: StringConstants.favorites)
        return favorites.contains(viewModel.id)
    }
}
