//
//  HomePageViewController.swift
//  Mozemoz
//
//  Created by Nirav Desai on 28/09/22.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var showVideo_CollView: UICollectionView!
    let arrForplaceNames = ["Mumbai", "Goa"
                            , "Kerela", "Maldives", "Tokyo"]
    let arrOfimages = [UIImage(named: "White_img"), UIImage(named: "Goa"),UIImage(named: "Kerela"), UIImage(named: "Maldives"),UIImage(named: "Tokyo")
    ]
    let arrdistance = ["10 km","100 km", "1000 km","20 km", "200 km", "2000 km"]
    override func viewDidLoad() {
        super.viewDidLoad()
        showVideo_CollView.isPagingEnabled = true
        showVideo_CollView.frame = .zero
    }
    func imageEditing(img: UIImageView){
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 30
        img.animationImages = [UIImage(named: "Mumbai")!, UIImage(named: "Goa")!,UIImage(named: "Kerela")!, UIImage(named: "Maldives")!,UIImage(named: "Tokyo")!
        ]
        img.animationDuration = 100
        img.animationRepeatCount = 10
        
    }
    func editBTns(arrbtn: [UIButton]){
        for i in 0..<arrbtn.count{
            arrbtn[i].layer.masksToBounds = true
            arrbtn[i].layer.cornerRadius = 22
        }
    }
}
extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrOfimages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCollectionViewCell", for: indexPath) as! HomePageCollectionViewCell
        cell.imgBackground.image = arrOfimages[indexPath.row]
        cell.imgSong.image = UIImage(named: "LOGO")
        cell.imgProfileimg.image = UIImage(named: "professional - tina")
        
        imageEditing(img: cell.imgSong)
        imageEditing(img: cell.imgProfileimg)
        editBTns(arrbtn: [cell.btnLike,cell.btnShare,cell.btnFollow,cell.btnMessages])
        cell.lblSongName.text = arrForplaceNames[indexPath.row]
        return cell
    }
}
