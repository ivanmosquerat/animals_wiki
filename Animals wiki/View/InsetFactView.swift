//
//  InsetFactView.swift
//  Animals wiki
//
//  Created by Ivan Mosquera on 22/2/21.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - Properties
    let animal: Animal
    
    // MARK: - Body
    var body: some View {
        GroupBox {
            TabView{
                ForEach(animal.fact, id: \.self) { fact in
                    Text(fact)
                }
            }//: TabView
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//: Box
    }
}

// MARK: - Preview
struct InsetFactView_Previews: PreviewProvider {
    
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
