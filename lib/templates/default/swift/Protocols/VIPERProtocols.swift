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

protocol VIPERWireframeProtocol: class {
    static weak var view: UIViewController? { get set }
    static func presentVIPERModule(fromView view: UIViewController)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol VIPERPresenterProtocol: class {
    var view: VIPERViewProtocol? { get set }
    var interactor: VIPERInteractorInputProtocol? { get set }
    var wireFrame: VIPERWireframeProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
}

protocol VIPERInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol VIPERInteractorInputProtocol: class {
    var presenter: VIPERInteractorOutputProtocol? { get set }
    var apiDataManager: VIPERAPIDataManagerInputProtocol? { get set }
    var localDatamanager: VIPERLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}

protocol VIPERAPIDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol VIPERLocalDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
