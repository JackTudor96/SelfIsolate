//
//  ContentView.swift
//  SelfIsolate
//
//  Created by Jack Tudor on 25/03/2020.
//  Copyright © 2020 Jack Tudor. All rights reserved.
//

import SwiftUI
import CoreLocation

struct ContentView: View {

	@ObservedObject var locationViewModel = LocationViewModel()

	var body: some View {
		VStack {
			MapView(coordinate: self.locationViewModel.currentLocation.coordinate)
			Spacer()
			Text("(\(self.locationViewModel.currentLocation.coordinate.latitude), \(self.locationViewModel.currentLocation.coordinate.longitude), with timestamp: \((self.locationViewModel.location?.timestamp.description)!))") // Testing purposes
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
