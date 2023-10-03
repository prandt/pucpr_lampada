//
//  ContentView.swift
//  lampada
//
//  Created by user241332 on 02/10/23.
//

import SwiftUI

enum LampTypes: String {
    case warm, neutral, cold
}

func getColor(type: LampTypes) -> Color {
    switch (type) {
    case .cold:
        return Color.blue
    case .neutral:
        return Color.yellow
    case .warm:
        return Color.red
    }
}

struct ContentView: View {
    @State private var isOn = false
    @State private var selectedLamp: LampTypes = .warm
    var body: some View {
        VStack {
            Image(systemName: "lightbulb.circle.fill")
                .resizable()
                .frame(width: 300, height: 300)
                .foregroundColor(isOn ? getColor(type: selectedLamp) : .gray)
                .gesture(TapGesture().onEnded {_ in
                    	isOn = !isOn
                })
            Toggle(isOn: $isOn) {
                HStack {
                    Image(systemName: "lightbulb.circle.fill")
                        .foregroundColor(isOn ? getColor(type: selectedLamp) : .gray)
                    Text("Lampada")
                }
            }
            Picker("Select light type", selection: $selectedLamp) {
                Text("Warm").tag(LampTypes.warm)
                Text("Neutral").tag(LampTypes.neutral)
                Text("Cold").tag(LampTypes.cold)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
