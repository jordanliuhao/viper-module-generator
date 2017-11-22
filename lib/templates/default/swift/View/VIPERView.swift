//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation
import UIKit

class VIPERView: UIViewController, VIPERViewProtocol {
    var presenter: VIPERPresenterProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.onInitRequested()
    }
}
