//
//  Generate.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation
import UIKit

public typealias G = Generators

public class Generators {

    public static func randomImage(size: CGSize) -> RandomImageGenerator {
        return RandomImageGenerator(size: size)
    }
}
