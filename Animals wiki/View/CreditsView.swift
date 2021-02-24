//
//  CreditsView.swift
//  Animals wiki
//
//  Created by Ivan Mosquera on 24/2/21.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
    Copyright © Ivan Mosquera
    All rights reserved
    """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }//: VStack
        .padding()
        .opacity(0.4)
        
    }
}

// MARK: - Preview
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
