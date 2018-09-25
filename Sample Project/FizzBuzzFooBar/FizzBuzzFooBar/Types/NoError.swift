//
//  NoError.swift
//  SampleMoneyManager
//
//  Created by Zonily Jame Pesquera on 07/09/2018.
//  Copyright © 2018 Zonily Jame Pesquera. All rights reserved.
//

import Foundation

public enum NoError: Error, Equatable {
    public static func == (lhs: NoError, rhs: NoError) -> Bool {
        return true
    }
}
