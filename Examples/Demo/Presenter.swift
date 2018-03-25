//
//  Presenter.swift
//  StateGeneratorExamples
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation
import StateGenerator
import UIKit

class Presenter {
    
    private let generator = StateGenerator()

    deinit {
        generator.discard()
    }

    init(view: RandomImageGeneratorDemoView) {
        let size = CGSize(width: 400, height: 600)
        let delay: TimeInterval = 1.0
        generator
            .begin()
            .wait(delay)
            .perform(RandomImageGenerator(size: size)) { [weak view] in view?.setImage1($0) }
            .wait(delay)
            .perform(RandomImageGenerator(size: size)) { [weak view] in view?.setImage2($0) }
            .wait(delay)
            .perform(RandomImageGenerator(size: size)) { [weak view] in view?.setImage3($0) }
            .wait(delay)
            .perform(RandomImageGenerator(size: size)) { [weak view] in view?.setImage4($0) }
            .run(repeats: Int.max, .forward)
    }
}
