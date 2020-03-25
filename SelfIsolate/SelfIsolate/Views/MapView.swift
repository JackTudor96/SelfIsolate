//
//  MapView.swift
//  SelfIsolate
//
//  Created by Jack Tudor on 25/03/2020.
//  Copyright © 2020 Jack Tudor. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

	// MARK: - Properties -
	// MARK: Internal

	var coordinate: CLLocationCoordinate2D

	// MARK: - Functions -
	// MARK: Internal

	func makeUIView(context: Context) -> MKMapView {
		MKMapView(frame: .zero)
	}

	func updateUIView(_ view: MKMapView, context: Context) {
		let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
		let coordinateRegion = MKCoordinateRegion(center: coordinate, span: span)
		view.setRegion(coordinateRegion, animated: true)
		setupAnnotation(with: view)
	}

	private func setupAnnotation(with mapView: MKMapView) {
		mapView.removeAnnotations(mapView.annotations)
		let annotation = MKPointAnnotation()
		annotation.coordinate = coordinate
		mapView.addAnnotation(annotation)
	}
}

struct MapView_Previews: PreviewProvider {
	static var previews: some View {
		MapView(coordinate: CLLocationCoordinate2DMake(51.483410, -9.373060))
	}
}
