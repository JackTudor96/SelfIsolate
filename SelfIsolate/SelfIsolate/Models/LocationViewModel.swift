//
//  LocationViewModel.swift
//  SelfIsolate
//
//  Created by Jack Tudor on 25/03/2020.
//  Copyright © 2020 Jack Tudor. All rights reserved.
//

import Foundation
import MapKit
import UIKit
import Combine
import CoreLocation

/// Responsible for passing back the users last known location
final class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {

	// MARK: - Properties -
	// MARK: Private

	@Published private(set) var currentLocation = CLLocation()
	@Published private(set) var location: Location?

	private let locationManager = CLLocationManager()

	// MARK: - Initialiser -

	override init() {
		super.init()
		self.locationManager.delegate = self
		self.locationManager.requestWhenInUseAuthorization()
		self.locationManager.startUpdatingLocation()
	}

	func locationManager(_: CLLocationManager, didUpdateLocations: [CLLocation]) {
		guard let usersLastKnowLocation = didUpdateLocations.last else { return }
		currentLocation = usersLastKnowLocation
		let lat = currentLocation.coordinate.latitude
		let long = currentLocation.coordinate.longitude
		location = Location(lat: lat, long: long, timestamp: Date())
	}

    func drawTrackedLocation() {
		let start = CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: start, latitudinalMeters: 2000, longitudinalMeters: 2000)
    }

	// TODO: Enable background tracking
	// TODO: Submit lat/long to some service

}
