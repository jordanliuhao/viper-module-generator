//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation
import UIKit

protocol VIPERViewProtocol: class {
    var presenter: VIPERPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol VIPERWireFrameProtocol: class {
	var view: UIViewController? { get set }
	
    static func setupModule() -> UIViewController?
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol VIPERPresenterProtocol: class {
    var view: VIPERViewProtocol? { get set }
    var interactor: VIPERInteractorProtocol? { get set }
    var wireFrame: VIPERWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
}

protocol VIPERInteractorProtocol: class {
    var apiDataManager: VIPERAPIDataManagerProtocol? { get set }
    var localDatamanager: VIPERLocalDataManagerProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}

protocol VIPERAPIDataManagerProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol VIPERLocalDataManagerProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
