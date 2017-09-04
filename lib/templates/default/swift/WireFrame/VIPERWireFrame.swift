//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation
import UIKit

class VIPERWireframe: VIPERWireframeProtocol {

    static weak var view: UIViewController?

    class func presentVIPERModule(fromView view: UIViewController) {
        guard let newView = VIPERWireframe.configureViewController() else {
            return
        }
        /**
         * Add code to present your View here
         **/
    }

    class func configureViewController() -> UIViewController? {
        // Generating module components
        let view: VIPERViewProtocol = VIPERView()
        let presenter: VIPERPresenterProtocol & VIPERInteractorOutputProtocol = VIPERPresenter()
        let interactor: VIPERInteractorInputProtocol = VIPERInteractor()
        let apiDataManager: VIPERAPIDataManagerInputProtocol = VIPERAPIDataManager()
        let localDataManager: VIPERLocalDataManagerInputProtocol = VIPERLocalDataManager()
        let wireFrame: VIPERWireframeProtocol = VIPERWireframe()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.apiDataManager = apiDataManager
        interactor.localDatamanager = localDataManager

        VIPERWireframe.view = view as? UIViewController

        return view as? UIViewController
    }
}
