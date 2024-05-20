//
//  LocationsViewModel.swift
//  MapLocation
//
//  Created by Aniket Patil on 20/05/24.
//

import Foundation
import MapKit
import SwiftUI


class LocationsViewModel: ObservableObject{
    
    //Load all locations
    @Published var locations : [Location]
    
    //Load current location
    @Published var mapLocation: Location {
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    
    //Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan =  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //Show list of locations
    @Published var showLocationsList:Bool = false
    
    //Show details via sheet
    @Published var sheetlocation:Location?  = nil
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    
    private func updateMapRegion(location:Location){
        withAnimation(.easeInOut)
        {
            mapRegion = MKCoordinateRegion(
             center: location.coordinates,
             span: mapSpan)
        }
    }
    
    
    func toggleLocationList(){
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    
    func showNextLocation(location:Location){
        withAnimation(.easeInOut)
        {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    
    func nextButtonPressed(){
        
        //Get the current index

        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Could  not get current index!!")
            return
        }
        
        //Check current index is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            //Next index is NOT valid
            //Restart from 0
            
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        
        //Next index is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
        
    }
    
}
