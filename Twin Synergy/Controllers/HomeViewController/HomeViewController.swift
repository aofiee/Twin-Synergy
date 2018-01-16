//
//  HomeViewController.swift
//  Twin Synergy
//
//  Created by SkullTree on 30/12/2560 BE.
//  Copyright © 2560 SkullTree. All rights reserved.
//

import UIKit

class HomeViewController: CustomNavigationController {

    @IBOutlet var viewCollection: UICollectionView!
    fileprivate let itemsPerRow: CGFloat = 3
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 0.0, right: 10.0)
    private var mobileListViewModel :MobileViewModel!
    private var dataAccess :DataAccess!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataAccess = DataAccess()
        self.mobileListViewModel = MobileViewModel(dataAccess: self.dataAccess)
        viewCollection.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(self.mobileListViewModel.mobileViewModels.count)
        return self.mobileListViewModel.mobileViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeMobileCell", for: indexPath) as! homeCollectionViewCell
        cell.coverImage.image = UIImage.init(named: self.mobileListViewModel.mobileViewModels[indexPath.item].mobileCover)
        cell.titleHeader.text = self.mobileListViewModel.mobileViewModels[indexPath.item].mobileTitle
        cell.desc.text = self.mobileListViewModel.mobileViewModels[indexPath.item].mobileDescription
        return cell
    }
    
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let paddingSpaceTop = sectionInsets.top * 2
        let availableWidth = view.frame.width - paddingSpace
        let availableHeight = (view.frame.height / itemsPerRow) - paddingSpaceTop
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: availableHeight)
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
