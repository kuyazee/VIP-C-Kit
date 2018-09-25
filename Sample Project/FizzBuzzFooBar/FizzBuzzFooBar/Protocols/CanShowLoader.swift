//
//  CanShowLoader.swift
//  MyTotalHealth
//
//  Created by Zonily Jame Pesquera on 22/07/2018.
//  Copyright © 2018 Zonily Jame Pesquera. All rights reserved.
//

import Foundation

public protocol CanShowLoader {
    func showLoader(disablesView: Bool)

    func hideLoader()
}
