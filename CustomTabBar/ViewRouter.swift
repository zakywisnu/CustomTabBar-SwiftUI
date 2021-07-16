//
//  ViewRouter.swift
//  CustomTabBar
//
//  Created by Ahmad Zaky on 16/07/21.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject{
    @Published var currentPage: Page = .home
    
}

enum Page{
    case home
    case liked
    case records
    case user
}
