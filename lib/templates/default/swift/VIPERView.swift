//
// Created by AUTHOR
// Copyright (c) YEAR COMPANY. All rights reserved.
//

import Foundation
import UIKit

/**
 @dip.register
 @dip.name viperView
 @dip.scope Shared
 @dip.factory App
 @dip.implements VIPERViewProtocol
 */
class VIPERView: UIViewController, VIPERViewProtocol {
    var presenter: VIPERPresenterProtocol!
        
    override func viewDidLoad() {
        presenter.onInitRequested()
    }
    
    func bind(viewModel: VIPERViewModel) {
    }
}
