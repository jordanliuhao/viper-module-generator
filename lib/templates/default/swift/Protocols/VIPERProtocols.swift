//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation
import UIKit

protocol VIPERViewProtocol: class {

}

protocol VIPERWireFrameProtocol: class {
    static func setupModule() -> UIViewController?

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
