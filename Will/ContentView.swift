//
//  ContentView.swift
//  Will
//
//  Created by Raphael Cerqueira on 25/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var isVisible = true
    
    var body: some View {
        ZStack {
            BackgroundShape()
                .ignoresSafeArea(.all, edges: .top)
                .foregroundColor(Color("yellow"))
            
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 20) {
                    HeaderView(isVisible: $isVisible)
                        .padding(.horizontal)
                    
                    AccountView(isVisible: $isVisible)
                        .frame(height: 150)
                        .padding(.horizontal)
                    
                    CardView(isVisible: $isVisible)
                        .padding(20)
                        .background(Color("cardBackground"))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    CardStatusView()
                        .padding(20)
                        .background(Color("cardBackground"))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    InviteView()
                        .padding(20)
                        .background(Color("cardBackground"))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    PollView()
                        .background(Color("cardBackground"))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    Spacer()
                }
            })
        }
    }
}

struct PollView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Está curtindo o app?")
                    .font(.system(size: 21, weight: .bold))
                
                Text("Clique aqui para me contar como está sendo sua experiência. Sua opinião é essencial!")
                    .font(.system(size: 19))
            }
            .foregroundColor(Color.black.opacity(0.7))
            .padding(20)
            
            Spacer()
            
            VStack {
                Spacer()
                
                Image("image2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140)
            }
        }
    }
}

struct InviteView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Convidar amigos")
                    .font(.system(size: 21, weight: .bold))
                
                Text("Chame todo mundo para ser will também.")
                    .font(.system(size: 19))
                    .padding(.top, 40)
            }
            .foregroundColor(Color.black.opacity(0.7))
            
            Spacer()
            
            Image("image1")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct CardStatusView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Gerenciar cartões")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.gray)
            }
            
            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    
                    Text("Virtual")
                    
                    Text("Liberado para compras")
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                HStack(spacing: 12) {
                    Image(systemName: "envelope.fill")
                        
                    Text("Físico")
                    
                    Text("Acompanhe a entrega")
                        .fontWeight(.bold)
                    
                    Spacer()
                }
            }
            .foregroundColor(.black.opacity(0.7))
            .padding(.top, 40)
        }
    }
}

struct CardView: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        HStack {
            Text("Limite disponível no cartão")
                .foregroundColor(.gray)
                .fontWeight(.bold)
            
            Spacer()
            
            Text(isVisible ? "R$ 2.250,00" : "R$ •••••••••")
                .font(.system(size: 19))
                .fontWeight(.bold)
            
            Image(systemName: "chevron.right")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.gray)
        }
    }
}

struct AccountView: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        HStack(spacing: 15) {
            Button(action: {}, label: {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)
                    .overlay(
                        VStack {
                            HStack {
                                Text("Conta Digital")
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                            .foregroundColor(.gray.opacity(0.7))
                            
                            Spacer()
                            
                            Text("Em breve uma conta completa pra você.")
                                .foregroundColor(.black.opacity(0.7))
                        }
                        .padding(12)
                        
                    )
            })
            
            Button(action: {}, label: {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)
                    .overlay(
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Cartão de crédito")
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                            .foregroundColor(.black.opacity(0.7))
                            
                            Spacer()
                            
                            Text("Fatura aberta")
                                .foregroundColor(.black.opacity(0.7))
                            
                            Text(isVisible ? "R$ 0,00" : "R$ ••••••")
                                .foregroundColor(.black)
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("Fecha em 04/06")
                                .foregroundColor(.green)
                        }
                        .padding(12)
                    )
            })
        }
    }
}

struct HeaderView: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 70, height: 70)
                .foregroundColor(.white)
            
            VStack(alignment: .leading) {
                Text("olá, Raphael!")
                    .font(.title)
                    .fontWeight(.bold)
                
                Button(action: {}, label: {
                    Text("Ver perfil")
                        .font(.system(size: 23))
                        .foregroundColor(.black)
                })
            }
            .padding(.leading)
            
            Spacer()
            
            Button(action: {
                isVisible.toggle()
            }, label: {
                Image(systemName: isVisible ? "eye.fill" : "eye.slash.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .foregroundColor(.black)
            })
        }
    }
}

struct BackgroundShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.midY), control: CGPoint(x: rect.midX, y: rect.maxY * 0.6))
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
