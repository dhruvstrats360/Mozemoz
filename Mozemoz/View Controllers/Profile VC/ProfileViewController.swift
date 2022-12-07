//
//  ProfileViewController.swift
//  Mozemoz
//
//  Created by Nirav Desai on 17/11/22.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var postsCollectionView: UICollectionView!
    @IBOutlet weak var post_like_tabbar: UITabBar!
    let arrForplaceNames = ["Goa"
                            , "Kerela", "Maldives", "Tokyo","Mumbai"]
    let arrOfimages = [UIImage(named: "Goa"),UIImage(named: "Kerela"), UIImage(named: "Maldives"),UIImage(named: "Tokyo"),UIImage(named: "White_img")]
    override func viewDidLoad() {
        super.viewDidLoad()
        postsCollectionView.delegate = self
        postsCollectionView.dataSource = self
        // Do any additional setup after loading the view.
        guard storyboard?.instantiateViewController(withIdentifier: String(describing: ProfileViewController.self)) is ProfileViewController
            else {
            return
        }
        let contacts = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.contacts, tag: 100)
        let bookmarks = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.bookmarks, tag: 101)
        
         post_like_tabbar.setItems([contacts, bookmarks], animated: false)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        decesion()
        print("Logged In - View will appear")
    }
    func decesion(){
        print("\(String(describing: Auth.auth().currentUser?.isAnonymous)) Auth")
        if !((Auth.auth().currentUser?.isAnonymous) != nil){
            if let newVC = tabBarController?.storyboard?.instantiateViewController(withIdentifier: "SignInPageViewController") {
                if let fromVC = tabBarController?.storyboard?.instantiateViewController(withIdentifier: "SignInPageViewController"){
                    navigationController?.pushViewController(newVC, animated: true)
                    //            performSegue(withIdentifier: "LoginToSignIn", sender: self)
                }
            }
        }
    }
    @IBAction func SignOutPressed(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
            
            if let newVC = tabBarController?.storyboard?.instantiateViewController(withIdentifier: "SignInPageViewController") {
                if let fromVC = tabBarController?.storyboard?.instantiateViewController(withIdentifier: "SignInPageViewController"){
                    navigationController?.transition(from: fromVC, to: newVC, duration: 0.0, animations: .none)
                    navigationController?.pushViewController(newVC, animated: true)
                }
                
                
//                tabBarController?.present(newVC, animated: true)
                   }
        }
        catch{
            print("error in sign out")
        }
    }
}
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrOfimages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profilecell", for: indexPath) as! ProfileCollectionViewCell
        cell.img_post.image = arrOfimages[indexPath.row]
        cell.lblName.text = arrForplaceNames[indexPath.row]
        cell.img_post.layer.cornerRadius = 15
        cell.lblName.layer.cornerRadius = 15
        
        return cell
    }
    
    
}

