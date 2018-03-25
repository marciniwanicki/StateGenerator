//
//  Index.swift
//  StateGeneratorExamples
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation
import UIKit

class Index {

    static let shared = Index()

    let sections: [(String, [Demo])]

    private init() {
        self.sections = [
            ("Images", [
                Demo("RandomImageGenerator") {
                    RandomImageGeneratorDemoViewController(nibName: "RandomImageGeneratorDemoViewController", bundle: nil)
                }
                ]
            )
        ]
    }
}
