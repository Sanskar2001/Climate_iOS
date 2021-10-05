//
//  WeatherDataModel.swift
//  Clima
//
//  Created by Sanskar Atrey on 30/09/21.

//

import Foundation
struct WeatherDataModel:Decodable{
    let name:String
    let weather:[Weather]
    let main:Main
}

struct Main:Decodable{
    let temp:Float

}
struct Weather:Decodable{
    let main:String
    let id:Int
    let description:String
}
