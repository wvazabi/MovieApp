//
//  MovieDelegates.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import UIKit
import iOSUtilities
import Entities

// MARK: MovieViewModel Delegate
extension MovieViewController: MovieViewModelDelegate {
    //Move to next screen after fetching single movie
    func fetchSingleMovieSuccess(_ movie: Movie) {
        
        appCoordinator?.moveToMovieDetail(viewModel: viewModel)
        viewModel.detaildelegate?.sendMovieDetail(data: movie)
    }
    
    //Show Error if any
    func sendError(error: String) {
        simpleAlert(title: error)
    }
    
    func movieViewModel(_ viewModel: MovieViewModel, didLoad data: [MovieCell.ViewModel]) {
        cellData = data
    }
}

// MARK:- CollectionView Delegate
extension MovieViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
        
        //Animate Cell
        animateView {
            cell.transform = .init(scaleX: 0.9, y: 0.9)
        } completedaction: {
            print("do nothing")
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
        
        //Animate Cell
        animateView {
            cell.transform = .identity
        } completedaction: {
            print("do nothing")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else {return}
        viewModel.getSingleMovie(imdbId: item.id)
        
    }
    
}

// MARK: UISearchBar Delegate
extension MovieViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //This is done to ensure the api call do not trigger on every textchange, this approach drive effieciency
        let debouncedFunc = debounce(interval: 2000, queue: .main) { [weak self] in
            
            if searchText != ""{
                self?.viewModel.queryMovie(query: searchText)
                
            }else{
                self?.viewModel.showAlert = false
                self?.viewModel.viewDidLoad()
            }
            
        }
        debouncedFunc()
    }
}

