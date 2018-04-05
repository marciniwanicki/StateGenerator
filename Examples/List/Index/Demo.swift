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

    private let factory: ViewControllerFactory

    init(_ title: String, _ factory: @escaping ViewControllerFactory) {
        self.title = title
        self.factory = factory
    }

    convenience init(_ viewControllerType: UIViewController.Type) {
        let fullTypeName = NSStringFromClass(viewControllerType)
        let typeName = fullTypeName.components(separatedBy: ".")[1]
        let title = typeName.replacingOccurrences(of: "DemoViewController", with: "", options: .literal, range: nil)

        self.init(title) {
            return viewControllerType.init(nibName: typeName, bundle: nil)
        }
    }

    func createViewController() -> UIViewController {
        let viewController = factory()
        viewController.title = title
        return viewController
    }
}
