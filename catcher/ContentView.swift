import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack{
                HStack{
                    Spacer()
                    Text("\(10)")
                        .foregroundColor(Color.blue)
                        .font(.largeTitle)
                    Spacer()
                    
                }
                .edgesIgnoringSafeArea(.all)
                .offset(x: 0, y: 60)
                
                ZStack{
                    // food
                    Circle()
                        .frame(width: 5 * 2, height: 5 * 2)
                        .foregroundColor(Color.blue)
                        .position(x: 200, y: 200)
                    
                    // bomb
                    Rectangle()
                        .frame(width: 5 * 2, height: 5 * 2)
                        .foregroundColor(Color.red)
                        .position(x: 100, y: 100)
                    
                    // player
                    Circle()
                        .frame(width: 20 * 2, height: 20 * 2)
                        .foregroundColor(Color.blue)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    
                }
                .padding()
                .edgesIgnoringSafeArea(.all)
                
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
