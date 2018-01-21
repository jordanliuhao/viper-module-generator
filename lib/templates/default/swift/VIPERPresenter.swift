//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation

/**
 @dip.register
 @dip.name presenter
 @dip.scope Shared
 @dip.factory app
 @dip.implements VIPERPresenterProtocol
 */
class VIPERPresenter: VIPERPresenterProtocol {
    weak var view: VIPERViewProtocol?
    var interactor: VIPERInteractorProtocol!
    var wireFrame: VIPERWireFrameProtocol!
    
    init() {}
    
    func onInitRequested() {
    }
}
