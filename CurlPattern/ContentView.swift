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
        ZStack{ //background
            Color(._2_F_1000)
                .ignoresSafeArea()
            VStack{ //controls "Hair Type Survery!"
                ZStack{
                    RoundedRectangle(cornerRadius:20)
                        .fill(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.1))
                        .stroke(Color.white, lineWidth:1)
                        .frame(width: 386.015, height: 80)
                        .position(x:180, y:100)
                    Text("Hair Type Survey!")
                        .position(x:180, y:100)
                        .foregroundColor(.white)
                        .font(.system(size: 50, weight: .thin, design: .default))
                       // .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("2F1000")/*@END_MENU_TOKEN@*/)
                }
                .padding(.all)
                //This will shift all this shit around
        // unwrap the optional
                if let selectedQuestion = questionsViewModel.selectedQuestion {
            VStack{
                if done{
                    ResultsView()
                }else{

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
                            ZStack{
                                Text(option)
                                        RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.white, lineWidth:1)
                                            //.background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.1))
                                            .padding(.all, 5.0)
                            }
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
            ZStack{
                // Button that navigates to a different view
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .stroke(Color.white, lineWidth:4)
                    .frame(width: 300.0, height: 80)
                .position(x:190, y:100)}
            //ZStack{
                Button("Results")
                    //.position(x:190, y:100)
            //}
                {
                    isSecondViewActive = true
                }
                .sheet(isPresented: $isSecondViewActive) {
                    ResultsPageView()
              //  }
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
}
    #Preview {
        ContentView()
    }

