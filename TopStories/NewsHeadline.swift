//
//  NewsHeadline.swift
//  TopStories
//
//  Created by Kelby Mittan on 11/25/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import Foundation

// top level JSON - HeadlinesData.self because top level json is a dictionary
struct HeadlinesData: Codable {
    let results: [NewsHeadline] // "results" represents the json array of stories
}


struct NewsHeadline: Codable {
    let title: String
    let abstract: String
}

extension HeadlinesData {
    // parse the "topStoriesTechnology.json" into an array of [NewsHeadline] objects
    static func getHeadlines() -> [NewsHeadline] {
        var headlines = [NewsHeadline]()
        
        // Bundle() allows us to access our app resources and files
        
        // get the url to the intended resource
        guard let fileURL = Bundle.main.url(forResource: "topStoriesTechnology", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        
        // get data from the contents of the fileURL
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            // parse data to our Swift [NewHeadline]
            
            let headlinesData = try JSONDecoder().decode(HeadlinesData.self, from: data)
            
            headlines = headlinesData.results
        } catch {
            fatalError("contents failed to load")
        }
        
        
        
        return headlines
    }
}
