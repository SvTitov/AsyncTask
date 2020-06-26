//
//  File.swift
//  
//
//  Created by Svyatoslav Titov on 27.06.2020.
//

import Foundation

public protocol Canceller {
    var IsCanceled: Bool { get set }
    
    func cancel()
    
    func throwIfCanceled() throws -> CancelationError
}

public extension Canceller where Self: CancelationToken  {
    func cancel() {
        IsCanceled = true
    }
    
    func throwIfCanceled() throws -> CancelationError {
        IsCanceled = true
        throw CancelationError.Canceled
    }
}
