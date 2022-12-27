//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Виталий Гринчик on 26.12.22.
//

import UIKit

class ResultViewController: UIViewController {

    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
//        navigationController?.dismiss(animated: true)
//    }
}

extension ResultViewController {
    
    private func determineAnimal() -> AnimalType? {
        
        // Prepare initial dictionary
        var animalTypeCount: [AnimalType: Int] = [:]
        for type in AnimalType.allCases {
            animalTypeCount[type] = 0
        }
        
        // Editing elements values in accordance with results
        answersChosen.forEach { answer in
            if let value = animalTypeCount[answer.type] {
                animalTypeCount.updateValue(value + 1, forKey: answer.type)
            }
        }
        
        // Get animal type corresponding to the first max value
        let animal = animalTypeCount.max
        { $0.value < $1.value }?
        .key
        
        return animal
    }
}
