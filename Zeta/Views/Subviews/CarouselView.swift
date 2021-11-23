//
//  CarouselView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/22/21.
//

import SwiftUI

struct CarouselView: View {
    @State var selection: Int = 1
    @State var timerAdded: Bool = false
    let maxCount: Int = 8
    
    var body: some View {
        TabView(selection: $selection,
                content:  {
                    ForEach(1..<maxCount) { count in
                        Image("soccer\(count)")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: 300)
                            .clipShape(Rectangle())
                            .overlay(Rectangle().stroke(Color.MyTheme.goldColor, lineWidth: 5))
                            .tag(count)
                    }
                })
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 300)
            .animation(.default)
            .onAppear {
                if !timerAdded {
                    addTimer()
                }
            }
    }
    
    // MARK: FUNCTIONS
    func addTimer() {
        timerAdded = true
        
        let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { (timer) in
            if selection == maxCount - 1 {
                selection = 1
            } else {
                selection = selection + 1
            }
        }
        
        timer.fire()
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
            .previewLayout(.sizeThatFits)
    }
}
