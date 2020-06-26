//
//  File.swift
//  
//
//  Created by Svyatoslav Titov on 25.06.2020.
//

import Foundation

public class CancelationToken : Canceller  {
    
    public var IsCanceled: Bool
    
    public init(){
        self.IsCanceled = false
    }
}


