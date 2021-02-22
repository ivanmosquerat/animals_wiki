//
//  VideoListItem.swift
//  Animals wiki
//
//  Created by Ivan Mosquera on 22/2/21.
//

import SwiftUI

struct VideoListItemView: View {
    // MARK: - Properties
    let video: Video
    
    // MARK: - Body
    var body: some View {
        
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height:80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }//: ZHstack
            
            VStack(alignment: .leading, spacing: 10){
                Text(video.name)
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .fontWeight(.heavy)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }//: VStack
        }//: HStack
    }
}

// MARK: - Preview
struct VideoListItem_Previews: PreviewProvider {
    
    static let videos:[Video] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        VideoListItemView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
