//
//  ContentView.swift
//  cumi
//
//  Created by Piyush Pandey on 29/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
			ZStack {
				LinearGradient(gradient: Gradient(colors: [
					.pink.opacity(0.4), .orange.opacity(0.6)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
				KeyView()
			}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
