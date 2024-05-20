//
//  LocationDetailsView.swift
//  MapLocation
//
//  Created by Aniket Patil on 20/05/24.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    let location: Location
    
    var body: some View {
        
        ScrollView{
            VStack{
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    titleSection
                    Divider()
                    descSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding()
                
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton, alignment: .topTrailing)
       
    }
}

struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}



extension LocationDetailsView {
    
    private var imageSection : some View {
        TabView{
            ForEach(location.imageNames, id: \.self) {
                 Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width:UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height:500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View{
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
        
    }
    
    private var descSection: some View{
        VStack(alignment: .leading, spacing: 8) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if let url = URL(string: location.link){
                Link("Read More",destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
          
          
        }
        
    }
    
    
    private var mapLayer:some View{
        
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates,
            span:MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
            annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates){
                LocationMapAnnotionView()
                    .shadow(radius: 10)
            }
        }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
    }
    
    
    private var backButton: some View {
         
        Button {
            vm.sheetlocation = nil
            
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }

    }
    
    
}
