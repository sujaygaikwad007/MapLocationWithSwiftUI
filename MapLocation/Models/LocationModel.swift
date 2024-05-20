//
//  LocationModel.swift
//  MapLocation
//
//  Created by Aniket Patil on 20/05/24.
//

import Foundation
import MapKit


struct Location:Identifiable ,Equatable {
    
    
    
    let name:String
    let cityName:String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link:String
    
    //For Identifiable
    var id:String {
        
        name + cityName
    }
    
    //Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
    
}
