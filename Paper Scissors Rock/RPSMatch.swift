//
//  RPSMatch.swift
//  Paper Scissors Rock
//
//  Created by Elina Mansurova on 2020-09-04.
//  Copyright © 2020 Elina Mansurova. All rights reserved.
//

import Foundation

// MARK: - RPSMatch

// The RPSMatch struct stores the results of a match.
// Now we're ready to store multiple matches in an array, so users can track their match history.
struct RPSMatch {
    
    // MARK: Properties
    
    let p1: RPS
    let p2: RPS
    
    // MARK: Initializer
    
    init(p1: RPS, p2: RPS) {
        self.p1 = p1
        self.p2 = p2
    }
    
    // MARK: Computed Properties
    
    var winner: RPS {
        get {
            return p1.defeats(p2) ? p1 : p2
        }
    }
    
    var loser: RPS {
        get {
            return p1.defeats(p2) ? p2 : p1
        }
    }
}
