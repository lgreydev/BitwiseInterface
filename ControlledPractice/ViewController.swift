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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Methods
    @IBAction func pressCounterButton(_ sender: UIButton) {
        
    }
    
    @IBAction func pressSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func moveSlider(_ sender: UISlider) {
    }
    
    @IBAction func editorTextField(_ sender: UITextField) {
    }
    
    
}

