//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by นายนัชชานนท์ โปษยาอนุวัตร์ on 21/1/2569 BE.
//

import SwiftUI

typealias Peg = String

struct CodeBreaker {
    var masterCode: Code
    var guess: Code
    var attempts: [Code] = []
    var startTime: Date = .now
    var endTime: Date?
    
    let pegCount: Int
    let pegChoices: [Peg] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    init(pegCount: Int) {
        self.pegCount = pegCount
        self.masterCode = Code(kind: .master(isHidden: true), pegCount: pegCount)
        self.guess = Code(kind: .guess, pegCount: pegCount)
        
        masterCode.randomize(from: pegChoices)
    }
    
    init() {
        let random = Int.random(in: 3...6)
        self.init(pegCount: random)
        
        
    }
    
//    mutating func restart() {
//        masterCode.kind = .master(isHidden: true)
//        masterCode.randomize(from: pegChoices)
//        guess.reset()
//        attempts.removeAll()
//        startTime = .now
//        endTime = nil
//    }
    
    var isOver: Bool {
        // ?. คือ ถ้า Array ไม่ใช่ nil จะ unwrapped ให้เอง
        attempts.last?.pegs == masterCode.pegs
    }
    
    mutating func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        
        if let indexOfExistingPegInPegChoices = pegChoices.firstIndex(of: existingPeg) {
            guess.pegs[index] = pegChoices[(indexOfExistingPegInPegChoices + 1) % pegChoices.count]
        } else {
            guess.pegs[index] = pegChoices.first ?? Code.missing
        }
    }
    
    mutating func attemptGuess() {
        var attempt = guess
        
        if attempts.contains(where: { $0.pegs == attempt.pegs }) || attempt.pegs.contains(Code.missing) {
            return
        }
        
        attempt.kind = .attempt(guess.match(against: masterCode))
        attempts.append(attempt)
        guess.reset()
        
        if isOver {
            masterCode.kind = .master(isHidden: false)
            endTime = .now
        }
    }
    
    mutating func setGuessPeg(_ peg: Peg, at index: Int) {
        guess.pegs[index] = peg
    }
}


