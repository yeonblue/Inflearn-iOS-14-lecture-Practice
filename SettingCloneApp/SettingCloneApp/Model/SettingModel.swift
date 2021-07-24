//
//  SettingModel.swift
//  SettingCloneApp
//
//  Created by yeonBlue on 2021/07/24.
//

import Foundation

struct SettingModel {
    var leftImageName: String = ""
    var menuTitle: String = ""
    var subTitle: String?
    var rightImageName: String?
    
    static func makeSettingData() -> [[SettingModel]] {
        let data =
        [
            [SettingModel(leftImageName: "person.circle",
                     menuTitle: "Sign in to your iPhone",
                     subTitle: "Set up iCloud, the App Store, and more.",
                     rightImageName: "chevron.right")
            ],
            
            [
                SettingModel(leftImageName: "gear",
                         menuTitle: "General",
                         subTitle: nil,
                         rightImageName: "chevron.right"),
                SettingModel(leftImageName: "person.fill",
                         menuTitle: "Accessibility",
                         subTitle: nil,
                         rightImageName: "chevron.right"),
                SettingModel(leftImageName: "hand.raised.fill",
                         menuTitle: "Privacy",
                         subTitle: nil,
                         rightImageName: "chevron.right")
            ]
        ]
        
        return data
    }
}

