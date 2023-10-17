//
//  LottieView.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 17.10.23.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    
    let name: String
    let loopMode: LottieLoopMode

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)

        let lottieAnimationView = LottieAnimationView(name: name)

        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.loopMode = .loop
        lottieAnimationView.play()

        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lottieAnimationView)

        NSLayoutConstraint.activate([
          lottieAnimationView.widthAnchor.constraint(equalTo: view.widthAnchor),
          lottieAnimationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
