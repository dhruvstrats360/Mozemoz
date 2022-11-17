//
//  ProfileViewController.swift
//  Mozemoz
//
//  Created by Nirav Desai on 17/11/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var post_like_tabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard storyboard?.instantiateViewController(withIdentifier: String(describing: ProfileViewController.self)) is ProfileViewController
            else {
            return
        }
        
        print(post_like_tabbar.selectedItem.debugDescription)
        print(post_like_tabbar.debugDescription)
        let contacts = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.contacts, tag: 100)
        let bookmarks = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.bookmarks, tag: 101)
        
         post_like_tabbar.setItems([contacts, bookmarks], animated: false)
        

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    */
}

