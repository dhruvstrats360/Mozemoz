//
//  ImageSetTableViewCell.swift
//  Mozemoz
//
//  Created by Nirav Desai on 27/09/22.
//

import UIKit

class ImageSetTableViewCell: UITableViewCell {
    let arrForplaceNames2 = ["TajMahel" , "Mumbai", "Goa"
                            , "Kerela", "Maldives", "Tokyo"]
    let arrOfimages2 = [UIImage(named: "TajMahel"), UIImage(named: "Mumbai"), UIImage(named: "Goa"),UIImage(named: "Kerela"), UIImage(named: "Maldives"),UIImage(named: "Tokyo")
    ]
    let arrdistance2 = ["10 km","100 km", "1000 km","20 km", "200 km", "2000 km"]
    @IBOutlet weak var setOfImagesview: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setOfImagesview.delegate = self as UICollectionViewDelegate
        setOfImagesview.dataSource = self as UICollectionViewDataSource
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ImageSetTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrOfimages2.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imgSet.layer.masksToBounds = true
        cell.imgSet.layer.cornerRadius = 15
        cell.imgSet.backgroundColor = .lightGray
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {
           let leftAndRightPaddings: CGFloat = 30.0
           let numberOfItemsPerRow: CGFloat = 2.0

           let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
           return CGSize(width: width, height: width) // You can change width and height here as pr your requirement

       }
    
}
