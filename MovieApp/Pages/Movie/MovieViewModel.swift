//
//  MovieViewModelDelegate.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import Entities
import API
import iOSUtilities

protocol MovieViewModelDelegate: AnyObject {
    func movieViewModel(_ viewModel: MovieViewModel, didLoad data: [MovieCell.ViewModel])
    func fetchSingleMovieSuccess(_ movie:Movie)
    func sendError(error:String)
}

final class MovieViewModel {
    
    //MARK:- Properties
     
    weak var delegate: MovieViewModelDelegate?
    var detaildelegate: MovieDetailDelegate?
    private let session: Session
    var showAlert: Bool = true
    private var movies: [Movie] = [] {
        didSet {
            delegate?.movieViewModel(self, didLoad: movies.map { movie in
                return MovieCell.ViewModel(
                    id: movie.id.isNil(value: ""),
                    title: movie.title.isNil(value: ""),
                    image:movie.poster_path.isNil(value: ""),
                    year: movie.year.isNil(value: ""),
                    uuid: movie.uuid.uuidString
                )
            })
        }
    }
    private var fetchedMovie:Movie?
    
    init(session: Session) {
        self.session = session
    }

    func viewDidLoad() {
        //Fetch "X" for me It's Star Wars Movies to be displayed on the home page
        Movie.getNowPlaying(page: "1").response(using: session.client) { [weak self] response in
            
            DispatchQueue.main.async {
                
                switch response{
                case .success(let data):
                    
                    self?.movies =  data.search ?? []
                    
                    
                case .failure(let error):
                    
                    self?.delegate?.sendError(error: error.errorDescription.isNil(value: ""))
                }
            }
        }
    }
    
    //Search for movies
    func queryMovie(query:String){
        Movie.queryMovie(query: query).response(using: session.client) { [weak self] response in
            
            DispatchQueue.main.async {
                
                switch response{
                    
                case .success(let data):
                   
                    self?.movies =  data.search ?? []
                                                        
                    
                case .failure(let error):
                 
                    self?.delegate?.sendError(error: error.errorDescription.isNil(value: ""))
                }
                
            }
        }
    }
    
    //Fetch a single movie
    func getSingleMovie(imdbId:String){
        Movie.getMovie(query: imdbId).response(using: session.client) { [weak self] response in
            
            DispatchQueue.main.async {
                
                switch response{
                    
                case .success(let data):
                   
                    self?.fetchedMovie =  data
                    self?.delegate?.fetchSingleMovieSuccess(data)
                    
                case .failure(let error):
                   
                    self?.delegate?.sendError(error: error.errorDescription.isNil(value: ""))
                }
                
            }
        }
    }
    
    //Send Fetched Movie
    func sendMovieDetail(){

        let movie = fetchedMovie
        detaildelegate?.sendMovieDetail(data: movie)
    }
    
    //Get Movie ID
    func getSelectedMovieId(cell:MovieCell.ViewModel) -> String?{
        
        return movies.filter{ $0.id == cell.id }.first?.id
    }
    
  
}

