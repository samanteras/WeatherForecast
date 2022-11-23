//
//  ViewController.swift
//  WeatherForecast
//
//  Created by MAC13 on 22.11.2022.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    
    var city = ["Minsk"]
    var veather: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJSONData()
        // Do any additional setup after loading the view.
    }
    
    func getJSONData() {
        guard let file = Bundle.main.path(forResource: "TestTaskJSON", ofType: "json") as String? else {
            return
        }
        guard let jsonString = try? String(contentsOf: URL(fileURLWithPath: file), encoding: String.Encoding.utf8) else {
            return
        }
        
        var weather: Weather?
        
        do {
            weather = try JSONDecoder().decode(Weather.self, from: Data(jsonString.utf8))
        }
        catch {
            print(error)
        }
        
        guard let result = weather else {
            return
        }
        
        print(result.city)
        print(result.description)
     //   print(result.forecast)
        print(result.temperature)
    //    print(result.weatherPerDay)
        
    }
    
    struct Weather: Codable {
        var city: String
        var temperature: String
        var description: String
      //  var weatherPerDay: [String:Any]
     //   var forecast: [String:Any]
        
    }
    
    
}

