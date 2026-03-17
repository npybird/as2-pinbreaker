//
//  PegChooserView.swift
//  CodeBreaker
//
//  Created by นายนัชชานนท์ โปษยาอนุวัตร์ on 28/1/2569 BE.
//

import SwiftUI

struct PegChooserView: View {
    // MARK: Data In
    let choices: [Peg]
    
    // MARK: Data Out Function
    let onChoose: (Peg) -> Void
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 5)
    
    // MARK: - body
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(choices, id: \.self) { peg in
                PegView(peg: peg, match: nil)
                    .onTapGesture {
                        onChoose(peg)
                    }
            }
        }
    }
}
