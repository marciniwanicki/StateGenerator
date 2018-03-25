//
//  StateGenerator.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

public class StateGenerator {

    fileprivate var simulations = [Simulation]()

    public init() {}

    public func begin(_ queue: OperationQueue = OperationQueue.main) -> Recorder {
        return SequenceRecorder(queue: queue, handler: self)
    }

    public func discard() {
        simulations.removeAll()
    }
}

public protocol SimulationHandler: class {

    func registerSimulation(_ simulation: Simulation)
}

extension StateGenerator: SimulationHandler {

    public func registerSimulation(_ simulation: Simulation) {
        simulations.append(simulation)
    }
}
