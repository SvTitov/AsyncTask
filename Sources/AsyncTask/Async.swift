//
//  File.swift
//  
//
//  Created by Svyatoslav Titov on 25.06.2020.
//

import Foundation

public func async (_ callback:@escaping ()->()){
    DispatchQueue.global(qos: .background).async {
        callback()
    }
}
