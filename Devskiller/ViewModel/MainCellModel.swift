//
//  MainCellModel.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 06/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation
import UIKit

class MainCellModel {
    
    private let mission: Mission
    
    public let checkImg: UIImage?
    public let missionName: String
    public let rocketName: String
    public let patchUrl: String
    public var daysTitle: String = "Days"
    public var days: String = ""
    public var date: String = ""
    
    init(mission: Mission) {
        self.mission = mission
        
        missionName = mission.mission_name
        rocketName =  mission.rocket.rocket_name + " / " + mission.rocket.rocket_type
        patchUrl = mission.links.mission_patch_small ?? "https://eu.ui-avatars.com/api/?size=48&name=".appending(mission.mission_name.initials())
        if let success = mission.launch_success {
            checkImg = success ? UIImage(named: "success") : UIImage(named: "failed")
        } else {
            checkImg = UIImage(named: "schedule")
        }
        
        if let launchDate = mission.launch_date_local.date(with: .otherIso8601) {
            date = launchDate.dateTime
            daysTitle = launchDate < Date() ?  "Days since:" : "Days from:"
            days = "\(Date().daysBetween(date: launchDate))"
        }
    }
}
