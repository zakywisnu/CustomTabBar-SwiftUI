//
//  CustomTabBarApp.swift
//  CustomTabBar
//
//  Created by Ahmad Zaky on 16/07/21.
//

import SwiftUI

@main
struct CustomTabBarApp: App {
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
        }
    }
}
