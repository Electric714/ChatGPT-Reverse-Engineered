//
//  Drawer.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/24/25.
//

import SwiftUI

struct Drawer<V: View>: ViewModifier {
    @Binding var drawerState: DrawerState
    let drawerView: V
    let drawerWidthRatio: CGFloat = 5 / 7

    func body(content: Content) -> some View {
        GeometryReader { geometry in

            let frameWidth = geometry.size.width
            let frameHeight = geometry.size.height

            let drawerWidth =
                switch drawerState {
                case .closed: frameWidth * drawerWidthRatio
                case .half: frameWidth * drawerWidthRatio
                case .open: frameWidth
                }

            let offsetWidth =
                switch drawerState {
                case .closed: -drawerWidth
                case .half: CGFloat(0)
                case .open: CGFloat(0)
                }

            HStack(spacing:0){
                drawerView
                    .frame(width: drawerWidth, height: frameHeight)
                    
                ZStack {
                    content
                        .frame(width: frameWidth, height: frameHeight)
                    Color.black.opacity(drawerState == .closed ? 0 : 0.2)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(){
                                drawerState = .closed
                            }
    
                        }
                }
            }
            .offset(.init(width: offsetWidth, height: 0))
        }
    }
    
    func geometryInterpreter (_ geometry: GeometryProxy) -> (CGFloat,CGFloat,CGFloat,CGFloat){
        let frameWidth = geometry.size.width
        let frameHeight = geometry.size.height

        let drawerWidth =
            switch drawerState {
            case .closed: frameWidth * drawerWidthRatio
            case .half: frameWidth * drawerWidthRatio
            case .open: frameWidth
            }

        let offsetWidth =
            switch drawerState {
            case .closed: -drawerWidth
            case .half: CGFloat(0)
            case .open: CGFloat(0)
            }
        
        return (frameWidth,frameHeight,drawerWidth,offsetWidth)
    }

}

enum DrawerState {
    case closed
    case half
    case open
}

extension View {
    func drawer<V: View>(state: Binding<DrawerState>, drawerView: V)
        -> some View
    {
        modifier(Drawer(drawerState: state, drawerView: drawerView))
    }
}
