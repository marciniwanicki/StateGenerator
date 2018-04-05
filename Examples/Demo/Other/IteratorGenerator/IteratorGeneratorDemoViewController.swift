//
//  IteratorGeneratorDemoViewController.swift
//  StateGeneratorExamples
//
//  Created by Marcin Iwanicki on 26/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation
import UIKit

protocol IteratorGeneratorDemoView: class {

    func setText(_ text: String)

    func setTextColor(_ color: UIColor)
}

class IteratorGeneratorDemoViewController: DemoViewController {

    @IBOutlet fileprivate var label: UILabel!

    override func createPresenter() -> Presenter? {
        return Presenter(view: self)
    }
}

extension IteratorGeneratorDemoViewController: IteratorGeneratorDemoView {

    func setText(_ text: String) {
        label.text = text
    }

    func setTextColor(_ color: UIColor) {
        label.textColor = color
    }
}
