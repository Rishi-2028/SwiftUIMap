//
//  LocationPreviewView.swift
//  SwiftUIMapApp
//
//  Created by Rishi on 03/03/2023.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm:LocationViewModel
    
    let location: Location
    
    var body: some View {
        
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing:16){
                    imageSection
                    titleSection
            }
//            .background(Color.blue)
            VStack(spacing:15) {
                learnMoreButton
                nextButton
            }
//            .background(Color.orange)
            
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y:65)
        
        )
        .cornerRadius(10)
            
        
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }
        .environmentObject(LocationViewModel())
    }
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
        
        
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color.blue)
    }
    
    private var learnMoreButton: some View {
        Button {
            //
        } label: {
            Text("Learn More..")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
        
    }
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}
