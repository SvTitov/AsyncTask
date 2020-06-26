//
//  File.swift
//  
//
//  Created by Svyatoslav Titov on 25.06.2020.
//

import Foundation

public struct Task {
    
    private var dispatchGroup: DispatchGroup?
    private var cancelationToken: CancelationToken?
    
    private var action: (()->())?
    private var cancelableAction: ((_ token: CancelationToken?)->())?
    
    public init(_ action: @escaping ()->()){
        self.action = action
    }
    
    public init(cancelationToken token: CancelationToken, _ action: @escaping (_ token: CancelationToken?)->()){
        self.cancelableAction = action
        self.cancelationToken = token
        self.dispatchGroup = DispatchGroup()
    }
    
    public func await() {
        
        guard let dispatchGroup = dispatchGroup else {
            return
        }
        
        let dispatchItem = DispatchWorkItem {
            if let action = self.extractAction() {
                action()
            }
            
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        
        DispatchQueue.global(qos: .background).async(execute: dispatchItem)
        
        dispatchGroup.wait()
    }
    
    private func extractAction() -> (()->())?{
        if let action = self.action {
            return action
        }
        if let action = self.cancelableAction {
            return { action(self.cancelationToken) }
        }
        
        return nil
    }
}
