//
//  SignInPageViewController.swift
//  Mozemoz
//
//  Created by Nirav Desai on 26/09/22.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn
import IQKeyboardManagerSwift

class SignInPageViewController: UIViewController {
    
    @IBOutlet weak var appleBottomView: UIView!
    @IBOutlet weak var appleView: UIView!
    @IBOutlet weak var googleBottomView: UIView!
    @IBOutlet weak var facebookBottomview: UIView!
    @IBOutlet weak var loginBottomView: UIView!
    @IBOutlet weak var googleView: UIView!
    @IBOutlet weak var facebookView: UIView!
    @IBOutlet weak var LoginView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView?.isHidden = true
        topViewediting(view: LoginView)
        topViewediting(view: facebookView)
        topViewediting(view: googleView)
        topViewediting(view: appleView)
        bottomViewEditing(view: loginBottomView)
        bottomViewEditing(view: facebookBottomview)
        bottomViewEditing(view: googleBottomView)
        bottomViewEditing(view: appleBottomView)
       
    }
    override var viewIfLoaded: UIView?{
        decesion()
        return view
    }
    func decesion(){
        print("\(String(describing: Auth.auth().currentUser?.isAnonymous)) Auth")
        if ((Auth.auth().currentUser?.isAnonymous) != nil){
            navigationController?.popToViewController(ProfileViewController(), animated: true)
        }
    }
    func topViewediting(view: UIView){
        view.layer.cornerRadius = 25
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    func bottomViewEditing(view: UIView){
        view.layer.cornerRadius = 25
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.layer.borderWidth = 0.1
    }
    
    // MARK: Phone Number Sign In
    
    @IBAction func phoneLogInPressed(_ sender: UIButton) {
        if let newVC = tabBarController?.storyboard?.instantiateViewController(withIdentifier: "PhoneNumLogInViewController") {
            navigationController?.pushViewController(newVC, animated: true)
        }
    }
    // MARK: Google Signin
    @IBAction func googleSignIn_intiate(_ sender: UIButton) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            if let error = error {
                // ...
                print(error.localizedDescription)
            }
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                print("Else")
                return
            }
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            print("Creadentials are printed\(credential)")
            navigationController?.pushViewController(DetailsViewController(), animated: true)
        }
    }
}
