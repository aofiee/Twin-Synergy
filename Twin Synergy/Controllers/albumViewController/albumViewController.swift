//
//  albumViewController.swift
//  Twin Synergy
//
//  Created by SkullTree on 14/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import UIKit
class albumViewController: CustomNavigationController {
    
    fileprivate let itemsPerRow: CGFloat = 2
    fileprivate let sectionInsets = UIEdgeInsets(top: 25.0, left: 20.0, bottom: 20.0, right: 25.0)

    private var albumListViewModel :AlbumViewModel!
    private var dataAccess :DataAccess!
    @IBOutlet weak var viewCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataAccess = DataAccess()
        self.albumListViewModel = AlbumViewModel(dataAccess: self.dataAccess)
        viewCollection.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewCollection.delegate = self
        viewCollection.dataSource = self
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewCollection.delegate = nil
        viewCollection.dataSource = nil
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension albumViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(self.albumListViewModel.albumViewModels.count)
        return self.albumListViewModel.albumViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath) as! albumCollectionViewCell
        cell.coverImage.image = UIImage.init(named: self.albumListViewModel.albumViewModels[indexPath.item].albumCover)
        cell.albumTitle.text = self.albumListViewModel.albumViewModels[indexPath.item].albumTitle
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AlbumContainerViewController") as! AlbumContainerViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension albumViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
