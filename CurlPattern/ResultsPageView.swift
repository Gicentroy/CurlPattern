//
//  ResultsView.swift
//  CurlPattern
//
//  Created by Gicentroy Henry III on 2/7/24.
//

import SwiftUI

struct ResultsPageView: View {
    var body: some View {
        VStack{
            let textAgreement: String = "3B hair is a type of curly hair that falls in the middle of the curl type spectrum, between 3A and 3C. It is characterized by tight, springy curls that are about the size of a Sharpie marker. These curls are well-defined and tend to clump together naturally. 3B hair is also known for its volume and bounce."
Divider()
            GroupBox{
                ScrollView(.vertical, showsIndicators: true) {
                    Text(textAgreement)
                        .font(.footnote)
                }.frame(height: 300)
            } label: {
                Label("Test Results", systemImage: "building.columns")
            }
        }
      }
    
    #Preview {
        ResultsView()
        //.environmentObject(Order())
    }
}
