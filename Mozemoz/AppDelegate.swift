//
//  AppDelegate.swift
//  Mozemoz
//
//  Created by Nirav Desai on 24/09/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import GoogleUtilities
import FacebookCore
import FacebookShare
import FacebookLogin

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        // initiate Google Sign-In
        
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    //MARK: phone number login
    func application(_ app: UIApplication, open url: URL, options option: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        
        if Auth.auth().canHandle(url){
            // for phone auth
            return Auth.auth().canHandle(url)
        }
        else{
            // for google auth
            return GIDSignIn.sharedInstance.handle(url)
        }
    }
}

