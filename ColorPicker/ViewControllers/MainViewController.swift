//
//  MainViewController.swift
//  ColorPicker
//
//  Created by Steven Kirke on 21.08.2020.
//  Copyright © 2020 Steven Kirke. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
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

        changeColorView(red: redLabel.value, green: greenLabel.value, blue: blueLabel.value)
        
        showIndicatorValue(red: redLabel.value, green: greenLabel.value, blue: blueLabel.value)
    }
    
    // MARK: IB Actions
    @IBAction func redAction() {
        changeColor()
    }
    
    @IBAction func greenAction() {
        changeColor()
    }
    
    @IBAction func blueAction() {
        changeColor()
    }
    
}

// MARK: Add functional
extension MainViewController {
    
    private func changeColorView(red: Float, green: Float, blue: Float) {

        colorScreenView.backgroundColor = UIColor(displayP3Red: CGFloat(red),
                                                  green: CGFloat(green),
                                                  blue: CGFloat(blue),
                                                  alpha: 1.0)

    }

    private func showIndicatorValue(red: Float, green: Float, blue: Float) {
        
        redIndicatorLabel.text = "\((red * 100).rounded() / 100)"
        greenIndicatorLabel.text = "\((green * 100).rounded() / 100)"
        blueIndicatorLabel.text = "\((blue * 100).rounded() / 100)"
        
    }

    private func changeColor() {
        
        changeColorView(red: redLabel.value, green: greenLabel.value, blue: blueLabel.value)
        showIndicatorValue(red: redLabel.value, green: greenLabel.value, blue: blueLabel.value)
    }
}
