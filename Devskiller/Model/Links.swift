//
//  Links.swift
//  Devskiller
//
//  Created by Rodrigo Franzoi on 06/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

struct Links: DecodableOutput {
    
    let mission_patch: String?
    let mission_patch_small: String?
    let reddit_campaign: String?
    let reddit_launch: String?
    let reddit_recovery: String?
    let reddit_media: String?
    let presskit: String?
    let article_link: String?
    let wikipedia: String?
    let video_link: String?
    let youtube_id: String?
    
    static func mock() -> Links {
        return Links(mission_patch: nil,
                     mission_patch_small: nil,
                     reddit_campaign: nil,
                     reddit_launch: nil,
                     reddit_recovery: nil,
                     reddit_media: nil,
                     presskit: nil,
                     article_link: "article",
                     wikipedia: "wikipedia",
                     video_link: "youtube",
                     youtube_id: nil)
    }
}
