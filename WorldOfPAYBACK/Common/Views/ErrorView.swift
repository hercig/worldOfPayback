//
//  ErrorView.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 18.10.23.
//

import SwiftUI

struct ErrorView: View {

    // MARK: - Init properties

    var errorMessage: String? = nil
    let tryAgainHandler: (() -> Void)?

    // MARK: - View

    var body: some View {

        VStack {
            LottieView(name: Assets.Animations.somethingWentWrong.rawValue, loopMode: .loop)
                .frame(height: 200)
                .padding()

            if let errorMessage {
                Text("Error: \(errorMessage)")
                    .multilineTextAlignment(.center)
            }

            if let tryAgainHandler {
                Button("Try again") {
                    tryAgainHandler()
                }
                .buttonStyle(.bordered)
                .foregroundStyle(Assets.Colors.primary.swiftUIColor)
                .padding(.top, 45)
            }
        }
    }
}
