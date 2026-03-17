//
//  CodeView.swift
//  CodeBreaker
//
//  Created by นายนัชชานนท์ โปษยาอนุวัตร์ on 28/1/2569 BE.
//

import SwiftUI

struct CodeView<AncillaryView>: View where AncillaryView: View {    // AncillaryView implements View
    // MARK: Data In
    let code: Code
    
    // MARK: Data Shared by Me
    @Binding var selection: Int
    
    @ViewBuilder let ancillaryView: () -> AncillaryView
    
    //MARK: Data Owned By Me
    @Namespace private var selectionNameSpace
    
    init(code: Code,
         selection: Binding<Int> = .constant(-1),
         @ViewBuilder ancillaryView: @escaping () -> AncillaryView = { EmptyView() }) {
        self.code = code
        self._selection = selection     // selection ไม่ใช่ตัวแปรของ struct นี้ แต่ถูก shared มา จึงใช้ _selection
        self.ancillaryView = ancillaryView
    }
    
    // MARK: - body
    var body: some View {
        HStack {
            ForEach(code.pegs.indices, id: \.self) { index in
                PegView(
                    peg: displayPeg(at: index),
                    match: matchForPeg(at: index)
                )
                .padding(Selection.border)
                .background {
                    Group {
                        if selection == index, code.kind == .guess {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Selection.color)
                                .matchedGeometryEffect(id: "selection", in: selectionNameSpace)
                        }
                    }
                    .animation(.selection, value: selection)
                }
                .onTapGesture {
                    if code.kind == .guess {
                        selection = index
                    }
                }
                //                .overlay {
                //                    RoundedRectangle(cornerRadius: 10)
                //                        .foregroundStyle(code.isHidden ? Color.gray : .clear)
                //                        .transaction {
                //                            transaction in if code.isHidden {
                //                                transaction.animation = nil
                //                            }
                //                        }
                //                }
                //                }
            }
            Color.clear.aspectRatio(1, contentMode: .fit)
                .overlay {
                    ancillaryView()
                }
        }
    }
    
    // helper func
    func displayPeg(at index: Int) ->  Peg {
        if code.isHidden {
            return ""
        } else {
            return code.pegs[index]
        }
    }
    
    func matchForPeg(at index: Int) -> Match? {
        switch code.kind {
        case .attempt(let matches):
            return matches[index]
        default:
            return nil
        }
    }
}

// fileprivate ทำให้ใช้ได้เฉพาะในไฟล์นี้เท่านั้น
fileprivate struct Selection {
    static let border: CGFloat = 5
    static let color: Color = .gray(0.85)
}

// เพิ่มคุณสมบัติให้ struct Color
extension Color {
    static func gray(_ brightness: CGFloat) -> Color {
        Color(hue: 148/360, saturation: 0, brightness: brightness)
    }
}

//#Preview {
//    CodeView()
//}
