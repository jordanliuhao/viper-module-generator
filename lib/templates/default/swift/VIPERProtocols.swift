//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation
import UIKit

protocol VIPERViewProtocol: class {

}

protocol VIPERWireFrameProtocol: class {
    static func setupModule() -> VIPERView

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
    let presenter = try! appContainer.resolve(VIPERPresenterProtocol.self) as! VIPERPresenter
    let interactor = try! appContainer.resolve(VIPERInteractorProtocol.self) as! VIPERInteractor
    let apiDataManager = try! appContainer.resolve(VIPERAPIDataManagerProtocol.self) as! VIPERAPIDataManager
    let localDataManager = try! appContainer.resolve(VIPERLocalDataManagerProtocol.self) as! VIPERLocalDataManager
    let wireFrame = try! appContainer.resolve(VIPERWireFrameProtocol.self) as! VIPERWireFrame

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