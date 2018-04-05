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

    let sections: [(String, [Demo])] = {
        let names: [(String, [UIViewController.Type])] = [
            ("Color", [RainbowColorsGeneratorDemoViewController.self]),
            ("Date", [RandomDateGeneratorDemoViewController.self]),
            ("Image", [RandomImageGeneratorDemoViewController.self]),
            ("Other", [IteratorGeneratorDemoViewController.self])
        ]

        return names.map { (name, types) -> (String, [Demo]) in
            (name, types.map { Demo($0) })
        }
    }()

    private init() { }
}
