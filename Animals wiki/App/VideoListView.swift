//
//  VideoListView.swift
//  Animals wiki
//
//  Created by Ivan Mosquera on 9/2/21.
//

import SwiftUI

struct VideoListView: View {
    
    // MARK: - Properties
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Body
    var body: some View {
        NavigationView{
            List{
                ForEach(videos){ video in
                    VideoListItemView(video: video)
                        .padding(.vertical, 8)
                }
            }//: List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }){
                        Image(systemName: "arrow.2.squarepath")
                    }
                    .help("Shuffle videos")
                }
            }
        }//: Navigation
    }
}

// MARK: - Preview
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
