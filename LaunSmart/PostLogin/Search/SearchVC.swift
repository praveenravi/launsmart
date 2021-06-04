//
//  SearchVC.swift
//  LaunSmart
//
//  Created by apple on 18/03/21.
//

import UIKit
private let reuseIdentifier = "FranchiseCell"
class SearchVC: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var searchTextField : UITextField?
    @IBOutlet weak var collectionView : UICollectionView?
    @IBOutlet weak var bottomScrolView : UIScrollView?
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        // Register cell classes
       // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
    }
    // MARK: Button Actions
    @IBAction func mapIconPressed(sender : UIButton)
    {
        self.gotoMapPage()
    }
    // MARK: UICollectionViewDataSource

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 50
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? FranchiseCCell
    
        // Configure the cell
    
        return cell!
    }
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        self.gotoDetailPage()
    }
    func gotoDetailPage()
    {
        let detailPageInstance = SearchDetailVC.instance()
        self.navigationController?.pushViewController(detailPageInstance, animated: true)
    }
    func gotoMapPage()
    {
        let detailPageInstance = MapSearchVC.instance()
        self.navigationController?.pushViewController(detailPageInstance, animated: true)
    }

}
