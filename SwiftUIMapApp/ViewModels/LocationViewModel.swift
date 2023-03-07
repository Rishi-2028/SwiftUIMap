//
//  LocationViewModel.swift
//  SwiftUIMapApp
//
//  Created by Rishi on 03/03/2023.
//

import Foundation
import MapKit
import SwiftUI



class LocationViewModel: ObservableObject {
    
    //All loaded locations
    @Published var locations: [Location]
    
    //current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current Region on Map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //Show list  of locations
    @Published var showLocationList: Bool = false
    
    // Show Location Detail Via  Sheet
    @Published var showLocationDetailSheet: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location:Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleLocationList() {
        withAnimation(.easeInOut){
            showLocationList = !showLocationList
        }
        
    }
    func shownextLocation(location:Location) {
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationList = false
        }
        
    }
    
    
    func nextButtonPressed() {
         
        //Get the current index
        
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation}) else {
            return
        }
        
        // Check if the currentIndex is Valid
        
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is NOT Valid
            //Restart from 0
            
            guard let firstLocation = locations.first else {return}
            shownextLocation(location: firstLocation)
            return
        }
        
        // Next Index is Valid
        let nextLocation = locations[nextIndex]
        shownextLocation(location: nextLocation)
    }
}
