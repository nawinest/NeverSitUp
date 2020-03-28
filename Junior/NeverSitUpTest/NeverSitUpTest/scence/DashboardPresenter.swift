//
//  DashboardPresenter.swift
//  NeverSitUpTest
//
//  Created by Nawin Phunsawat on 28/3/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

protocol DashboardPresenterInterface {
    func presentSomething(aResponse: DashboardModels.Respoonse)
}

class DashboardPresenter: DashboardPresenterInterface {
    weak var viewController: DashboardView!
    
    func presentSomething(aResponse: DashboardModels.Respoonse) {
        //Transform Response Model to Displayed Model
        viewController.displaySomething(aDisplay: DashboardModels.ViewModel.Displayed())
    }
}

