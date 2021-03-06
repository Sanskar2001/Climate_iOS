//
//  MyModel.swift
//  Clima
//
//  Created by Sanskar Atrey on 01/10/21.

//

import Foundation
struct MyModel{
    let conditionId:Int
    let cityName:String
    let temperature:Float
    
    init(conditionId:Int , cityName:String , temperature:Float) {
        self.conditionId=conditionId
        self.cityName=cityName
        self.temperature=temperature
       
        
    }
    
    func getCondition(weatherId:Int)->String{
        
        switch weatherId{
        case 200...232:
            return "cloud.bolt"
        
        case 300...321:
            return "cloud.drizzle"
            
        case 500...531:
            return "cloud.rain"
        
        case 600...622:
            return "cloud.snow"
            
        case 701...781:
            return "cloud.fog"
        
        case 800:
            return "sun.max"
            
        case 801...804:
            return "cloud.bolt"
        
        default:
            return "cloud"
        }
    }
    
}
