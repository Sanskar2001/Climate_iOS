//
//  ApiManager.swift
//  Clima
//
//  Created by Sanskar Atrey on 29/09/21.
//

import Foundation
import UIKit
//0edefae03625ecebec1cbc76fdf80b07

protocol ApiManagerDelegate{
    func didUpdateWeather(weather:MyModel)
    func didFailWithError(error:Error)
}
  
struct ApiManager{
    let weatherURL="https://api.openweathermap.org/data/2.5/weather?appid=0edefae03625ecebec1cbc76fdf80b07&units=metric"
    
    var delegate:ApiManagerDelegate?
    
    func fetchWeatherByCity(cityname:String)
    {
        let urlString="\(weatherURL)&q=\(cityname)"
//        print(urlString)
        performRequest(urlString: urlString)
    }
    
    
    func performRequest(urlString:String)
    {
      if let url=URL(string: urlString){
            
          let session=URLSession(configuration: .default)
          
          let task=session.dataTask(with: url, completionHandler: handler(data:response:error:))
          
          task.resume()
        }
    }
    func handler(data:Data?, response:URLResponse?,error:Error?)  {
     
        if error != nil {
            print(error!)
            delegate?.didFailWithError(error: error!)
            return 
    }
    
        if let safeData=data{
            
            
            if let weather=self.parseJSON(weatherData: safeData){
                delegate?.didUpdateWeather(weather: weather)}
           

        }
    }

    func parseJSON(weatherData:Data)->MyModel?
    {
        let decoder=JSONDecoder()
        do{
            let decodedData=try decoder.decode(WeatherDataModel.self, from: weatherData)
            
//            print("API CALL "+decodedData.name+" "+decodedData.weather[0].main+" ")
            print(decodedData.main.temp)
            
            let conditionId=decodedData.weather[0].id
            let name=decodedData.name
            let temp=decodedData.main.temp
            
            let weatherFeed=MyModel(conditionId: conditionId, cityName:name, temperature: temp)
          
            return weatherFeed
            
        }
        catch{
            print(error)
            return nil
            
        }
    
    
    
}
    
    

    
    
}

