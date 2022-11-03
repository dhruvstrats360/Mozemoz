//
//  HomeNavController.swift
//  Mozemoz
//
//  Created by Nirav Desai on 26/09/22.
//

import UIKit

class HomeNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = SignInViewController()
        vc.modalPresentationStyle = .fullScreen
        performSegue(withIdentifier: "SignInpopUpViewController1", sender: self)
    }
//    override func viewWillAppear(_ animated: Bool) {
//        let vc = UIViewController()
//        vc.modalPresentationStyle = .fullScreen
//        performSegue(withIdentifier: "SignInpopUpViewController1", sender: self)
//    }

}
