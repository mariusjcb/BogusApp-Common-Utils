//
//  UseCaseProtocol.swift
//  BougsApp-iOS
//
//  Created by Marius Ilie on 22/01/2021.
//

import Foundation

/// It is used as default implementation for UseCases.
/// Please do not hesitate to extend **start()** functionality for more **specific UseCases**

public protocol UseCase {
    /// Used for initial operations over injected objects and startup flows
    func start()
}

public extension UseCase {
    func start() { }
}
