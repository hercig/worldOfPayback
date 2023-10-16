//
//  WorldOfPAYBACKApp.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 12.10.23.
//

import SwiftUI

@main
struct WorldOfPAYBACKApp: App {

    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            TransactionsView(viewModel: .init())
                .sheet(isPresented: !$networkMonitor.isConnected) {
                    Text("W") // TODO: Replace with no internet connection screen
                        .interactiveDismissDisabled()
                }
        }
    }
}
