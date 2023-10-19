//
//  YoutubeSearchResponse.swift
//  Netflix Clone One
//
//  Created by Jaloliddin Egamberdiyev on 18/10/23.
//

import Foundation


struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
        
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    
    let kind: String
    let videoId: String
}
