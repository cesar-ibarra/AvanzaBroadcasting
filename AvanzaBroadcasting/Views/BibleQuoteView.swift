//
//  BibleQuoteView.swift
//  AvanzaBroadcasting
//
//  Created by Cesar Ibarra on 2/15/22.
//

import SwiftUI

struct BibleQuoteView: View {
    @State private var quote : Quote?
    var body: some View {
            VStack {
                if let quote = quote {
                    VStack {
                        VStack {
                            Text(quote.shareMessage)
                                .font(.title3)
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 10)
                        }
                        .padding()
                    }
                }
            }.onAppear {
                let quotes = Bundle.main.decode([Quote].self, from: "quotes.json")
                    quote = quotes.randomElement()
            }
    }
}

struct BibleQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        BibleQuoteView()
    }
}
