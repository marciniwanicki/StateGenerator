//
//  SequenceRecorder.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

public class SequenceRecorder: Recorder {

    private var actions = [Action]()
    private let queue: OperationQueue
    private weak var handler: SimulationHandler?

    public init(queue: OperationQueue, handler: SimulationHandler) {
        self.queue = queue
        self.handler = handler
    }

    public func wait(_ timeInterval: TimeInterval) -> Recorder {
        add(WaitAction(timeInterval))
        return self
    }

    public func perform(closure: @escaping () -> Void) -> Recorder {
        add(PerformAction(closure: closure))
        return self
    }

    public func perform<E, T>(_ generator: T,
                              closure: @escaping (E) -> Void) -> Recorder where T.T == E, T: SingleValueGenerator {
        add(PerformAction(closure: { closure(generator.generate()) }))
        return self
    }

    public func perform<E, T>(_ generator: T, closure: @escaping (E) -> Void)
        -> Recorder where E == T.T, T : IndexGenerator {
        return perform(generator, ConstTimeFunction.zero, closure: closure)
    }

    public func perform<E, T: IndexGenerator>(_ generator: T,
                                              _ timeFunction: TimeFunction,
                                              closure: @escaping (E) -> Void) -> Recorder where T.T == E {
        add(IndexAction(generator: generator, timeFunction: timeFunction, closure: closure))
        return self
    }

    public func perform<E, T>(_ generator: T, closure: @escaping (E) -> Void)
        -> Recorder where E == T.I.Element, T : IteratorGenerator {
        return perform(generator, ConstTimeFunction.zero, closure: closure)
    }

    public func perform<E, T: IteratorGenerator>(_ generator: T,
                                                 _ timeFunction: TimeFunction,
                                                 closure: @escaping (E) -> Void) -> Recorder where T.I.Element == E {
        add(IteratorAction(generator: generator, timeFunction: timeFunction, closure: closure))
        return self
    }

    public func run() -> Simulation {
        return run(.forward)
    }

    public func run(_ directions: Direction...) -> Simulation {
        return run(repeats: 1, directions)
    }

    public func run(repeats: Int, _ directions: Direction...) -> Simulation {
        return run(repeats: repeats, directions.isEmpty ? [.forward] : directions)
    }

    public func run(repeats: Int, _ directions: [Direction]) -> Simulation {
        let simulation = SequenceSimulation(actions: actions,
                                            directions: directions,
                                            repeats: repeats,
                                            actionsQueue: queue)
        simulation.start()

        handler?.registerSimulation(simulation)

        return simulation
    }

    func add(_ action: Action) {
        actions.append(action)
    }
}
