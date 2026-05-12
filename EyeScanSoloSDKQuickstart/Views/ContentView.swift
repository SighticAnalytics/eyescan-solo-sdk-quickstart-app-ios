//
// Copyright © 2022-2025 Sightic Analytics AB. All rights reserved.
//

import EyeScanSoloSDK
import SwiftUI

/// Screens possible to navigate to.
enum Screen {
    /// Start screen.
    case start
    /// Sightic scan screen
    case scan
    /// Display inference result.
    case result(SighticInference)
    /// Display an error.
    case error(SighticError)
}

struct ContentView: View {
    @State var screen: Screen = .start

    var body: some View {
        switch screen {
        case .start:
            StartView(screen: $screen)
        case .scan:
            ScanView(screen: $screen)
        case .result(let inference):
            ResultView(screen: $screen, inference: inference)
        case .error(let error):
            ErrorView(screen: $screen, error: error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
