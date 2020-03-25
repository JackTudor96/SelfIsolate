//
//  LoadingSpinner.swift
//  SelfIsolate
//
//  Created by Jack Tudor on 25/03/2020.
//  Copyright © 2020 Jack Tudor. All rights reserved.
//

import SwiftUI

struct LoadingSpinner: View {

	@State private var animateStrokeStart = false
	@State private var animateStrokeEnd = false
	@State private var isRotating = false
	
    var body: some View {
			Circle()
			.trim(from: animateStrokeStart ? 1/3 : 1/9, to: animateStrokeEnd ? 2/5 : 1)
			.stroke(lineWidth: 5)
			.frame(width: 150, height: 150)
			.foregroundColor(.blue)
			.rotationEffect(.degrees(isRotating ? 360: 0))
			.onAppear() {
				withAnimation(Animation.linear(duration: 1)
					.repeatForever(autoreverses: false)) {
						self.isRotating.toggle()
				}
				withAnimation(Animation.linear(duration: 1)
					.delay(0.5)
					.repeatForever(autoreverses: true)) {
						self.animateStrokeStart.toggle()
				}
				withAnimation(Animation.linear(duration: 1)
					.delay(0.5)
					.repeatForever(autoreverses: true)) {
						self.animateStrokeEnd.toggle()
				}
		}
    }
}

struct LoadingSpinner_Previews: PreviewProvider {
    static var previews: some View {
        LoadingSpinner()
    }
}
