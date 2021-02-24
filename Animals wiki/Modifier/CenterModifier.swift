//
//  CenterModifier.swift
//  Animals wiki
//
//  Created by Ivan Mosquera on 24/2/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
