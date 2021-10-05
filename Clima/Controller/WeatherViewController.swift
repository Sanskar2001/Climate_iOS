//
//  ViewController.swift
//  Clima
//
//

import UIKit

class WeatherViewController: UIViewController,UITextViewDelegate, UITextFieldDelegate,ApiManagerDelegate{

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var apiManager=ApiManager()
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        
        apiManager.delegate=self
        searchTextField.delegate=self
           }

    @IBAction func searchPressed(_ sender: Any) {
      
        print(searchTextField.text!)
        apiManager.fetchWeatherByCity(cityname: searchTextField.text!)
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        print(searchTextField.text!)
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }
        else{
            textField.placeholder="Type Something"
            return false
        }
            
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text=""
    }
    func didUpdateWeather(weather: MyModel) {
        print("INSIDE VIEW CONTROLLER")
        
        DispatchQueue.main.async {
            self.temperatureLabel.text=String(weather.temperature)
            self.cityLabel.text=weather.cityName
            self.conditionImageView.image=UIImage(systemName:weather.getCondition(weatherId: weather.conditionId))
            
        }
    }
    func didFailWithError(error:Error)
    {
        print(error)
    }
}

