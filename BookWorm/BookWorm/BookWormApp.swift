//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Yaroslav Zherebukh on 3/9/22.
//

import SwiftUI

@main
struct BookWormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
