//
//  SecondViewController.swift
//  staj
//
//  Created by Isa Melsov on 7/3/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let label = UILabel()
    
    var selectedStatus: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        configLabel()

    }
    

    private func configLabel() {
        if let selectedStatus = selectedStatus {
            label.text = selectedStatus
        }
        if label.text == "Alive" {
            label.textColor = .green
        } else if label.text == "Dead" {
            label.textColor = .red
        } else {
            label.textColor = .blue
        }
    }
}
