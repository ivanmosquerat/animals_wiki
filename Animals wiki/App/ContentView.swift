//
//  ContentView.swift
//  Animals wiki
//
//  Created by Ivan Mosquera on 9/2/21.
//

import SwiftUI

struct ContentView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    var body: some View {
        NavigationView{
            List{
                CoverImageView()
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals){ animal in
                    AnimalListItemView(animal: animal)
                }
            }
            .navigationBarTitle("Africa", displayMode: .large)
        }//: NavigationView
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
