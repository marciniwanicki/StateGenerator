//
//  RandomImageGenerator.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

class RandomImageGenerator: SingleValueGenerator {

    typealias T = UIImage

    private let size: CGSize
    private let colorsGenerator = RainbowColorsGenerator(count: 30)

    init(size: CGSize) {
        self.size = size
    }

    func generate() -> UIImage {
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()!

        (0..<30).forEach { drawEllipse($0, context) }

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image!
    }

    private func drawEllipse(_ index: Int, _ context: CGContext) {
        let color = colorsGenerator.generate(index: index)
        let x = rand(from: -size.width / 2, to: size.width)
        let y = rand(from: -size.height, to: size.height)
        let d = rand(from: 1, to: size.width)

        context.setStrokeColor(color.cgColor)
        context.setAlpha(0.5)
        context.setLineWidth(10.0)
        context.addEllipse(in: CGRect(x: x, y: y, width: d, height: d))
        context.drawPath(using: .stroke)
    }

    private func rand(from: CGFloat, to: CGFloat) -> CGFloat {
        let span = UInt32(abs(to - from))
        return CGFloat(arc4random_uniform(span)) + min(from, to)
    }
}
