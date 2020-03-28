//
//  DetailWorker.swift
//  NeverSitUpTest
//
//  Created by Nawin Phunsawat on 28/3/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

protocol DetailWorkerInterface {
  func getSomething(aQueryString: String, aCompletion: @escaping (Any) -> Void)
}

final class DetailWorker {

    var service: DetailService!
    
    init(with aService: DetailService) {
        service = aService
    }

  // MARK: - Business Logic

    func getSomething(aQueryString: String, aCompletion: @escaping (Any) -> Void) {
        service.requestSomething(aSuccess: { (aAny) in
            aCompletion(aAny)
        }) { (aErrorCode) in
            if let code = aErrorCode {
                print(code)
            }
        }
    }
}
