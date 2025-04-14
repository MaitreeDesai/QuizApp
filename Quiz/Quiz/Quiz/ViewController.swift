//
//  ViewController.swift
//  Quiz
//
//  Created by bmiit on 30/12/24.
//

import UIKit

class ViewController: UIViewController,AddQuestionDelegate {
    
    
    

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!

    var questions: [String] = [
        "What is 7+7?",
        "What is the capital of India?",
        "What is cognac made from?"
    ]
    var answers: [String] = [
        "14",
        "Delhi",
        "Grapes"
    ]

    var usedIndexes: Set<Int> = [] // To track used question indexes
    var currentQuestionIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        displayRandomQuestion()
    }

    @IBAction func nextQue(_ sender: Any) {
        displayRandomQuestion()
    }

    @IBAction func showAns(_ sender: Any) {
        if let currentIndex = currentQuestionIndex {
            let answer = answers[currentIndex]
            answerLabel.text = answer
        }
    }

    private func displayRandomQuestion() {
        if usedIndexes.count == questions.count {
            // Reset used questions if all have been displayed
            usedIndexes.removeAll()
        }

        var randomIndex: Int
        repeat {
            randomIndex = Int.random(in: 0..<questions.count)
        } while usedIndexes.contains(randomIndex)

        // Track the used index
        usedIndexes.insert(randomIndex)
        currentQuestionIndex = randomIndex

        // Update the UI
        questionLabel.text = questions[randomIndex]
        answerLabel.text = "???"
    }
    
    @IBAction func addQuestionTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let addQuestionVC = storyboard.instantiateViewController(withIdentifier: "AddQuestionViewController") as? AddQuestionViewController else {
            return
        }
        addQuestionVC.delegate = self
        present(addQuestionVC, animated: true, completion: nil)
    }
    
    func didAddQuestion(question: String, answer: String) {
        questions.append(question)
        answers.append(answer)
        usedIndexes.removeAll()
    }
}

