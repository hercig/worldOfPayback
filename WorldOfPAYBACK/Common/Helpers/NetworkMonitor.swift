//
//  NetworkMonitor.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 16.10.23.
//

import Foundation
import Network

final class NetworkMonitor: ObservableObject {

    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")

    var isConnected = false

    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            Task {
                await MainActor.run {
                    self.objectWillChange.send()
                }
            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}
