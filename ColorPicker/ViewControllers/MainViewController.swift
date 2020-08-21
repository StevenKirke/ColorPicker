//
//  MainViewController.swift
//  ColorPicker
//
//  Created by Steven Kirke on 21.08.2020.
//  Copyright © 2020 Steven Kirke. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var redColor: Float = 0.0
    private var greenColor: Float = 0.0
    private var blueColor: Float = 0.0
    
    enum CurrentColor {
        case red, green, blue
    }
    
    // MARK: IB Outlets
    @IBOutlet weak var colorScreenView: UIView!
    
    @IBOutlet weak var redIndicatorLabel: UILabel!
    @IBOutlet weak var greenIndicatorLabel: UILabel!
    @IBOutlet weak var blueIndicatorLabel: UILabel!
    
    @IBOutlet weak var redLabel: UISlider!
    @IBOutlet weak var greenLabel: UISlider!
    @IBOutlet weak var blueLabel: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorScreenView.layer.cornerRadius = 10
        
        redColor = redLabel.value
        greenColor = greenLabel.value
        blueColor = blueLabel.value
        
        changeColorView(red: redColor, green: greenColor, blue: blueColor)
    }
    
    // MARK: IB Actions
    @IBAction func redAction() {
        changeColorAndValue(channelColor: .red, valueColor: redLabel.value)
    }
    
    @IBAction func greenAction() {
        changeColorAndValue(channelColor: .green, valueColor: greenLabel.value)
    }
    
    @IBAction func blueAction() {
        changeColorAndValue(channelColor: .blue, valueColor: blueLabel.value)
    }
    
}


extension MainViewController {
    
    private func changeColorView(red: Float, green: Float, blue: Float) {
        
        colorScreenView.backgroundColor = UIColor(displayP3Red: CGFloat(red),
                                                  green: CGFloat(green),
                                                  blue: CGFloat(blue),
                                                  alpha: 1.0)
        
        redIndicatorLabel.text = trimVariable(value: red)
        greenIndicatorLabel.text = trimVariable(value: green)
        blueIndicatorLabel.text = trimVariable(value: blue)
    }
    
    private func trimVariable(value: Float) -> String {
        return String((value * 100).rounded() / 100)
    }
    
    private func changeColorAndValue(channelColor: CurrentColor, valueColor: Float) {
        
        switch channelColor {
        case .red:
            redColor = valueColor
            break
        case .green:
            greenColor = valueColor
            break
        case .blue:
            blueColor = valueColor
            break
        }
        
        changeColorView(red: redColor, green: greenColor, blue: blueColor)
    }
}
