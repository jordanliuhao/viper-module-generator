//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation
import UIKit

class VIPERWireFrame: VIPERWireFrameProtocol {
    weak var view: UIViewController?

    class func setupModule() -> UIViewController? {
        let storyboard = UIStoryboard(name: "VIPERView", bundle: nil)
        let view = storyboard.instantiateInitialViewController()
        let presenter = VIPERPresenter()
        let interactor = VIPERInteractor()
        let apiDataManager = VIPERAPIDataManager()
        let localDataManager = VIPERLocalDataManager()
        let wireFrame = VIPERWireFrame()

        // Connecting
        (view as? VIPERView)?.presenter = presenter
        presenter.view = view as? VIPERView
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.apiDataManager = apiDataManager
        interactor.localDataManager = localDataManager
        wireFrame.view = view

        return view
    }
}
