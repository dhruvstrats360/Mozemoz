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

class SignInPageViewController: UIViewController {

    
    @IBOutlet weak var appleBottomView: UIView!
    @IBOutlet weak var appleView: UIView!
    @IBOutlet weak var btnExit: UIButton!
    @IBOutlet weak var googleBottomView: UIView!
    @IBOutlet weak var facebookBottomview: UIView!
    @IBOutlet weak var loginBottomView: UIView!
    @IBOutlet weak var googleView: UIView!
    @IBOutlet weak var facebookView: UIView!
    @IBOutlet weak var LoginView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        topViewediting(view: LoginView)
        topViewediting(view: facebookView)
        topViewediting(view: googleView)
        topViewediting(view: appleView)
        bottomViewEditing(view: loginBottomView)
        bottomViewEditing(view: facebookBottomview)
        bottomViewEditing(view: googleBottomView)
        bottomViewEditing(view: appleBottomView)
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
//        let auth = Auth.auth().isSignIn(withEmailLink: "1234@gmail.com")
//        print(auth)
//        func sign(_ signIn: GIDSignIn!,
//                  didSignInFor user: GIDGoogleUser!,
//                  withError error: Error!) {
//            
//            print(GIDGoogleUser.self)
//            
//            // Check for sign in error
//            if let error = error {
//                if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
//                    print("The user has not signed in before or they have since signed out.")
//                } else {
//                    print("\(error.localizedDescription)")
//                }
//                return
//            }
//            
//            // Get credential object using Google ID token and Google access token
//            guard let authentication = user.authentication else {
//                return
//            }
//            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
//                                                           accessToken: authentication.accessToken)
//            
//            // Authenticate with Firebase using the credential object
//            Auth.auth().signIn(with: credential) { (authResult, error) in
//                if let error = error {
//                    print("Error occurs when authenticate with Firebase: \(error.localizedDescription)")
//                }
//                    
//                // Post notification after user successfully sign in
//    //            NotificationCenter.default.post(name: signInGoogleCompleted(), object: nil)
//                self.navigationController?.pushViewController(TabBarViewController(), animated: true)
//            }
//        }
    }
   
    @objc func signInGoogleCompleted(){
        
    }
    
    @IBAction func exitButtonPressed(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    
}
