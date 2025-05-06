//
//  AccountSection.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/22/25.
//

import SwiftUI

extension SettingsView {

    var accountSection: some View {
        Section(Constants.Strings.accountSectionTitle) {
            email
            phoneNumber
            subscription
            upgrade
            restore
            personalization
            dataControls
            archivedChats
            security
        }
    }

    var email: some View {
        item(
            systemImage: Constants.Strings.emailImageSystemName, title: Constants.Strings.emailTitle,
            description: authViewModel.user!.email!)
    }

    var phoneNumber: some View {
        item(
            systemImage: Constants.Strings.phoneImageSystemName, title: Constants.Strings.phoneTitle,
            description: "+12345678901")
    }

    var subscription: some View {
        item(
            systemImage: Constants.Strings.subscriptionImageSystemName, title: Constants.Strings.subscriptionTitle,
            description: /*chatgpt.user.subscription.rawValue*/ "Free")
    }

    var upgrade: some View {
        Button {
        } label: {
            item(
                systemImage: Constants.Strings.upgradeImageSystemName, title: Constants.Strings.upgradeTitle)
        }
    }

    var restore: some View {
        Button {
        } label: {
            item(
                systemImage: Constants.Strings.restoreImageSystemName,
                title: Constants.Strings.restoreTitle)

        }
    }

    var personalization: some View {
        navigationItem(systemImage: Constants.Strings.personalizationImageSystemName, title: Constants.Strings.personalizationTitle)
    }

    var dataControls: some View {
        navigationItem(systemImage: Constants.Strings.dataControlsImageSystemName, title: Constants.Strings.dataControlsTitle)
    }

    var archivedChats: some View {
        navigationItem(systemImage: Constants.Strings.archivedChatsImageSystemName, title: Constants.Strings.archivedChatsTitle)
    }

    var security: some View {
        navigationItem(systemImage: Constants.Strings.securityImageSystemName, title: Constants.Strings.securityTitle)
    }
}

extension SettingsView.Constants.Strings {
    static let accountSectionTitle = "Account"
    static let emailImageSystemName = "envelope"
    static let emailTitle = "Email"
    static let phoneImageSystemName = "phone"
    static let phoneTitle = "Phone"
    static let subscriptionImageSystemName = "plus.square"
    static let subscriptionTitle = "Subscription"
    static let upgradeImageSystemName =  "arrow.up.circle"
    static let upgradeTitle = "Upgrade to Plus"
    static let restoreImageSystemName = "arrow.trianglehead.clockwise.rotate.90"
    static let restoreTitle = "Restore Purchases"
    static let personalizationImageSystemName = "person"
    static let personalizationTitle = "Personalization"
    static let dataControlsImageSystemName = "server.rack"
    static let dataControlsTitle = "Data Controls"
    static let archivedChatsImageSystemName = "archivebox"
    static let archivedChatsTitle = "Archived chats"
    static let securityImageSystemName = "lock.shield"
    static let securityTitle = "Security"
}
