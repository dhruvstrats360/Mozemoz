//
//  PhoneNumLogInViewController.swift
//  Mozemoz
//
//  Created by Nirav Desai on 29/09/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import CountryPickerView

class PhoneNumLogInViewController: UIViewController {
    
    @IBOutlet weak var btnResendOTP: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnExit: UIButton!
    @IBOutlet weak var lblNumCaution: UILabel!
    @IBOutlet weak var lblOTPCaution: UILabel!
    @IBOutlet weak var txtOTP: UITextField!
    @IBOutlet weak var txtPhoneNum: UITextField!
    @IBOutlet weak var CountryPicker: CountryPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtOTP.isHidden = true
        lblNumCaution.isHidden = true
        lblOTPCaution.isHidden = true
        btnResendOTP.isHidden = true
        btnEdit.isHidden = true
        // keyboard action
        keyboardTargets()
        // country picker
        countryEdits()
        // btns editing
        editbtn()
    }
    func countryEdits(){
        CountryPicker.clipsToBounds = true
        CountryPicker.layer.cornerRadius = 15
        CountryPicker.layer.borderColor = UIColor.lightGray.cgColor
        CountryPicker.showCountryNameInView = false
    }
    func keyboardTargets(){
        txtPhoneNum.addDoneOnKeyboardWithTarget(self, action: #selector(doneButtonClicked))
        txtOTP.addDoneOnKeyboardWithTarget(self, action: #selector(doneButtonClicked))
    }
    func editbtn(){
        editbtn(btn: [btnEdit,btnExit,btnResendOTP])
        editTxtField(txt: [txtOTP,txtPhoneNum])
    }
    @objc func doneButtonClicked() {
        if (txtOTP.isHidden) {
            if !(txtPhoneNum.text!.isEmpty) {
                let country = CountryPicker.selectedCountry.phoneCode + txtPhoneNum.text!
                print(country)
                Auth.auth().settings?.isAppVerificationDisabledForTesting = false
                PhoneAuthProvider.provider().verifyPhoneNumber(country, uiDelegate: nil, completion: { verificationID, error in
                    if let errors = error{
                        print(errors.localizedDescription)
                        self.poperror(error: errors.localizedDescription)

                    }else{
                        self.verification_id = verificationID
                        self.txtOTP.isHidden = false
                        self.btnEdit.isHidden = false
                    }
                })
            }
            else {
                self.poperror(error: "PLEASE ENTER VALID MOBILE NUMBER")
                print("PLEASE ENTER VALID MOBILE NUMBER")
            }
        }
        else {
            if verification_id != nil {
                let credentials = PhoneAuthProvider.provider().credential(withVerificationID: verification_id!, verificationCode: txtOTP.text!)
                Auth.auth().signIn(with: credentials, completion: { authData, error in
                    if (error != nil){
                        print(error.debugDescription)
                        self.poperror(error: error.debugDescription)
                    }
                    else{
                        print("AUTHENTICATION SUCCESS WITH -" + (authData?.user.phoneNumber! ?? "NO PHONE NUMBER"))
                        self.performSegue(withIdentifier: "Test", sender: self)
                    }
                })
            } else{
                
                print("ERROR IN GETTING VERIFCATION ID")
            }
        }
    }
    func poperror(error: String){
        let alert = UIAlertController(title: "\(error)", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true,completion: nil)
    }
    func editbtn(btn: [UIButton]){
        for i in 0..<btn.count{
            btn[i].layer.masksToBounds = true
            btn[i].layer.cornerRadius = 15
        }
    }
    func editTxtField(txt: [UITextField]){
        for i in 0..<txt.count{
            txt[i].layer.masksToBounds = true
            txt[i].layer.cornerRadius = 15
        }
    }
    @IBAction func exitBtnPressed(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            dismiss(animated: true)
        }
        catch{
            print(error)
        }
    }
    @IBAction func editBtnPressed(_ sender: Any) {
        checkPhonenumber()
    }
    
    @IBAction func resendBtnPressed(_ sender: UIButton) {
        txtOTP.isHidden = true
        btnResendOTP.isHidden = true
    }
    var verification_id: String? = nil
    // check phone number
    
    func checkPhonenumber(){
        if txtPhoneNum.text!.count < 10 {
            lblNumCaution.text = "India has 10 Digits number System"
            lblNumCaution.isHidden = false
        }
        else if txtPhoneNum.text!.count > 10{
            lblNumCaution.text = "Number should be equal to 10"
            lblNumCaution.isHidden = false
        }
        else{
            lblNumCaution.isHidden = true
            btnEdit.isHidden = false
            btnResendOTP.isHidden = false
            txtPhoneNum.endEditing(true)
            txtPhoneNum.resignFirstResponder()
        }
    }
}

