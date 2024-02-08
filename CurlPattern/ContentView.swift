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
    @State private var isPresentingResultsView = false
    @State var done = false
    var body: some View {
        ZStack{
            Image("Background")
            //This whill shift all this shit around
            VStack{ //controls "Hair Type Survery!"
                Text("Hair Type Survey!")
                    .font(.largeTitle)
                    .fontWeight(.black)
                //.lineLimit(1)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.all)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("2F1000")/*@END_MENU_TOKEN@*/)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                    Divider()
                    //.position(x:270, y:250)
                //This will shift all this shit around
        // unwrap the optional
                if let selectedQuestion = questionsViewModel.selectedQuestion {
            VStack{
                if done{
                    ResultsView()
                }else{
//                    Spacer()
//                        .frame(width: 1.0, height: 260.469)
                    Text(selectedQuestion.question) //Controls question
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom, .trailing], 30)
                        .font(.system(size: 19))
                        .frame(maxWidth: 425)
                    ForEach(selectedQuestion.options, id: \.self) { option in
                        //                    Button(option) {
                        // assign the option to the `selectedOption` of our `selectedQuestion`
                        // call the `update` function for our questionsViewModel and pass in this `selectedQuestion`
                        Button {
                            if questionsViewModel.index < questionsViewModel.questions.count - 1{
                                questionsViewModel.update()
                            }else {
                                done = true
                            }
                        } label: {
                            //Controls options under question
                            Text(option)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("2F1000"), lineWidth: 2)
                                            //.fill(/*@START_MENU_TOKEN@*/Color("2F1000")/*@END_MENU_TOKEN@*/
                                            )
                                .padding(.all)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("2F1000")/*@END_MENU_TOKEN@*/)
                                //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                            
                    }
//                        Spacer() //(Controls options under question)
//                            .frame(width: 1.0, height: 22)
                        
                    }
                }
            }
            
        }
                   }
            //.position(x:200, y:100)
            //This will shift all this shit around
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
struct ResultsView: View {
    @State private var isSecondViewActive = false
    var body: some View {
        //NavigationStack{ ZStack{ Needed if using Tabs/Going to another view
        VStack {
            // Button that navigates to a different view
            Button("Results") {
                isSecondViewActive = true
            }
            .sheet(isPresented: $isSecondViewActive) {
                ResultsPageView()
            }
        }
    }
    struct SheetView: View {
        @Binding var isSheetPresented: Bool
        
        var body: some View {
            VStack {
                Text("Sheet Content")
                Button(action: {
                    isSheetPresented.toggle()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .font(.title)
                }
            }
            //.padding()
        }
    }
    #Preview {
        ContentView()
    }
}
