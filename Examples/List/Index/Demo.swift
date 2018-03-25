//
//  Demo.swift
//  StateGeneratorExamples
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation
import UIKit

class Demo {

    typealias ViewControllerFactory = () -> UIViewController
    let title: String
    let factory: ViewControllerFactory

    init(_ title: String, _ factory: @escaping ViewControllerFactory) {
        self.title = title
        self.factory = factory
    }
}
