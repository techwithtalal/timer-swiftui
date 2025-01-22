//
//  TimerView.swift
//  Timer
//
//  Created by Tech With Talal on 1/20/25.
//

import SwiftUI

struct TimerView: View {

    @State private var timeRemaining = 300

    var body: some View {
        Text(timeString(from: timeRemaining))
            .font(.largeTitle)
            .padding()
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    if (timeRemaining > 0) {
                        timeRemaining -= 1
                    } else {
                        timer.invalidate()
                    }
                }
            }
    }

    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    TimerView()
}
