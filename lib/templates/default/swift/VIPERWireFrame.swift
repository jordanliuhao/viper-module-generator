//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation
import UIKit

/**
 @dip.register
 @dip.name wireFrame
 @dip.scope Shared
 @dip.factory app
 @dip.implements VIPERWireFrameProtocol
 */
class VIPERWireFrame: VIPERWireFrameProtocol {
    weak var view: UIViewController?
    
    init() {}

    class func setupModule() -> VIPERView {
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
}
