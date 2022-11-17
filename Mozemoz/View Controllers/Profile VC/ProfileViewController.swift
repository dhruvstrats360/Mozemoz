//
//  ProfileViewController.swift
//  Mozemoz
//
//  Created by Nirav Desai on 17/11/22.
//

import UIKit

class ProfileViewController: UITabBarController {

    @IBOutlet weak var post_like_tabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        //addtabBar()
        
        // Do any additional setup after loading the view.
//        print(post_like_tabbar.selectedItem as Any)
        print(post_like_tabbar.debugDescription)
        
       
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    */
}

