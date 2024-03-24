//
//  ResultsView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 22/03/2024.
//

import SwiftUI

struct ResultsView: View {
    var yourScore: Double
    //pass no School
    @Binding var isFailedResult: Bool
    var results: [CalculatorResponse]
    var result:Int {
        results.count
    }
    @Environment(\.dismiss) var dismiss
    var body: some View {
        if isFailedResult{
            VStack(spacing: 25){
                Text("Điểm bạn chưa đủ để đậu vào trường nào ngành này ⚠️ ")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .foregroundStyle(.purple)
                    .bold()
                Button{
                    dismiss()
                    self.isFailedResult = false
                }label: {
                    Text("Quay Lại")
                        .font(.title)
                        .foregroundStyle(.red)
                }
            }
            .padding(.horizontal)
        }else{
            
            
            VStack{
                Text("Bạn đã đủ điểm để đậu vào \(result) trường 🎉 ")
                    .font(.headline)
                    .foregroundStyle(.purple)
                Text("Điểm của bạn là \(yourScore)")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                VStack(spacing: 25){
                    ForEach(results, id: \.id){ result in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(result.university.first!)
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                
                                // Abbreviation with bold "code" style
                                Text("Điểm đậu \(result.schoolYear) : ")
                                    .fontWeight(.light)
                                + Text(String(result.AdmissionScore))
                                    .fontWeight(.bold)
                                
                                Text("Số học sinh chỉ tiêu: ")
                                    .fontWeight(.light)
                                +  Text(String(result.NumberOfStudent))
                            }
                            .fontDesign(.rounded)
                            Spacer()
                            
                        }
                        .padding(.all, 20)
                        //        .padding(.horizontal)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(LinearGradient(
                                    colors: [.purple, .indigo],
                                    startPoint: .top,
                                    endPoint: .bottom
                                ), lineWidth: 4)
                            
                        )
                    }
                }.padding(.horizontal)
                    .padding(.top)
                Spacer()
            }.padding(.top)
        }
    }
    }


//#Preview {
//    ResultsView()
//}
