//
//  MatchedGeometryEffect.swift
//  AdvanceSwiftUIBootcamp
//
//  Created by Julio Collado Perez on 4/10/23.
//

import SwiftUI

struct MatchedGeometryEffect: View {
    @State var isClicked: Bool = false
    
    @Namespace private var profileAnimationSpace
    
    private var profileImageId = "profileImageId"
    private var nameId = "nameId"
    private var rollId = "rollId"
    
    var body: some View {
        ScrollView {
            if isClicked {
                expandedView
            } else {
                collapsedView
            }
            ForEach(0..<10) { _ in
                video
                    .padding(1)
            }
        }
    }
    
    var profileImage: some View {
        Image("angeline")
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .onTapGesture {
                withAnimation(.spring()) {
                    isClicked.toggle()
                }
            }
    }
    
    var collapsedView: some View {
        HStack(spacing: 10) {
            profileImage
                .matchedGeometryEffect(id: profileImageId, in: profileAnimationSpace)
                .frame(width: 80, height: 80)
                .padding(.leading, 16)
            
            VStack(alignment: .leading) {
                Text("Angeline")
                    .matchedGeometryEffect(id: nameId, in: profileAnimationSpace)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("iOS Developer")
                    .matchedGeometryEffect(id: rollId, in: profileAnimationSpace)
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    var expandedView: some View {
        VStack {
            profileImage
                .matchedGeometryEffect(id: profileImageId, in: profileAnimationSpace)
                .frame(width: 300, height: 300)
            Text("Angeline")
                .matchedGeometryEffect(id: nameId, in: profileAnimationSpace)
                .font(.title)
                .fontWeight(.semibold)
            
            Text("iOS Developer")
                .matchedGeometryEffect(id: rollId, in: profileAnimationSpace)
                .font(.title3)
                .foregroundColor(.secondary)
            
            Text("A dummy is a type of doll that looks like a person. Entertainers called ventriloquists can make dummies appear to talk. The automobile industry uses dummies in cars to study how safe cars are during a crash. A dummy can also be anything that looks real but doesn't work: a fake.")
                .font(.callout)
                .foregroundColor(.secondary)
                .padding(5)
        }
        .frame(alignment: .center)
        .padding()
        .fixedSize(horizontal: false, vertical: true)
    }
    
    var video: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(height: 200)
            .overlay {
                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .foregroundColor(.red)
            }
    }
    
}

struct MatchedGeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffect()
    }
}
