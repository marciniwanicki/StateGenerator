//
//  RainbowColorDemoViewController.swift
//  StateGeneratorExamples
//
//  Created by Marcin Iwanicki on 29/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import UIKit

protocol RainbowColorDemoView: class {

    func setBackgroundColor(_ color: UIColor, for index: Int)
}

class RainbowColorDemoViewController: DemoViewController {

    @IBOutlet fileprivate var colorViews: [UIView]!

    override func createPresenter() -> Presenter? {
        return Presenter(view: self)
    }
}

extension RainbowColorDemoViewController: RainbowColorDemoView {

    func setBackgroundColor(_ color: UIColor, for index: Int) {
        colorViews[index].backgroundColor = color
    }
}
