//
//  Prefix.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 16.10.23.
//

import SwiftUI

prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}
