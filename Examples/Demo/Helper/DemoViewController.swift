//
//  DemoViewController.swift
//  StateGeneratorExamples
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation
import UIKit

class DemoViewController: UIViewController {

    var presenter: Presenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = createPresenter()
    }

    func createPresenter() -> Presenter? {
        return nil
    }
}
