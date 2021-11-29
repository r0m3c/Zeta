//
//  LazyView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/28/21.
//

import Foundation
import SwiftUI

struct LazyView<Content: View>: View {
    var content: () -> Content
    
    var body: some View {
        self.content()
    }
}
