//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Виталий Гринчик on 26.12.22.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}
