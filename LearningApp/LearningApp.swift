//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Alcubierre Holdings Inc. on 2022-01-14.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
