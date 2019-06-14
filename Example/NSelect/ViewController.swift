//
//  ViewController.swift
//  NSelect
//
//  Created by fitsyu on 06/12/2019.
//  Copyright (c) 2019 fitsyu. All rights reserved.
//

import UIKit
import NSelect

class ViewController: UIViewController {
    
    @IBOutlet weak var singleQuestionView: DefaultNSelectView!
    @IBOutlet weak var multiQuestionView: DefaultNSelectView!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let singleQuestion: NSelect = NSelect(options: "Red", "Green", "Blue")
        singleQuestion.title = "What color we are allowed to go?"
        singleQuestion.mode  = .single
        
        singleQuestionView.backing = singleQuestion
        singleQuestionView.delegate = self
        singleQuestionView.present()
        
        button.addTarget(self, action: #selector(self.printSelections), for: .touchUpInside)
        
        
        let multiQuestion = NSelect(options: "Fun", "Comfy", "Noisy", "Hectic")
        multiQuestion.title = "Ideal workplace for you"
        multiQuestion.mode = .multiple
        multiQuestion.defaultSelections = ["Fun"]
        
        multiQuestionView.backing = multiQuestion
        multiQuestionView.delegate = self
        multiQuestionView.present()
    }

    
    @objc func printSelections() {
        let list = singleQuestionView.backing.selections()
        let text = list?.joined(separator: ", ") ?? "No selections"
        label.text = text
    }
}

extension ViewController: NSelectViewDelegate {
    
    func didSelect(_ view: NSelectView, item: String) {
        print(item, "selected")
    }
    
    func didDeselect(_ view: NSelectView, item: String) {
        print(item, "deselected")
    }
}

