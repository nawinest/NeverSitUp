//
//  DetailViewController.swift
//  NeverSitUpTest
//
//  Created by Nawin Phunsawat on 28/3/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var isPremiumLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var customerGradeLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var customerId: String?
    var token: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCustomerDetail()
    }
    
    private func setupView(response: DetailModel) {
        if let detail = response.data {
            self.nameLabel.text = detail.name
            self.isPremiumLabel.text = (detail.isCustomerPremium ?? false) ? "Premium" : "Non-Premuim"
            self.sexLabel.text = detail.sex
            self.idLabel.text = detail.id
            self.customerGradeLabel.text = "Grade : \(detail.customerGrade)"
        }
    }
}

extension DetailViewController {
    func fetchCustomerDetail() {
        if let token = token, let customerId = customerId {
            APIManager.shared.getDetailCustomer(token: token,
                                                customerId: customerId,
                                                aSuccess: { (response) in
                                                    self.setupView(response: response)
            }) { (fail) in
                
            }
        }
    }
}
