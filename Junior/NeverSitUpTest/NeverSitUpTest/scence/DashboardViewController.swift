//
//  DashboardViewController.swift
//  NeverSitUpTest
//
//  Created by Nawin Phunsawat on 28/3/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit
import Alamofire

class DashboardViewController: UIViewController {
    @IBOutlet weak var mainCustomerTableView: UITableView!
    var token: String?
    var customerList: [CustomerModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCustomerTableView.register(UINib(nibName: "CustomerCellView", bundle: nil), forCellReuseIdentifier: "customerCell")
        mainCustomerTableView.delegate = self
        mainCustomerTableView.dataSource = self
        mainCustomerTableView.estimatedRowHeight = 60
        let logoutButton = UIBarButtonItem(title: "logout", style: .plain, target: self, action: #selector(logout))
        self.navigationItem.rightBarButtonItem  = logoutButton
    }
    
    @objc func logout() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let customers = customerList {
            if let cell = mainCustomerTableView.dequeueReusableCell(withIdentifier: "customerCell", for: indexPath) as? CustomerCellView {
                let customer = customers[indexPath.row]
                cell.nameLabel.text = "Name: \(customer.name ?? "" )"
                cell.customerLabel.text = "Customer Id: \(customer.id ?? "")"
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let customers = customerList {
            let customerSelected = customers[indexPath.row]
            let storyboard = UIStoryboard(name: "DetailStoryboard", bundle: nil)
            if let detailVc = storyboard.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                detailVc.customerId = customerSelected.id
                detailVc.token = token
                self.navigationController?.pushViewController(detailVc, animated: true)
            }
        }
    }
    
    
}
