//
//  SearchPageViewController.swift
//  Mozemoz
//
//  Created by Nirav Desai on 27/09/22.
//

import UIKit

class SearchPageViewController: UIViewController {

    @IBOutlet weak var txtSeachBar: UITextField!
    @IBOutlet weak var autoslider_coll_view: UICollectionView!
    
    @IBOutlet weak var tblview: UITableView!
    let arrForplaceNames = ["Mumbai", "Goa"
                            , "Kerela", "Maldives", "Tokyo"]
    let arrOfimages = [UIImage(named: "Mumbai"), UIImage(named: "Goa"),UIImage(named: "Kerela"), UIImage(named: "Maldives"),UIImage(named: "Tokyo")
    ]
    let arrdistance = ["10 km","100 km", "1000 km","20 km", "200 km", "2000 km"]
    override func viewDidLoad() {
        super.viewDidLoad()
        txtSeachBar.layer.masksToBounds = true
        txtSeachBar.layer.cornerRadius = 25
        autoslider_coll_view.layer.masksToBounds = true
        autoslider_coll_view.layer.cornerRadius = 20
    }
}
extension SearchPageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrOfimages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchPageCollectionViewCell", for: indexPath) as! SearchPageCollectionViewCell
        cell.imgSlider.layer.masksToBounds = true
        cell.imgSlider.layer.cornerRadius = 15
        cell.imgSlider.image = arrOfimages[indexPath.row]
        return cell
    }
}
extension SearchPageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageSetTableViewCell") as! ImageSetTableViewCell
        cell.lblTitle.text = arrForplaceNames[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
}
