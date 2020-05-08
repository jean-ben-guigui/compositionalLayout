//
//  ViewController.swift
//  galleryPhoto
//
//  Created by Arthur Duver on 07/05/2020.
//  Copyright © 2020 Arthur Duver. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	//MARK: - properties
	enum Section {
        case main
    }

    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
	
	//MARK: - Outlets
	@IBOutlet weak var collectionView: UICollectionView!
	
	//MARK: - Functions

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		configureDataSource()
	}
	
	private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in

            // Get a cell of the desired kind.
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CollectionViewCell.identifier,
                for: indexPath) as? CollectionViewCell else { fatalError("Cannot create new cell") }

            // Populate the cell with our item description.
            cell.title.text = "\(identifier)"

            // Return the cell.
            return cell
        }

        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<94))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

