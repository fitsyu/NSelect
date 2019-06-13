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
    
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let singleQuestion: NSelect = NSelect(options: "Red", "Green", "Blue")
        singleQuestion.title = "What color we are allowed to go?"
        
        singleQuestionView.backing = singleQuestion
        singleQuestionView.delegate = self
//        singleQuestionView.present()
        
        button.addTarget(self, action: #selector(self.printSelections), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        singleQuestionView.present()
    }
    
    @objc func printSelections() {
        print(singleQuestionView.backing.selections() ?? "no selections")
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

