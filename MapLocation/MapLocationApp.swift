//
//  MapLocationApp.swift
//  MapLocation
//
//  Created by Aniket Patil on 20/05/24.
//

import SwiftUI

@main
struct MapLocationApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            LocationView()
                .environmentObject(vm)
        }
    }
}
