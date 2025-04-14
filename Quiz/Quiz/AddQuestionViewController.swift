//
//  AddQuestionViewController.swift
//  Quiz
//
//  Created by bmiit on 27/01/25.
//

import UIKit


protocol AddQuestionDelegate: AnyObject {
    func didAddQuestion(question: String, answer: String)
}

class AddQuestionViewController: UIViewController {

    
    @IBOutlet weak var questionTextField: UITextField!
    
    
    @IBOutlet weak var answerTextField: UITextField!
    
    weak var delegate: AddQuestionDelegate?
    
    
    @IBAction func submitTapped(_ sender: UIButton) {
        
        guard let question = questionTextField.text, !question.isEmpty else {
            showError(message: "Please Enter a Valid Question")
            return
        }
        
        guard let answer = answerTextField.text, !answer.isEmpty else {
            showError(message: "Please enter a valid answer.")
            return
        }
        
        delegate?.didAddQuestion(question: question, answer: answer)
        dismiss(animated: true, completion: nil)
        
    }

    private func showError(message: String){
        let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
