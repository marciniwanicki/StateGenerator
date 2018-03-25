//
//  Recorder.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

public protocol Recorder {

    func wait(_ timeInterval: TimeInterval) -> Recorder

    func perform(closure: @escaping () -> Void) -> Recorder

    func perform<E, T>(_ generator: T,
                       closure: @escaping (E) -> Void) -> Recorder where T.T == E, T: SingleValueGenerator

    func perform<E, T>(_ generator: T,
                       closure: @escaping (E) -> Void) -> Recorder where T.T == E, T: IndexGenerator

    func perform<E, T>(_ generator: T,
                       _ timeFunction: TimeFunction,
                       closure: @escaping (E) -> Void) -> Recorder where T.T == E, T: IndexGenerator

    func perform<E, T>(_ generator: T,
                       closure: @escaping (E) -> Void) -> Recorder where T.I.Element == E, T: IteratorGenerator

    func perform<E, T>(_ generator: T,
                       _ timeFunction: TimeFunction,
                       closure: @escaping (E) -> Void) -> Recorder where T.I.Element == E, T: IteratorGenerator

    @discardableResult
    func run() -> Simulation

    @discardableResult
    func run(_ directions: Direction...) -> Simulation

    @discardableResult
    func run(repeats: Int, _ directions: Direction...) -> Simulation

    @discardableResult
    func run(repeats: Int, _ directions: [Direction]) -> Simulation
}
