//
//  MovieDetailModel.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import Entities
import API
import iOSUtilities

// This is the MovieDetail module.

// MARK: - MovieDetail

protocol MovieDetailDelegate {
    func sendMovieDetail(data:Movie?)
}

struct MovieDetailObj{
    public let id:String?
    public let title: String?
    public let poster_path:String?
    public let release_date:String?
    public let overview:String?
    public let vote_average:String?
    public let director:String?
    public let genres:[String]
}

extension Movie{
    func convertMovieToMovieDetailObj() -> MovieDetailObj{
        return MovieDetailObj(id: self.id, title: self.title, poster_path: self.poster_path, release_date: self.release_date, overview: self.overview, vote_average: self.vote_average, director: self.director, genres: createMovieGenreList(genreList: self.genre))
    }
}

func createMovieGenreList(genreList:String?) -> [String]{
    return genreList?.components(separatedBy: ",") ?? []
}

//MARK:- MovieGenre
func convertToGenreObj(genreList:[String]) -> [MovieDetailCell.ViewModel]{
    let newArray = genreList.map{ value in
        return MovieDetailCell.ViewModel(genre: value)
    }
    return newArray
}



