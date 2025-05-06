//
//  Components.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/22/25.
//

import SwiftUI

extension SettingsView {
    func itemImage(systemName: String) -> some View {
        Image(systemName: systemName)
        .resizable()
        .scaledToFit()
        .frame(width: 18)
        .fontWeight(.semibold)
    }
    
    func itemTitle(_ title: String) -> some View {
        Text(title)
            .lineLimit(1)
    }
    
    
    func item(systemImage: String, title: String, description: String = "")
        -> some View
    {
        HStack {
            itemImage(systemName: systemImage)
            itemTitle(title)
            Spacer()
            Text(description)
                .foregroundColor(.secondary)
        }
        .font(.body)
    }

    func navigationItem(systemImage: String, title: String, description: String = "")
        -> some View
    {
        Button {
        } label: {
            HStack {
                itemImage(systemName: systemImage)
                itemTitle(title)
                Spacer()
                Text(description)
                    .foregroundStyle(.secondary)
                Image(systemName: "chevron.right")
                    .foregroundStyle(.secondary)
                    .font(.footnote)
            }
            .font(.body)
        }
    }

    func menuItem(systemImage: String, title: String, description: String)
        -> some View
    {
        Button {
        } label: {
            HStack {
                itemImage(systemName: systemImage)
                itemTitle(title)
                Spacer()
                Text(description)
                    .foregroundStyle(.secondary)
                Image(systemName: "chevron.up.chevron.down")
                    .foregroundStyle(.secondary)
                    .font(.footnote)
            }
            .font(.body)
        }
    }
    
    func toggleItem(systemImage: String, title: String, description: String = "", isOn: Binding<Bool>)
    -> some View{
        HStack {
            itemImage(systemName: systemImage)
            itemTitle(title)
            Spacer()
            Text(description)
                .foregroundStyle(.secondary)
            Toggle(isOn: isOn){
            }
        }
        .font(.body)
    }
}
