//
//  DetailInteractor.swift
//  NeverSitUpTest
//
//  Created by Nawin Phunsawat on 28/3/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

protocol DetailInteractorInterface {
    func startDoingSomething(aRequest: DetailModels.Request)
    var model: Any? { get }
}

final class DetailInteractor: DetailInteractorInterface {
    var presenter: DetailPresenterInterface!
    var model: Any?
    
    var worker: DetailWorker = DetailWorker(with: DetailService())
    
    // MARK: - Business logic
    
    func startDoingSomething(aRequest: DetailModels.Request) {
        worker.getSomething(aQueryString: "") { (aAny) in
            self.model = aAny
            
            //Convert Any object to Response Model
            self.presenter.presentSomething(aResponse: DetailModels.Respoonse())
        }
    }
}

