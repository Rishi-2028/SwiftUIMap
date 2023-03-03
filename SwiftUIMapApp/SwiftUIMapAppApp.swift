//
//  SwiftUIMapAppApp.swift
//  SwiftUIMapApp
//
//  Created by Rishi on 03/03/2023.
//

import SwiftUI

@main
struct SwiftUIMapAppApp: App {
    
    @StateObject private var vm = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
