//
//  ContentView.swift
//  SelfIsolate
//
//  Created by Jack Tudor on 25/03/2020.
//  Copyright © 2020 Jack Tudor. All rights reserved.
//

import SwiftUI

struct ContentView: View {

	var body: some View {
		ZStack {
			Text("Fetching content").offset(y: -350)
			LoadingSpinner()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
