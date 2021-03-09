//
//  ContentView.swift
//  FurnitureFeedUI
//
//  Created by Tung Vu Duc on 09/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView()
    }
}

struct MainView: View {
    @State var index = 0
    
    var body: some View {
        VStack {
            Home()
            
            HStack {
                Spacer()
                
                Button(action: {
                    withAnimation(.spring()) {
                        index = 0
                    }
                }, label: {
                    Image(systemName: "house")
                    
                    if index == 0 {
                        Text("HOME")
                            .fontWeight(.medium)
                    }
                })
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .shadow(color: index == 0 ? Color.black.opacity(0.05) : .clear, radius: 5, x: 0, y: 0)
                
                Spacer()
                
                Button(action: {
                    withAnimation(.spring()) {
                        index = 1
                    }
                }, label: {
                    Image(systemName: "cart")
                    if index == 1 {
                        Text("CART")
                            .fontWeight(.medium)
                    }
                })
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .shadow(color: index == 1 ? Color.black.opacity(0.05) : .clear, radius: 5, x: 0, y: 0)
                
                Spacer()
                
                Button(action: {
                    withAnimation(.spring()) {
                        index = 2
                    }
                }, label: {
                    Image(systemName: "person")
                    if index == 2 {
                        Text("PROFILE")
                            .fontWeight(.medium)
                    }
                })
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .shadow(color: index == 2 ? Color.black.opacity(0.05) : .clear, radius: 5, x: 0, y: 0)
                
                Spacer()
            }
            .foregroundColor(Color("dark"))
        }
    }
}

struct Home: View {
    @State var selected = "ALL"
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "rectangle.3.offgrid")
                        .font(.system(size: 22))
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 22))
                })
            }
            .padding(.horizontal)
            .foregroundColor(Color("dark"))
            
            HStack {
                Text("Categories")
                    .fontWeight(.bold)
                    .font(.system(size: 27))
                    .foregroundColor(Color("dark"))
                
                Spacer()
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 25) {
                    ForEach(menu, id:\.self) { item in
                        Button(action: {selected = item}, label: {
                            VStack {
                                Text(item)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                                    .foregroundColor(selected == item ? Color("dark") : Color.gray)
                                    .frame(width:estimateWidth(of: item, font: .systemFont(ofSize: 15)))
                                
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color("dark"))
                                    .opacity(selected == item ? 1 : 0)
                                    .frame(width:estimateWidth(of: item, font: .systemFont(ofSize: 15)))
                            }
                        })
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 25) {
                    ForEach(1...6, id:\.self) { _ in
                        GeometryReader { proxy in
                            let minX = proxy.frame(in: .global).minX
                            let offset = 1 - (minX - 16) / 251 * 0.1
                            let cal = offset > 1 ? 1 - (offset - 1) : offset
                            ProductView()
                                .scaleEffect(cal)
                                .offset(y: -(1 - cal)*340 / 2)
                        }
                        .frame(width: 210, height: 340)
                    }
                }.padding(.horizontal)
            }
            
            HStack {
                Text("Trending Items")
                    .fontWeight(.bold)
                    .font(.system(size: 27))
                    .foregroundColor(Color("dark"))
                
                Spacer()
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(1...5, id: \.self) { _ in
                        TrendingView()
                    }
                }
            }
            
            Spacer()
        }
    }
    
    private func estimateWidth(of input: String, font: UIFont) -> CGFloat {
        return input.width(widthHeight: 25, font: font) + 5
    }
}

struct TrendingView: View {
    var body: some View {
        HStack(spacing: 10) {
            Image("green-chair")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 141)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("Turquoise Chair")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                    
                    Spacer(minLength: 40)
                    
                    Button(action: {}, label: {
                        Image(systemName: "suit.heart")
                    })
                }
                .foregroundColor(Color("dark"))
                
                Text("Category Name")
                    .font(.system(size: 12))
                    .fontWeight(.light)
                
                HStack {
                    HStack {
                        Image(systemName: "eye.fill")
                        
                        Text("1.5K")
                    }
                    
                    HStack {
                        Image(systemName: "heart.fill")
                        
                        Text("200")
                    }
                    
                    HStack {
                        Image(systemName: "cart.fill")
                        
                        Text("120")
                    }
                }
                .padding(.top, 5)
                
                HStack {
                    Text("145 USD")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.yellow)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.purple)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("mintgreen"))
                    }
                }
                .padding(.top, 10)
                .frame(maxWidth: .infinity)
            }
            .foregroundColor(Color("dark").opacity(0.43))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .padding(.leading)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
        .padding(.vertical, 5)
    }
}

struct ProductView: View {
    var body: some View {
        ZStack {
            Image("red-chair")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 149, height: 191)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 25, y: 5)
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("Category Name")
                            .font(.system(size: 10))
                            .fontWeight(.light)
                        
                        Text("RED CHAIR")
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                    })
                    
                    Spacer()
                    
                    Image(systemName: "suit.heart")
                }
                .foregroundColor(Color.white)
                
                Spacer()
                
                HStack(alignment: .bottom) {
                    VStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("black"))
                        
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("red"))
                        
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.white)
                    }
                    
                    Spacer()
                    
                    Text("350 USD")
                        .font(.system(size: 12))
                        .padding(10)
                        .background(Color.black.opacity(0.26))
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
            }
        }
        .padding(12)
        .background(Color("gray"))
        .cornerRadius(15)
    }
}

// calculate width base on content
extension String {
    func width(widthHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingRect = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingRect.width)
    }
}

let menu = ["ALL", "Living Room", "Bedroom", "Bathroom", "Kitchen"]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
