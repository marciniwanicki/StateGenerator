//
//  RainbowColorsGenerator.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation
import UIKit

public class RainbowColorsGenerator: IndexGenerator {

    public typealias T = UIColor

    public let count: Int

    public init(count: Int) {
        self.count = count
    }

    public func generate(index: Int) -> UIColor {
        return UIColor(hue: CGFloat(index) / CGFloat(count), saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
}
