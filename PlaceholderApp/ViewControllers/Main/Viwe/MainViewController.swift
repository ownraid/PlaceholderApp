//
//  MainCollectionViewCell.swift
//  PlaceholderApp
//
//  Created by Own on 31/07/2026.
//

import UIKit

class MainViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {

    @IBOutlet weak var collectionViewCard: UIView!
    @IBOutlet weak var welcomeCard: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    let viewModel = mainViewModel()
    var username: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupCollectionView()

        // Do any additional setup after loading the view.
    }
    
    func configureUI() {
        usernameLabel.text = username
    }
    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName : MainCollectionViewCell.identifier,
                                      bundle: nil)  , forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        
    }
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {

        return viewModel.numberOfItems()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainCollectionViewCell.identifier,
            for: indexPath
        ) as? MainCollectionViewCell else {

            return UICollectionViewCell()
        }

        let item = viewModel.item(at: indexPath.item)
        cell.configure(with: item)
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {

        let dataVC = DataViewController()
            
        switch indexPath.item {

        case 0:
            dataVC.dataType = .posts

        case 1:
            dataVC.dataType = .users

        case 2:
            dataVC.dataType = .todos

        default:
            return
        }
            navigationController?.pushViewController(dataVC, animated: true)
    }

}
