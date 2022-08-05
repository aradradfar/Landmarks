//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Arad Radfar on 8/5/22.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark

    var body: some View {
        landmark.featuredImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverLay(landmark: landmark)
            }
    }
}

struct TextOverLay: View {
    var landmark: Landmark

    var gradient: LinearGradient {
        .linearGradient(colors: [.black.opacity(0.6), .black.opacity(0)], startPoint: .bottom, endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeaturedCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
}
