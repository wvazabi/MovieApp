//
//  MovieExtension.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import UIKit
import Entities

// MARK: MovieViewModel Delegate
extension MovieDetailViewController: MovieDetailDelegate {
    
    func sendMovieDetail(data: Movie?) {
        let movie = data?.convertMovieToMovieDetailObj()
        viewModel.setDetail(movie: movie)
    }
    
    func makeSnapShot(data:[MovieDetailCell.ViewModel]){
        var snapshot = Snapshot()
        snapshot.appendSections([Section.movie])
        snapshot.appendItems(data)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

//MARK:- Actions
extension MovieDetailViewController{
    //Update View Data
    func updateData(){
        contentView.discoverDetailHeaderViewOne.posterImage.loadImageWithUrl(URL(string: viewModel.posterImage)!)
        contentView.discoverDetailHeaderViewOne.titleLabel.text = viewModel.title
        contentView.discoverDetailHeaderViewOne.directorLabel.text = viewModel.director
        contentView.discoverDetailBodyView.synopsisText.text = viewModel.overview
        contentView.discoverDetailHeaderViewOne.ratingLabel.text = viewModel.rating
        contentView.discoverDetailHeaderViewTwo.releaseDateText.text = viewModel.releaseDate
        let genreList = viewModel.genreArray
        
        //Update Collection View DataSource
        makeSnapShot(data: genreList)
    }
}

