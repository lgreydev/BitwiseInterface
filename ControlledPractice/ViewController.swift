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
    
    var number: UInt8 = 128 {
        didSet {
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
        if number == 255 {
            number = 0
        } else  {
            number += 1
        }
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
            number = number - UInt8(curentSwich.tag)
        } else {
            number = number + UInt8(curentSwich.tag)
        }
    }
    
    func updateSwitchFromNumber() {
        for curentSwich in switches {
            curentSwich.isOn = Int(number) & curentSwich.tag != 0
        }
    }
    
    
    // MARK: - Slider
    @IBAction func moveSlider(_ sender: UISlider) {
        number = UInt8(sender.value)
    }
    
    
    
    // MARK: - Field Action
    
    @IBAction func editorTextField(_ sender: UITextField) {
        
    }
    
    
}

