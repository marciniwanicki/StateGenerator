//
//  WaitAction.swift
//  StateGenerator
//
//  Created by Marcin Iwanicki on 25/03/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import Foundation

class WaitAction: Action {

    private let timeInterval: TimeInterval

    init(_ timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }

    func perform(with context: Context, sleep: SleepFunction) {
        sleep(timeInterval, 0)
    }
}
