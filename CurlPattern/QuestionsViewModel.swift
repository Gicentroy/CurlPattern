//
//  QuestionsViewModel.swift
//  CurlPattern
//
//  Created by Gicentroy Henry III on 1/30/24.
//

import Foundation

class QuestionsViewModel: ObservableObject {
    @Published var index = 0 // increment after you answer each question
    @Published var questions: [QuestionModel] = [
        QuestionModel(question: "How often do you need to wash your hair?", options: ["Once a week", "2-3 times a week", "Once a month ", "Every couple of days"]),
        QuestionModel(question: "What is your main hair concern?", options: ["Dryness", "Breakage", "Oily hair ", "Shrinkage"]),
        QuestionModel(question: "How long does your hair need to dry?", options: ["A couple hours ", "All Day", "No Time at All"]),
        QuestionModel(question: "Which word would you use to describe your curl pattern?", options: ["A couple hours ", "All Day", "No Time at All"]),
        QuestionModel(question: "On a scale of 1-4 how frizzy is your hair? (4 being most frizzy)", options: [" 1", "2 ", "3 ", "4"]),
        QuestionModel(question: "How thick is your hair?", options: ["Thickkkkkkkkkk", "Medium", "Skinny"]),
        QuestionModel(question: "What is the shape of your hair strand?", options: ["straight", "wavy", " curls", "coils"]),
        QuestionModel(question: "If you brush your hair while it's dry?", options: ["It detangles", "t makes my hair frizzy", "It gets flat then puffs up", "I only detangle when wet"]),
        QuestionModel(question: "How does your hair react to product?", options: ["Greasy", "Heavy", "Hydrated"]),
        QuestionModel(question: "What best describes your hair?", options: ["Kinky", "Curls", "Coils", "Straight"]),
    ]
    
    @Published var selectedQuestion: QuestionModel?
    
    /// updates the `questions` array with a question that has an updated `selectedAnswer`
    /// - Parameter question: the questionmodel with an updated answer
    func update(     ) {
//questions[index] = answeredQuestion
        index += 1
        selectedQuestion = questions[index]
        //print("cur i: \(self.index) -- arr len: \(self.questions.count)")
    }
    init() {
        selectedQuestion = questions[0]
    }
    
}
//
