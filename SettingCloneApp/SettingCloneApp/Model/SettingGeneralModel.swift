//
//  SettingGeneralModel.swift
//  SettingCloneApp
//
//  Created by yeonBlue on 2021/07/24.
//

import Foundation

struct SettingGeneralModel {
    var leftTitle = ""
    
    static func makeSettingGeneralData() -> [[SettingGeneralModel]]{
        let data =
        [
            [
                SettingGeneralModel(leftTitle: "About")
            ],
            [
                SettingGeneralModel(leftTitle: "Keyboard"),
                SettingGeneralModel(leftTitle: "Game Controller"),
                SettingGeneralModel(leftTitle: "Fonts"),
                SettingGeneralModel(leftTitle: "Language & Region"),
                SettingGeneralModel(leftTitle: "Directory")
            ],
            [
                SettingGeneralModel(leftTitle: "Reset")
            ]
        ]
        
        return data
    }
}
