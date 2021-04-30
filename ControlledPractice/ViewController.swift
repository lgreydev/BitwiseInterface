//
//  ViewController.swift
//  ControlledPractice
//
//  Created by Sergey Lukaschuk on 28.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Property
    @IBOutlet weak var counterButton: UIButton!
    @IBOutlet var switches: [UISwitch]!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myTextField: UITextField!
    
    var number: Int = 128 {
        didSet {
            
            if number < 0 {
                number = 0
            } else if number > 255 {
                number = 255
            }
            
//            number = number < 0 ? 0 : number
//            number = number > 255 ? 255 : number
            updateUI()
        }
    }
    
    
    
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
        myTextField.text = String(number)
    }
    
    
    
    // MARK: - Button
    @IBAction func pressCounterButton(_ sender: UIButton) {
//        if number == 255 {
//            number = 0
//        } else  {
//            number += 1
//        }
    }
    
    
    
    // MARK: - Switch
    @IBAction func pressSwitch(_ sender: UISwitch) {
        updateNumberFromSwitch(in: sender)
    }
    
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
    @IBAction func moveSlider(_ sender: UISlider) {
        number = Int(sender.value)
    }
    
    
    
    // MARK: - Field Action
    @IBAction func editorTextField(_ sender: UITextField) {
        
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

