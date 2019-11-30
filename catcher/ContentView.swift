import SwiftUI

struct ContentView: View {
    
    @State var player = Player()
    
    @State var food = [Item]()
    @State var bomb = [Item]()
    
    
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
                    ForEach(self.food, id: \.id) { item in
                        Circle()
                            .frame(width: item.radius * 2, height: item.radius * 2)
                            .foregroundColor(Color.blue)
                            .position(item.pos)
                    }
                    
                    // bomb
                    ForEach(self.bomb, id: \.id) { item in
                        Rectangle()
                            .frame(width: item.radius * 2, height: item.radius * 2)
                            .foregroundColor(Color.red)
                            .position(item.pos)
                    }
                    
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
            .onAppear{
                self.player.pos = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
                self.player.target = self.player.pos
                
                for _ in 1...3{
                    self.food.append(.spawn(within: geometry))
                }
                
                for _ in 1...5{
                    self.bomb.append(.spawn(within: geometry))
                }
            }
        }
    }
}

struct Player : GameElement{
    var pos = CGPoint(x:0,y:0)
    var target = CGPoint(x:0,y:0)
    var radius = CGFloat(20.0)
    
}
struct Item : GameElement, Equatable{
    var id = UUID()
    var pos = CGPoint(x:0,y:0)
    var radius = CGFloat(5.0)
    
    static func spawn(within : GeometryProxy) -> Item{
        var f = Item()
        f.pos.x = CGFloat.random(in: 0..<within.size.width)
        f.pos.y = CGFloat.random(in: 0..<within.size.height)
        return f
    }
    
}

protocol GameElement  {
    var pos: CGPoint { get }
    var radius: CGFloat { get }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
