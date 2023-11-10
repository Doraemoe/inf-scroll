import SwiftUI

struct ContentView: View {
    @State var titles = [String]()
    
    let columns = [
        GridItem(.adaptive(minimum: 160), spacing: 20, alignment: .top)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(titles, id: \.self) { title in
                    ChildView(title: title)
                        .onAppear {
                            if title == titles.last {
                                let randomInt = Int.random(in: 0..<100)
                                let result = (titles.count...titles.count+randomInt)
                                    .map { value in
                                        String(value)
                                    }
                                titles.append(contentsOf: result)
                            }
                        }
                }
            }
        }
        .onAppear {
            let randomInt = Int.random(in: 0..<100)
            let result = (titles.count...titles.count+randomInt)
                .map { value in
                    String(value)
                }
            titles.append(contentsOf: result)
        }
    }
}

