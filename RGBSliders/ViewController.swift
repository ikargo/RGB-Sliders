//
//  ViewController.swift
//  RGBSliders
//
//  Created by planB on 9/2/17.
//  Copyright © 2017 Ioannis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorSquare: UIView!
    
    @IBAction func updateBackgroundColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        colorSquare.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        let defaults = UserDefaults.standard
        defaults.set(redSlider.value, forKey:"red")
        defaults.set(greenSlider.value, forKey:"green")
        defaults.set(blueSlider.value, forKey:"blue")
        defaults.synchronize()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "openColor"){
            let newViewController = segue.destination
            newViewController.view.backgroundColor = colorSquare.backgroundColor
            //segue.destination.view.backgroundColor = colorSquare.backgroundColor
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateBackgroundColor()
        
        colorSquare.layer.borderColor = UIColor.black.cgColor
        colorSquare.layer.borderWidth = 1
        
        let defaults = UserDefaults.standard
        redSlider.value = defaults.float(forKey:"red")
        greenSlider.value = defaults.float(forKey: "green")
        blueSlider.value = defaults.float(forKey: "blue")
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
