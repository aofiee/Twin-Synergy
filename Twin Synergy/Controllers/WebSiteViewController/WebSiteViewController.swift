//
//  WebSiteViewController.swift
//  Twin Synergy
//
//  Created by SkullTree on 16/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import UIKit

class WebSiteViewController: UIViewController {
    @IBOutlet weak var myTab: UITableView!
    fileprivate let itemsPerRow: CGFloat = 3
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)
    private var mobileListViewModel: MobileViewModel!
    private var webListViewModel: WebViewModel!
    private var dataAccess :DataAccess!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataAccess = DataAccess()
        self.mobileListViewModel = MobileViewModel(dataAccess: self.dataAccess)
        self.webListViewModel = WebViewModel(dataAccess: self.dataAccess)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension WebSiteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.webListViewModel.webViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell", for: indexPath) as! homeTableViewCell
        cell.coverImageView.image = UIImage.init(named: self.webListViewModel.webViewModels[indexPath.row].webCover)
        cell.titleLabel.text = self.webListViewModel.webViewModels[indexPath.row].webTitle
        cell.descLabel.text = self.webListViewModel.webViewModels[indexPath.row].webDescription
        cell.contentView.alpha = 0
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 304;
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var myView = UIView()
        myView = cell.contentView
        UIView.animate(withDuration: 0.8, animations: {
            myView.alpha = 1.0
        })
    }
}

extension WebSiteViewController: UICollectionViewDataSource, UICollectionViewDelegate {
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
