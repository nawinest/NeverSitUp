//
//  DetailRouter.swift
//  NeverSitUpTest
//
//  Created by Nawin Phunsawat on 28/3/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

protocol DetailRouterInterface {
  func navigateToViewController()
}

final class DetailRouter: DetailRouterInterface {
  weak var viewController: DetailViewController!

  // MARK: - Navigation

    func navigateToViewController() {
        // TODO: Navigate to viewController
    }
}
