//
//  ViewController.swift
//  ControlledPractice
//
//  Created by Sergey Lukaschuk on 28.04.2021.
//

import UIKit

class ViewController: UIViewController {
        
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        rotateSwitches()
    }
    
    
    // MARK: - Update UI
    /// Update all outlet
    func updateUI() {
        counterButton.setTitle("\(number)", for: .normal)
        updateSwitchFromNumber()
        mySlider.value = Float(number)
    }
    
    
    // MARK: - Counter
    @IBOutlet weak var counterButton: UIButton!
    
    var number: Int = 128 {
        didSet {
            if number < 0 {
                number = 255
            } else if number > 255 {
                number = 0
            }
            updateUI()
        }
    }
    
    @IBAction func pressCounterButton(_ sender: UIButton) {
        number += 1
    }
    
    
    // MARK: - Switch
    @IBOutlet var switches: [UISwitch]!
    
    @IBAction func pressSwitch(_ sender: UISwitch) {
        updateNumberFromSwitch(in: sender)
    }
    
    /// Rotate the switches 90 degrees
    func rotateSwitches() {
        for value in switches {
            value.layer.transform = CATransform3DRotate(value.layer.transform, -.pi / 2, 0, 0, 1)
        }
    }
    
    func updateNumberFromSwitch(in curentSwich: UISwitch) {
        if !curentSwich.isOn {
            number = number - curentSwich.tag
        } else {
            number = number + curentSwich.tag
        }
    }
    
    func updateSwitchFromNumber() {
        for curentSwich in switches {
            curentSwich.isOn = Int(number) & curentSwich.tag != 0
        }
    }
    
    
    // MARK: - Slider
    @IBOutlet weak var mySlider: UISlider!
    
    @IBAction func moveSlider(_ sender: UISlider) {
        number = Int(sender.value)
    }
    
    
    // MARK: - Gesture
    @IBAction func screenTapping(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        if location.x < view.bounds.midX {
              number -= 1
        } else {
              number += 1
        }
    }
}

