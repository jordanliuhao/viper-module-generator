//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation
import UIKit

class VIPERWireFrame: VIPERWireFrameProtocol {
    weak var view: UIViewController?

    class func setupModule() -> VIPERView {
        let storyboard = UIStoryboard(name: "VIPERView", bundle: nil)
        let view = storyboard.instantiateInitialViewController() as! VIPERView
        let presenter = VIPERPresenter()
        let interactor = VIPERInteractor()
        let apiDataManager = VIPERAPIDataManager()
        let localDataManager = VIPERLocalDataManager()
        let wireFrame = VIPERWireFrame()

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
}
