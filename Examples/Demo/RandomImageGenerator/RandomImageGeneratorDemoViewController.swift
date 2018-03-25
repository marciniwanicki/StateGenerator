//
//  RandomImageGeneratorDemoViewController.swift
//  StateGeneratorExamples
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation
import UIKit

protocol RandomImageGeneratorDemoView: class {

    func setImage1(_ image: UIImage)
    func setImage2(_ image: UIImage)
    func setImage3(_ image: UIImage)
    func setImage4(_ image: UIImage)
}

class RandomImageGeneratorDemoViewController: UIViewController {

    fileprivate var presenter: Presenter!

    @IBOutlet fileprivate var imageViews: [UIImageView]!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = Presenter(view: self)
    }
}

extension RandomImageGeneratorDemoViewController: RandomImageGeneratorDemoView {

    func setImage1(_ image: UIImage) {
        imageViews[0].image = image
    }
    
    func setImage2(_ image: UIImage) {
        imageViews[1].image = image
    }

    func setImage3(_ image: UIImage) {
        imageViews[2].image = image
    }

    func setImage4(_ image: UIImage) {
        imageViews[3].image = image
    }
}
