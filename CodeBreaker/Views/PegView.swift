//
//  PegView.swift
//  CodeBreaker
//
//  Created by นายนัชชานนท์ โปษยาอนุวัตร์ on 28/1/2569 BE.
//

import SwiftUI

struct PegView: View {
    // MARK: Data In
    let peg: Peg
    let match: Match?
    
    private let size: CGFloat = 44
    @State private var isPressed = false
    
    // MARK: - body
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(backgroundColor)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 2)
            }
            .overlay {
                Text(peg.isEmpty ? "" : peg)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(textColor)
            }
            .aspectRatio(1, contentMode: .fit)
    }
    
    var backgroundColor: Color {
        switch match {
        case .exact:
            return .green
        case .inexact:
            return .yellow
        case .nomatch:
            return .gray.opacity(0.75)
        case nil:
            return .gray.opacity(0.15)
        }
    }
    
    var borderColor: Color {
        peg.isEmpty ? .gray : .clear
    }
    
    var textColor: Color {
        switch match {
        case .exact:
            return .white
        default:
            return .primary
        }
    }
}
