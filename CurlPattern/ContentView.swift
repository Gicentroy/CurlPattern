//
//  ContentView.swift
//  CurlPattern
//
//  Created by Gicentroy Henry III on 1/25/24.
//

import SwiftUI

struct QuestionView: View {
    
    @State var question = QuestionModel(question: "How often do you wash your hair", options: ["1 week", "1 day", "twice a week"])
    
    var body: some View {
        Text(question.question)
        ForEach(question.options, id: \.self) { option in
            Button(option) {
                question.select(option: option )
            }
        }
        Text(question.selectedOptions ?? "no option selected")
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
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    QuestionView()
}
