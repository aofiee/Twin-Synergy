//
//  AlbumListMobileViewController.swift
//  Twin Synergy
//
//  Created by SkullTree on 24/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import UIKit

class AlbumListMobileViewController: CustomNormalView {
    @IBOutlet weak var viewCollection: UICollectionView!
    fileprivate let itemsPerRow: CGFloat = 2
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 10.0, right: 10.0)
    private var mobileListViewModel: MobileViewModel!
    private var webListViewModel: WebViewModel!
    private var dataAccess :DataAccess!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataAccess = DataAccess()
        mobileListViewModel = MobileViewModel(dataAccess: dataAccess)
        webListViewModel = WebViewModel(dataAccess: dataAccess)
        viewCollection.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AlbumListMobileViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(self.mobileListViewModel.mobileViewModels.count)
        return self.mobileListViewModel.mobileViewModels.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumListMobileCell", for: indexPath) as! albumListCollectionViewCell
        cell.coverImageView.image = UIImage.init(named: self.mobileListViewModel.mobileViewModels[indexPath.item].mobileCoverLand)
        cell.headerLabel.text = self.mobileListViewModel.mobileViewModels[indexPath.item].mobileTitle
        cell.descLabel.text = self.mobileListViewModel.mobileViewModels[indexPath.item].mobileDescription
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let storyboardName = self.mobileListViewModel.mobileViewModels[indexPath.item].storyboardName, self.mobileListViewModel.mobileViewModels[indexPath.item].storyboardName != nil else {
            return
        }
        print("storyboardName")
        print(storyboardName)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "faceRekognitionViewController") as! faceRekognitionViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension AlbumListMobileViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let availableHeight = (view.frame.height/2)
        let widthPerItem = availableWidth / itemsPerRow
        let heightPerItem = availableHeight / itemsPerRow
        return CGSize(width: widthPerItem, height: heightPerItem)
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
