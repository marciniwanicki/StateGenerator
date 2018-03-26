//
//  Presenter.swift
//  StateGeneratorExamples
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation
import UIKit
import StateGenerator

class Presenter {

    private let simulator = Simulator()

    init(view: RandomImageGeneratorDemoView) {
        let size = CGSize(width: 400, height: 600)
        let delay: TimeInterval = 1.0
        let imageGenerator = G.randomImage(size: size)

        simulator
            .begin()
            .wait(delay)
            .perform(imageGenerator) { [weak view] in view?.setImage1($0) }
            .wait(delay)
            .perform(imageGenerator) { [weak view] in view?.setImage2($0) }
            .wait(delay)
            .perform(imageGenerator) { [weak view] in view?.setImage3($0) }
            .wait(delay)
            .perform(imageGenerator) { [weak view] in view?.setImage4($0) }
            .run(repeats: Int.max)
    }

    init(view: IteratorGeneratorDemoView) {
        simulator
            .begin()
            .perform((1...10).reversed(), 1) { [weak view] in view?.setText(String($0)) }
            .perform() { [weak view] in view?.setText("🙌\nDONE") }
            .wait(2.0)
            .perform([UIColor.orange, UIColor.red, UIColor.purple], 2.0) { [weak view] in view?.setTextColor($0) }
            .perform() { [weak view] in view?.setText("👍")}
            .run()
    }
}
