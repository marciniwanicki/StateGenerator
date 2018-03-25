//
//  SequenceSimulation.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

public class SequenceSimulation: Simulation {

    private let actions: [Action]
    private let directions: [Direction]
    private let repeats: Int
    private let queue = OperationQueue()
    private let actionsQueue: OperationQueue

    private var isRunning: Bool = true
    private var isStarted: Bool = false
    private var repeatsCounter: Int = 0

    deinit {
        queue.cancelAllOperations()
        actionsQueue.cancelAllOperations()
    }

    init(actions: [Action], directions: [Direction], repeats: Int, actionsQueue: OperationQueue) {
        self.actions = actions
        self.directions = directions
        self.repeats = repeats
        self.actionsQueue = actionsQueue
        self.queue.maxConcurrentOperationCount = 1
    }

    public func start() {
        if isStarted {
            return
        }

        isStarted = true

        actionsQueue.isSuspended = false
        queue.isSuspended = false

        perform()
    }

    public func stop() {
        isRunning = false

        actionsQueue.isSuspended = true
        queue.isSuspended = true
    }

    public func reset() {
        isRunning = true

        actionsQueue.cancelAllOperations()
        actionsQueue.isSuspended = false

        queue.cancelAllOperations()
        queue.isSuspended = false
    }

    private func perform() {
        directions.forEach { direction in
            let actions = direction == .forward ? self.actions : self.actions.reversed()
            let context: Action.Context = (
                queue: actionsQueue,
                direction: direction
            )
            actions.forEach { [queue] action in
                queue.addOperation(ActionOperation(action: action, context: context))
            }
        }

        repeatsCounter += 1
        if repeatsCounter < repeats {
            queue.addOperation { [weak self] in
                self?.perform()
            }
        }
    }
}
