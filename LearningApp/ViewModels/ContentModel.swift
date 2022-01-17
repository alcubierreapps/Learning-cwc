//
//  ContentModel.swift
//  LearningApp
//
//  Created by Alcubierre Holdings Inc. on 2022-01-14.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    func getLocalData() {
        
        //Get a url to the json file
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            //Read the file into a data object
            let jsonData = try Data(contentsOf: jsonURL!)
            
            // Try to decode the json into an arrray of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            //Assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            //Log Error
            print("Couldn't parse local data")
        }
        
        //Parse the style data
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            //Read the fil;e into a data object
            let styleData = try Data(contentsOf: styleURL!)
            
            self.styleData = styleData
            
        }
        catch {
            //Log Error
            print("Couldn't parse style data")
        }
    }
}
