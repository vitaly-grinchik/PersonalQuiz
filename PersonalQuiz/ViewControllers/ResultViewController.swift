//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Виталий Гринчик on 26.12.22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultDescriptionLabel.numberOfLines = 4
        updateUI()
    }
    
    private func updateUI() {
        if let animalEmoji = determineAnimal()?.rawValue {
            resultLabel.text = "Вы - " + String(animalEmoji)
        }
        let resultDescription = determineAnimal()?.definition
        
        resultDescriptionLabel.text = resultDescription ?? ""
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

extension ResultViewController {
    
    private func determineAnimal() -> Animal? {
        
        var animalTypeCount: [Animal: Int] = [:]

        // Filling in empty dictionary
        answersChosen.forEach { answer in
            if let value = animalTypeCount[answer.type] {
                animalTypeCount.updateValue(value + 1, forKey: answer.type)
            } else {
                animalTypeCount[answer.type] = 1
            }
        }
        
        // Get animal type corresponding to its max value
        let animal = animalTypeCount.max
        { $0.value < $1.value }?
        .key
        
        return animal
    }
}
