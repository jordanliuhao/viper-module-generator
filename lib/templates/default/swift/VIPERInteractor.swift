//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation

/**
 @dip.register
 @dip.name viperInteractor
 @dip.scope Shared
 @dip.factory App
 @dip.implements VIPERInteractorProtocol
 */
class VIPERInteractor: VIPERInteractorProtocol {
    var apiDataManager: VIPERAPIDataManagerProtocol!
    var localDataManager: VIPERLocalDataManagerProtocol!
    
    init() {}
}
