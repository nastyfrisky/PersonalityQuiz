//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Анастасия Ступникова on 19.01.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        animalSearch()
    }
    
    private func animalSearch() {
        let userAnimal = answers.map { $0.animal }.reduce(into: [:]) {
            counts, animal in counts[animal, default: 0] += 1
        }.max { $0.value > $1.value }?.key ?? .dog
        
        emojiLabel.text = "Вы - \(userAnimal.rawValue)"
        descriptionLabel.text = userAnimal.definition
    }
}
