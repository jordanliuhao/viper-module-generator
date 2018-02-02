//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation
import UIKit

struct VIPERViewModel {

}

protocol VIPERViewProtocol: class {
	func bind(viewModel: VIPERViewModel)
}

protocol VIPERWireFrameProtocol: class {
}

protocol VIPERPresenterProtocol: class {
	func onInitRequested()
}

protocol VIPERInteractorProtocol: class {

}

protocol VIPERAPIDataManagerProtocol: class {

}

protocol VIPERLocalDataManagerProtocol: class {

}

func setupVIPER() -> VIPERView {
    let storyboard = UIStoryboard(name: "VIPERView", bundle: nil)
    let view = storyboard.instantiateInitialViewController() as! VIPERView
    let presenter = AppFactory().viperPresenter()
    let interactor = AppFactory().viperInteractor()
    let apiDataManager = AppFactory().viperApi()
    let localDataManager = AppFactory().viperLocal()
    let wireFrame = AppFactory().viperWireFrame()

    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.apiDataManager = apiDataManager
    interactor.localDataManager = localDataManager
    wireFrame.view = view

    return view
}