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


