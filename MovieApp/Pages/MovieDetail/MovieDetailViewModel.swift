//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import Foundation
import iOSUtilities

// MARK: - MovieDetailViewModel
final class MovieDetailViewModel{
    
    var posterImage = ""
    var title = ""
    var overview = ""
    var rating = ""
    var releaseDate = ""
    var genreArray:[MovieDetailCell.ViewModel] = []
    var id = ""
    var director = ""
    
    
    func setDetail(movie:MovieDetailObj?){
        id = movie?.id ?? ""
        title = movie?.title ?? ""
        posterImage = movie?.poster_path ?? ""
        overview = movie?.overview ?? ""
        rating = "\(movie?.vote_average ?? "") (IMDb)"
        releaseDate = movie?.release_date?.getFormattedDate() ?? ""
        director = "Director: \(movie?.director?.capitalized ?? "")"
        genreArray = convertToGenreObj(genreList: movie?.genres ?? [])
    }
}
