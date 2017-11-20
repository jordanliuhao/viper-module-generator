//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation
import UIKit

class VIPERWireFrame: VIPERWireFrameProtocol {
    weak var view: UIViewController?

    class func setupModule() -> UIViewController? {
        let view: VIPERViewProtocol = VIPERView()
        let presenter: VIPERPresenterProtocol = VIPERPresenter()
        let interactor: VIPERInteractorProtocol = VIPERInteractor()
        let apiDataManager: VIPERAPIDataManagerProtocol = VIPERAPIDataManager()
        let localDataManager: VIPERLocalDataManagerProtocol = VIPERLocalDataManager()
        let wireFrame: VIPERWireFrameProtocol = VIPERWireFrame()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.apiDataManager = apiDataManager
        interactor.localDatamanager = localDataManager
        wireFrame.view = view as? UIViewController

        return view as? UIViewController
    }
}
