//
//  SuiteWorldApp.swift
//  SuiteWorld
//
//  Created by Robert Smith on 9/26/25.
//

import SwiftUI
import AVKit
import AppKit

@main
struct SuiteWorldApp: App {
    
    init() {
        UserDefaults.standard.set(true, forKey: "NSFullScreenMenuItemEverywhere")
    }
    
    @Environment(\.openWindow) private var openWindow
    
    var body: some Scene {
        Window("Facia1", id: WindowID.facia1.rawValue) {
            HorizontalView()
                .makeFullScreen()
        }
        .defaultSize(width: 3840, height: 720)
        
        Window("Facia2", id: WindowID.facia2.rawValue) {
            HorizontalView()
                .makeFullScreen()
        }
        .defaultSize(width: 3840, height: 720)
        
        Window("Tower1", id: WindowID.tower1.rawValue) {
            VerticalView()
                .makeFullScreen()
        }
        .defaultSize(width: 720, height: 3840)
        
        Window("Tower2", id: WindowID.tower2.rawValue) {
            VerticalView()
                .makeFullScreen()
        }
        .defaultSize(width: 720, height: 3840)
        
        Window("Marquee", id: WindowID.marquee.rawValue) {
            MarqueeView()
                .makeFullScreen()
        }
        .defaultSize(width: 1920, height: 1080)
    }
}

// MARK: - Window IDs
enum WindowID: String {
    case facia1
    case facia2
    case tower1
    case tower2
    case marquee
}

// MARK: - Shared UI Helpers
struct SectionHeader: View {
    var title: String
    var video: String
    var body: some View {
        
    }
}

// MARK: - Horizontal Video View
struct HorizontalView: View {
    @Environment(\.openWindow) private var openWindow
    @State private var player: AVPlayer = {
        let player = AVPlayer(url: Bundle.main.url(forResource: "oracle_horizontal", withExtension: "mp4")!)
        player.isMuted = true
        player.play()
        return player
    }()
    
    var body: some View {
        ZStack {
            VideoPlayer(player: player)
            
            VStack {
                Spacer()
                HStack {
                    Image("watermark", bundle: Bundle.main)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .padding()
                        .opacity(0.25)
                    Spacer()
                }
            }
        }
        .windowFullScreenBehavior(.enabled)
        .onAppear() {
            openWindow(id: WindowID.facia2.rawValue)
            openWindow(id: WindowID.tower1.rawValue)
            openWindow(id: WindowID.tower2.rawValue)
            openWindow(id: WindowID.marquee.rawValue)
            NotificationCenter.default.addObserver(forName: AVPlayerItem.didPlayToEndTimeNotification, object: nil, queue: .main) { notification in
                player.seek(to: .zero)
                player.play()
            }
        }
    }
}

// MARK: - Vertical Video View
struct VerticalView: View {
    @State private var player2: AVPlayer = {
        let player2 = AVPlayer(url: Bundle.main.url(forResource: "oracle_vertical", withExtension: "mp4")!)
        player2.isMuted = true
        player2.play()
        return player2
    }()
    
    var body: some View {
        VStack {
            VideoPlayer(player: player2)
                .ignoresSafeArea(.all)
        }
        .onAppear() {
            NotificationCenter.default.addObserver(forName: AVPlayerItem.didPlayToEndTimeNotification, object: nil, queue: .main) { notification in
                player2.seek(to: .zero)
                player2.play()
            }
        }
    }
}

// MARK: - Marquee View
struct MarqueeView: View {
    var body: some View {
        Text("Coming soon...")
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
            .padding()
            .background(Color.black.opacity(0.5))
    }
}



extension View {
    func makeFullScreen() -> some View {
        self.onAppear {
            if let window = NSApplication.shared.windows.last {
                DispatchQueue.main.async {
                    if !window.styleMask.contains(.fullScreen) {
                        window.toggleFullScreen(nil)
                    }
                }
            }
        }
    }
}
