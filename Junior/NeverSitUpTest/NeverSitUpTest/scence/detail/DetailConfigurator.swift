//
//  DetailConfigurator.swift
//  NeverSitUpTest
//
//  Created by Nawin Phunsawat on 28/3/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

final class DetailConfigurator {

  // MARK: - Object lifecycle

  static let sharedInstance = DetailConfigurator()

  // MARK: - Configuration

  func configure(viewController: DetailViewController) {
    let router = DetailRouter()
    router.viewController = viewController

    let presenter = DetailPresenter()
    presenter.viewController = viewController

    let interactor = DetailInteractor()
    interactor.presenter = presenter

    viewController.interactor = interactor
    viewController.router = router
  }
}
