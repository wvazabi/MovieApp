//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//



import UIKit
import Entities
import iOSUtilities

class MovieDetailViewController: UIViewController  {
    
    //MARK:- Properties
    let contentView = MovieDetailView()
    let viewModel: MovieDetailViewModel
    var isFavorite = false
    private typealias CellRegistration = UICollectionView.CellRegistration<MovieDetailCell, MovieDetailCell.ViewModel>
    typealias DataSource = UICollectionViewDiffableDataSource<Section, MovieDetailCell.ViewModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, MovieDetailCell.ViewModel>
    private let cellRegistration = CellRegistration { $0.populate(data: $2) }
    
    enum Section {
        case movie
    }
    
    //MARK:- DataSource
     lazy var dataSource: DataSource = {
        return DataSource(
            collectionView: contentView.collectionView,
            cellProvider: { (collectionView, indexPath, cellData) -> UICollectionViewCell? in
                return collectionView.dequeueConfiguredReusableCell(
                    using: self.cellRegistration,
                    for: indexPath,
                    item: cellData
                )
            }
        )
    }()
    
    //Mark:- Dependency Injection
    init(viewModel:MovieDetailViewModel) {
       
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- LoadView
    override func loadView() {
        view = contentView
    }
    
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        computeIsFavorite()
        setUpFavoriteImageClicked()
        updateData()
        
    }
    
    //MARK:- ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        setupNavSettings()
    }
    
    
}


