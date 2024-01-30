//
//  ContentView.swift
//  CurlPattern
//
//  Created by Gicentroy Henry III on 1/25/24.
//
//new stuff//
import SwiftUI
//@State var question = QuestionModel(question: "How often do you wash your hair", options: ["Once a week", "2-3 times a week", "twice a week"])
struct QuestionView: View {
    // pass in the index as a binding `@Binding` var index: Int
    @StateObject var questionsViewModel = QuestionsViewModel()

    var body: some View {
        // unwrap the optional
        if var selectedQuestion = questionsViewModel.selectedQuestion {
            VStack{
                Text(selectedQuestion.question)
                ForEach(selectedQuestion.options, id: \.self) { option in
                    Button(option) {
                        questionsViewModel                        // assign the option to the `selectedOption` of our `selectedQuestion`
                    // call the `update` function for our questionsViewModel and pass in this `selectedQuestion`
                    }
                }
                Text(selectedQuestion.selectedOptions ?? "no option selected")
            }
            // show something if `questionsViewModel.selectedQuestion` is nil
        } else {
            EmptyView()
        }
    }
}

struct QuestionModel {
    var question: String
    var options: [String]
    var selectedOptions: String?
    
    mutating func select(option: String) {
        self.selectedOptions = option
    }
}
struct ContentView: View {
    // store all the questions in your contentview
    // track the current question. maybe track the current index.
    
    var body: some View {
        QuestionView()
    }
}

#Preview {
    ContentView()
}
