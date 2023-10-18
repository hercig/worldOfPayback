//
//  InternetErrorView.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 18.10.23.
//

import SwiftUI

struct InternetErrorView: View {

    // MARK: - View

    var body: some View {

        VStack {
            LottieView(name: Assets.Animations.noInternet.rawValue, loopMode: .loop)
                .frame(height: 250)

            Text("No internet connection!\n Please reconnect.")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(.top, 25)
                .foregroundStyle(.secondary)
        }
    }
}
