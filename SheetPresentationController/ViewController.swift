//
//  ViewController.swift
//  SheetPresentationController
//
//  Created by Toomas Vahter on 06.11.2021.
//

import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemBlue
    }
    
    @IBAction func openSheet(_ sender: Any) {
        let sheetViewController = SheetViewController()
        if let sheetController = sheetViewController.sheetPresentationController {
            sheetController.detents = [.medium(), .large()]
            sheetController.preferredCornerRadius = 4
            sheetController.prefersGrabberVisible = true
        }
        present(sheetViewController, animated: true, completion: nil)
    }
}

final class SheetViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
        
        var configuration1 = UIButton.Configuration.filled()
        configuration1.title = "Resize to Medium"
        let button1 = UIButton(configuration: configuration1, primaryAction: UIAction(handler: { [weak self] _ in
            self?.sheetPresentationController?.animateChanges {
                self?.sheetPresentationController?.selectedDetentIdentifier = .medium
            }
        }))
        var configuration2 = UIButton.Configuration.filled()
        configuration2.title = "Resize to Large"
        let button2 = UIButton(configuration: configuration2, primaryAction: UIAction(handler: { [weak self] _ in
            self?.sheetPresentationController?.animateChanges {
                self?.sheetPresentationController?.selectedDetentIdentifier = .large
            }
        }))
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button1)
        view.addSubview(button2)
        NSLayoutConstraint.activate([
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 16),
        ])
    }
}

