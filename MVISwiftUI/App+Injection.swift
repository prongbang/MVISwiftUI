//
//  App+Injection.swift
//  MVISwiftUI
//
//  Created by Endtry on 18/10/2563 BE.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerHoliday()
    }
}
