//
//  DetailPresenter.swift
//  NeverSitUpTest
//
//  Created by Nawin Phunsawat on 28/3/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

protocol DetailPresenterInterface {
    func presentSomething(aResponse: DetailModels.Respoonse)
}

class DetailPresenter: DetailPresenterInterface {
    weak var viewController: DetailView!
    
    func presentSomething(aResponse: DetailModels.Respoonse) {
        //Transform Response Model to Displayed Model
        viewController.displaySomething(aDisplay: DetailModels.ViewModel.Displayed())
    }
}

