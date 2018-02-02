//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation

/**
 @dip.register
 @dip.name viperPresenter
 @dip.scope Shared
 @dip.factory App
 @dip.implements VIPERPresenterProtocol
 */
class VIPERPresenter: VIPERPresenterProtocol {
    weak var view: VIPERViewProtocol!
    var interactor: VIPERInteractorProtocol!
    var wireFrame: VIPERWireFrameProtocol!
    let viewModel = VIPERViewModel()
    
    init() {}
    
    func onInitRequested() {
    		view.bind(viewModel: viewModel)
    }
}
