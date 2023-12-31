//
//  MovieCell.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//
// MARK: - MovieCell

import UIKit
import iOSUtilities

final class MovieCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let titleLabel: UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: "", textColor: .white, font: .systemFont14Medium,
                           numberOfLines: 3)
        return this
    }()
    
    let imageView: ImageLoader = {
        let this = ImageLoader()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.contentMode = .scaleToFill
        this.backgroundColor = .red
        this.clipsToBounds = true
        this.layer.cornerRadius = CGFloat.size18
        return this
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configureSubviews() {
        addSubview(titleLabel)
        addSubview(imageView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -CGFloat.size60)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: CGFloat.size10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}

// MARK: - MovieCell ViewModel

extension MovieCell {
    struct ViewModel: Hashable {
        let id: String
        let title: String
        let image: String
        let year: String
        let uuid: String
    }
    
    func populate(data: ViewModel) {
        titleLabel.text = "\(data.title) (\(data.year))"
        imageView.loadImageWithUrl(URL(string: data.image) ?? URL(fileURLWithPath: ""))
    }
}
