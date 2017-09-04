//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation

class VIPERInteractor: VIPERInteractorInputProtocol {
    weak var presenter: VIPERInteractorOutputProtocol?
    var apiDataManager: VIPERAPIDataManagerInputProtocol?
    var localDatamanager: VIPERLocalDataManagerInputProtocol?
    
    init() {}
}
