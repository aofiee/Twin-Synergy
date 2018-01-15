//
//  albumViewController.swift
//  Twin Synergy
//
//  Created by SkullTree on 14/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import UIKit
class albumViewController: UIViewController {
    
    fileprivate let itemsPerRow: CGFloat = 2
    fileprivate let sectionInsets = UIEdgeInsets(top: 25.0, left: 20.0, bottom: 20.0, right: 25.0)

    private var albumListViewModel :AlbumViewModel!
    private var dataAccess :DataAccess!
    @IBOutlet var viewCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataAccess = DataAccess()
        self.albumListViewModel = AlbumViewModel(dataAccess: self.dataAccess)
        viewCollection.reloadData()
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