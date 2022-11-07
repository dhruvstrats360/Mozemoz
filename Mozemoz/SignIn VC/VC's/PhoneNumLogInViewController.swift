//
//  PhoneNumLogInViewController.swift
//  Mozemoz
//
//  Created by Nirav Desai on 29/09/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class PhoneNumLogInViewController: UIViewController {
    
    @IBOutlet weak var btnCountryCode: UIButton!
    @IBOutlet weak var btnResendOTP: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnExit: UIButton!
    @IBOutlet weak var lblNumCaution: UILabel!
    @IBOutlet weak var lblOTPCaution: UILabel!
    @IBOutlet weak var txtOTP: UITextField!
    @IBOutlet weak var txtPhoneNum: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        txtPhoneNum.delegate = self
        //        txtOTP.delegate = self
        //        btnEdit.isHidden = true
        txtOTP.isHidden = true
        lblNumCaution.isHidden = true
        lblOTPCaution.isHidden = true
        btnResendOTP.isHidden = true
        editbtn(btn: [btnEdit,btnExit,btnResendOTP,btnCountryCode])
        editTxtField(txt: [txtOTP,txtPhoneNum])
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
        dismiss(animated: true)
    }
    
    @IBAction func CountryCodePressed(_ sender: UIButton) {
        print("Have to create a popup menu of list")
    }
    @IBAction func editBtnPressed(_ sender: Any) {
        //        lblOTPCaution.isHidden = true
        //        btnEdit.isHidden = true
        //        txtOTP.text = ""
        //        txtOTP.isHidden = true
        //        btnResendOTP.isHidden = true
        //        txtPhoneNum.text = ""
        //        txtPhoneNum.becomeFirstResponder()
        checkPhonenumber()
        
    }
    
    @IBAction func resendBtnPressed(_ sender: UIButton) {
        txtOTP.isHidden = true
        btnResendOTP.isHidden = true
    }
    var verification_id: String? = nil
    @IBAction func NextPageBTnPressed(_ sender: Any) {
        if (txtOTP.isHidden) {
            if !(txtPhoneNum.text!.isEmpty) {
                Auth.auth().settings?.isAppVerificationDisabledForTesting = false
                PhoneAuthProvider.provider().verifyPhoneNumber(txtPhoneNum.text!, uiDelegate: nil, completion: { verificationID, error in
                    if (error != nil){
                        print(error.debugDescription)
                    }else{
                        self.verification_id = verificationID
                        self.txtOTP.isHidden = false
                    }
                })
            }
            else {
                print("PLEASE ENTER VALID MOBILE NUMBER")
            }
        }
        else {
            if verification_id != nil {
                let credentials = PhoneAuthProvider.provider().credential(withVerificationID: verification_id!, verificationCode: txtOTP.text!)
                Auth.auth().signIn(with: credentials, completion: { authData, error in
                    if (error != nil){
                        print(error.debugDescription)
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
    // check phone number
    
    func checkPhonenumber(){
        if txtPhoneNum.text!.count < 12 {
            lblNumCaution.text = "India has 10 Digits number System"
            lblNumCaution.isHidden = false
        }
        else if txtPhoneNum.text!.count > 12{
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
    // check OTP
    
    func checkValidOTP(){
        if txtPhoneNum.text!.count == 10{
            if txtOTP.text!.count < 4 {
                lblOTPCaution.text = "Enter Valid OTP"
                lblOTPCaution.isHidden = false
            }
            else if txtOTP.text!.count > 4{
                lblOTPCaution.text = "Number should be equal to 4"
                lblOTPCaution.isHidden = false
            }
            else{
                txtOTP.resignFirstResponder()
            }
        }
    }
}



//MARK: UITextFieldDelegate
//extension PhoneNumLogInViewController:UITextFieldDelegate{
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField.isEditing {
//
//            checkPhonenumber()
//             if txtOTP.text!.count == 4{
////                checkValidOTP()
//                return false
//            }
//            else if txtPhoneNum.text!.count == 10{
//                checkValidOTP()
//                textField.resignFirstResponder()
//                return false
//            }
//        }
//        else{
//            checkPhonenumber()
//            checkValidOTP()
//            return true
//        }
//        return true
//    }
//}
