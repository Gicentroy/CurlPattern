//
//  ResultsView.swift
//  CurlPattern
//
//  Created by Gicentroy Henry III on 2/7/24.
//

import SwiftUI

struct ResultsPageView: View {
    var body: some View {
        TabView{
            ResultsView()
                .tabItem {
                    Label( "Survey", systemImage: "list.dash")
                }
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
    
//    struct SecondView: View {
//        var body: some View {
//            Text("Second View")
//        }
//    }
    
    #Preview {
        ResultsView()
        //.environmentObject(Order())
    }
}
