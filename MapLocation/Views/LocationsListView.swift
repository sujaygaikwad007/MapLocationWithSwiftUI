//
//  LocationsList.swift
//  MapLocation
//
//  Created by Aniket Patil on 20/05/24.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List{
            ForEach(vm.locations){ location in
                Button(action: {
                    vm.showNextLocation(location: location)
                }, label: {
                    listRowView(location: location)
                })
                .padding(.vertical,4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
        
    }
}

struct LocationsList_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsListView{
    
    private func listRowView(location:Location) -> some View
    {
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment:.leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth:.infinity,alignment:.leading)
            
        }
    }
    
}
