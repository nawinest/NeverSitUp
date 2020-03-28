//
//  ViewController.swift
//  NeverSitUpTest
//
//  Created by Nawin Phunsawat on 28/3/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var loadingView: UIView!
    var tokenResult: TokenResponse?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.isHidden = true
        loadingView.isHidden = true
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func loginAction(_ sender: Any) {
        self.startLoading()
        if let username = usernameTextField.text,
            let password = passwordTextField.text {
            APIManager.shared.login(password: password, username: username, aSuccess: { (response) in
                self.stopLoading()
                let dashboardVc = UIStoryboard(name: "DashboardStoryboard", bundle: nil).instantiateViewController(withIdentifier: "dashboard") as! DashboardViewController
                dashboardVc.customerList = response.customers
                dashboardVc.token = response.token
                let navigationController = UINavigationController(rootViewController: dashboardVc)
                navigationController.modalPresentationStyle = .fullScreen
                self.present(navigationController, animated: true, completion: nil)
            }) { (fail) in
                self.stopLoading()
            }
        }
    }
    
    private func startLoading() {
        loadingIndicator.startAnimating()
        loadingIndicator.isHidden = false
        loadingView.isHidden = false
    }
    
    private func stopLoading() {
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
        loadingView.isHidden = true
    }
}
