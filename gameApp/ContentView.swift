//
//  ContentView.swift
//  gameApp
//
//  Created by Wesley Patterson on 3/7/22.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🤽🏼", "🤸🏻‍♂️", "⛹🏽‍♂️", "🧘🏻","🏄🏻‍♀️","⛹🏼‍♀️","a","b","c","d","e","f","g","h","i","j","k"]
    
    @State var emojiCount = 16
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(
                    .adaptive(minimum: 100, maximum: 100))])
                {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView( content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }//H1
            }
            
            .foregroundColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
        }//V
        .padding(.horizontal)
        
    } // body
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View {
    Button {
        if emojiCount < emojis.count {
            emojiCount += 1
            }
        }
           label: {
        Image(systemName: "plus.circle")
    }
   }
} //ContentView




struct CardView: View {
    
    var content: String
    @State var faceUp: Bool = true
    
    var body: some View {
        ZStack {
            
            let shape = RoundedRectangle(cornerRadius: 25)
            
            if faceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                    
                Text(content)
                    .font(.largeTitle)
            }
            else {
                shape.fill().foregroundColor(.gray)
            }
        } //Z
        .onTapGesture {
            faceUp = !faceUp
        }
    }//body
}//CardView





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
        ContentView()
            .preferredColorScheme(.light)
        
    }
}

