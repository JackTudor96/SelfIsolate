//
//  LocationViewModel.swift
//  SelfIsolate
//
//  Created by Jack Tudor on 25/03/2020.
//  Copyright © 2020 Jack Tudor. All rights reserved.
//

import Foundation
import Combine
import CoreLocation

/// Responsible for passing back the users last known location
final class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {

	// MARK: - Properties -
	// MARK: Private

	@Published private(set) var currentLocation = CLLocation()
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
	}

	// TODO: Enable background tracking
	// TODO: Submit lat/long to some service

}
