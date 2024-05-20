//
//  LocationMapAnnotionView.swift
//  MapLocation
//
//  Created by Aniket Patil on 20/05/24.
//

import SwiftUI

struct LocationMapAnnotionView: View {
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing:0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .foregroundColor(accentColor)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-4)
                .padding(.bottom,40)
            
            
        }
    }
}

struct LocationMapAnnotionView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotionView()
    }
}
