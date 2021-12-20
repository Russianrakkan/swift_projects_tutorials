//
//  ViewController.swift
//  TConverter
//
//  Created by Андрей Дуров on 07.12.2021.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var celciusLabel: UILabel!
    @IBOutlet weak var fahrenheitLabel: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!{
        didSet{
            sliderOutlet.maximumValue = 100
            sliderOutlet.minimumValue = 0
            sliderOutlet.value = 0
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let temperatureCalsius = Int(round(sender.value))
        celciusLabel.text = "\(temperatureCalsius)ºC"
        let fahrenheitTemperature = Int(round((sender.value * 9 / 5) + 32))
        fahrenheitLabel.text = "\(fahrenheitTemperature)ºF"
    }
    
}

