//
//  HikeView.swift
//  Landmarks
//
//  Created by Arad Radfar on 7/31/22.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        asymmetric(insertion: AnyTransition.move(edge: .trailing), removal: .scale.combined(with: .opacity))
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = true

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    withAnimation {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .padding()
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
