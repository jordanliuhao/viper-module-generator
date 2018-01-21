//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation

/**
 @dip.register
 @dip.name interactor
 @dip.scope Unique
 @dip.factory app
 @dip.implements VIPERInteractorProtocol
 */
class VIPERInteractor: VIPERInteractorProtocol {
    var apiDataManager: VIPERAPIDataManagerProtocol!
    var localDataManager: VIPERLocalDataManagerProtocol!
    
    init() {}
}
