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
    }
    
    
    
    // MARK: - Update UI
    /// Update all outlet
    func updateUI() {
        counterButton.setTitle("\(number)", for: .normal)
        
        // TODO: set switchers to number
        
        mySlider.value = Float(number)
        myTextField.text = String(number)
    }
    
    
    
    // MARK: - Button Action
    @IBAction func pressCounterButton(_ sender: UIButton) {
        if number == 255 {
            number = 0
        } else  {
            number += 1
        }
    }
    
    
    
    // MARK: - Switch Action
    @IBAction func pressSwitch(_ sender: UISwitch) {
    }
    
    
    // MARK: - Slider Action
    @IBAction func moveSlider(_ sender: UISlider) {
        number = UInt8(sender.value)
    }
    
    
    
    // MARK: - Text Field Action
    
    @IBAction func editorTextField(_ sender: UITextField) {
        
    }
    
    
}

