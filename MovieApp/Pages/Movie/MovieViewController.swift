//
//  MovieViewController.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import UIKit
import iOSUtilities

final class MovieViewController: UIViewController {
    
    weak var appCoordinator:AppCoordinator?
    
    //MARK:- Properties
    let contentView = MovieView()
    let viewModel: MovieViewModel
    lazy var searchBar: UISearchBar = .init(frame: .zero)
    private typealias CellRegistration = UICollectionView.CellRegistration<MovieCell, MovieCell.ViewModel>
    typealias DataSource = UICollectionViewDiffableDataSource<Section, MovieCell.ViewModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, MovieCell.ViewModel>
    
    enum Section {
        case movies
    }
    
    private let cellRegistration = CellRegistration { $0.populate(data: $2) }
    
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
    
    //MARK:- Data To Display
    var cellData:[MovieCell.ViewModel] = []{
        
        didSet{
            setUpDataSource(data: cellData)
        }
    }
    
    init(viewModel: MovieViewModel, coordinator:AppCoordinator) {
        self.viewModel = viewModel
        self.appCoordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupNavigationBar()
        viewModel.viewDidLoad()
        setAlert()

       
    }
    
    override func loadView() {
        view = contentView
    }
    
    //MARK:- SetUpDelegates
    private func setupDelegates() {
        viewModel.delegate = self
        searchBar.delegate = self
        contentView.collectionView.delegate = self
    }
    
    //MARK:- NavigationBar
    private func setupNavigationBar() {
        searchBar.placeholder = "Search for movies..."
        searchBar.backgroundColor = .movieBackgroundColor
        searchBar.tintColor = .yellow
        searchBar.searchTextField.backgroundColor = .movieColorDarkGray
        searchBar.searchTextField.leftView?.tintColor = .white
        searchBar.searchTextField.textColor = .movieColorGray
        searchBar.searchTextField.font = .systemFont(ofSize: 14, weight: .medium)
        navigationItem.titleView = searchBar
    }
    
    //MARK:- Setup Datasource
    func setUpDataSource(data:[MovieCell.ViewModel]){
        var snapshot = Snapshot()
        snapshot.appendSections([Section.movies])
        snapshot.appendItems(data)
        dataSource.apply(snapshot, animatingDifferences: true)
        
    }
    
    func setAlert(){
        if viewModel.showAlert {
            self.presentmovieAlertOnMainThread(title: "Empty Movie Name", message: "Please enter a Movie Name. We need to know which to look for 🫠", buttonTitle: "Ok")
        }
    }
}

