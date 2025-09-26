////
////  ContentView.swift
////  SuiteWorld
////
////  Created by Robert Smith on 9/26/25.
////
//
//import SwiftUI
//import AVKit
//
//struct ContentView: Scene {
//    var body: some Scene {
//        Window("Facia1", id: WindowID.facia1.rawValue) {
//            HorizontalView()
//        }
//        .defaultSize(width: 1920, height: 1080)
//        .windowResizability(.contentSize)
//        
//        Window("Facia2", id: WindowID.facia2.rawValue) {
//            HorizontalView()
//        }
//        .defaultSize(width: 1920, height: 1080)
//        .windowResizability(.contentSize)
//        
//        Window("Tower1", id: WindowID.tower1.rawValue) {
//            HorizontalView()
//        }
//        .defaultSize(width: 1920, height: 1080)
//        .windowResizability(.contentSize)
//        
//        Window("Tower1", id: WindowID.tower1.rawValue) {
//            HorizontalView()
//        }
//        .defaultSize(width: 1920, height: 1080)
//        .windowResizability(.contentSize)
//        
//        Window("Marquee", id: WindowID.marquee.rawValue) {
//            HorizontalView()
//        }
//        .defaultSize(width: 1920, height: 1080)
//        .windowResizability(.contentSize)
//    }
//}
//
//
//
//
//// MARK: - Window IDs
//enum WindowID: String {
//    case facia1
//    case facia2
//    case tower1
//    case tower2
//    case marquee
//}
//
//// MARK: - Shared UI Helpers
//struct SectionHeader: View {
//    var title: String
//    var video: String
//    var body: some View {
//        
//    }
//}
//
//// MARK: - Horizontal Video View
//struct HorizontalView: View {
//    @State private var player: AVPlayer = {
//        let player = AVPlayer(url: Bundle.main.url(forResource: "oracle_horizontal", withExtension: "mp4")!)
//        player.isMuted = true
//        player.play()
//        return player
//    }()
//    
//    var body: some View {
//        VStack {
//            VideoPlayer(player: player)
//                .ignoresSafeArea(.all)
//        }
//    }
//}
//
//// MARK: - Vertical Video View
//struct VerticalView: View {
//    @State private var player: AVPlayer = {
//        let player = AVPlayer(url: Bundle.main.url(forResource: "oravle_vertical", withExtension: "mp4")!)
//        player.isMuted = true
//        player.play()
//        return player
//    }()
//    
//    var body: some View {
//        VStack {
//            VideoPlayer(player: player)
//                .ignoresSafeArea(.all)
//        }
//    }
//}
