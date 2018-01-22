//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation
import UIKit

/**
 @dip.register
 @dip.name view
 @dip.scope Shared
 @dip.factory VIPER
 @dip.implements VIPERViewProtocol
 */
class VIPERView: UIViewController, VIPERViewProtocol {
    var presenter: VIPERPresenterProtocol!
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.onInitRequested()
    }
}
