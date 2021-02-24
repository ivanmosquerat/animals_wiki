//
//  ContentView.swift
//  Animals wiki
//
//  Created by Ivan Mosquera on 9/2/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var isGridViewActive: Bool =  false
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    // MARK: - Functions
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    // MARK: - Body
    var body: some View {
    
        NavigationView{
            
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals){ animal in
                            
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }//: link
                        }//: Loop
                        CreditsView()
                            .modifier(CenterModifier())
                    }//: List
                    
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }//: Link
                            }//: Loop
                        }//: Grid
                        
                        .padding(10)
                        .animation(.easeIn)
                    }//: Scroll
                }//: Condition
            }//: Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing: 16){
                        
                        // List view
                        Button(action:{
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                                .help("List view")
                        }
                        
                        // Grid view
                        Button(action: {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }){
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                                .help("Grid view")
                        }
                    }//: HStack
                }//: ToolbarItem
            }//: Toolbar
        }//: NavigationView
            
    }
}

// MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
