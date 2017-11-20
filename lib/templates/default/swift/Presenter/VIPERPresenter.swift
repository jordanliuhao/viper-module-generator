//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation

class VIPERPresenter: VIPERPresenterProtocol {
    weak var view: VIPERViewProtocol?
    var interactor: VIPERInteractorProtocol?
    var wireFrame: VIPERWireFrameProtocol?
    
    init() {}
}
