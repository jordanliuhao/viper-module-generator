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
 @dip.factory VIPER
 @dip.implements VIPERWireFrameProtocol
 */
class VIPERWireFrame: VIPERWireFrameProtocol {
    weak var view: UIViewController?
    
    init() {}
}
