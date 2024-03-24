//
//  CaculatorView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 05/03/2024.
//

import SwiftUI

struct CaculatorView: View {
    @State var dgnlScore: String = ""
    @State var mathScore: String = ""
    @State var literatureScore: String = ""
    @State var englishScore: String = ""
    @State var thptqgBonus: String = "0"
    @State var dgnlBonus: String = "0"
    var thpgqgTotalScore: Double {
        let math = Double(mathScore) ?? 0
        let literature = Double(literatureScore) ?? 0
        let english = Double(englishScore) ?? 0
        let bonus = Double(thptqgBonus) ?? 0
        
        return math + literature + english + bonus
    }
    var dgnlTotalScore: Int{
        let dgnlScore = Int(dgnlScore) ?? 0
        let dgnlBonus = Int(dgnlBonus) ?? 0
        
        return dgnlBonus + dgnlScore
    }

    @State var showMajorList = false
    @StateObject var viewmodel = CaculatorViewModel()
    var body: some View {
        VStack{
            Text("Máy tính điểm")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("Hãy nhập điểm và chọn ngành mà bạn mong muốn để xem bạn có đủ điểm")
                .font(.system(size: 12))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            VStack(alignment: .leading, spacing: 25){
                HStack{
                    Text("Ngành chọn")
                    Spacer()
                }
                Button{
                    self.showMajorList.toggle()
                }label: {
                    
                    HStack{
                        Text(viewmodel.selectedMajor.name)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(.purple)
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(Color.gray, lineWidth: 3)
                            .frame(height: 50)
                    )
                }
            }
            .padding(.top)
            VStack(alignment: .leading, spacing: 25){
                HStack{
                    Text("Hình thức xét tuyển")
                    Spacer()
                }
                HStack{
                    Picker("Chọn phương thức tuyển sinh", selection: $viewmodel.selectedadmissionMethod) {
                        ForEach(admissionMethodCases.allCases, id: \.self) { method in
                            Text(method.rawValue).tag(method)
                        }
                    }
                    .tint(.purple)
                    Spacer()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(Color.gray, lineWidth: 3)
                        .frame(height: 50)
                )
            }
            .padding(.top)
            
            //Enter Grades part, based on admissionMethod
            if (viewmodel.selectedadmissionMethod == .thptqg){
                VStack(spacing: 25){
                    VStack(alignment: .leading, spacing: 20){
                        Text("Điểm Toán")
                        TextField("", text: $mathScore)
                            .foregroundStyle(.purple)
                        
                            .placeholder(when: mathScore.isEmpty){
                                //                    Text(currentUser.firstname)
                                Text("điểm Toán")
                                
                                    .foregroundStyle(
                                        .linearGradient(
                                            colors: [.purple, .indigo], startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .opacity(0.7)
                            }
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(Color.secondary, lineWidth: 3)
                                    .frame(height: 50)
                            )
                    }
                    //Literature
                    VStack(alignment: .leading, spacing: 20){
                        Text("Điểm Văn")
                        TextField("", text: $literatureScore)
                            .foregroundStyle(.purple)               
                         
                            .placeholder(when: literatureScore.isEmpty){
                                //                    Text(currentUser.firstname)
                                Text("điểm Văn")
    
                                    .foregroundStyle(
                                        .linearGradient(
                                            colors: [.purple, .indigo], startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .opacity(0.7)
                            }
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(Color.secondary, lineWidth: 3)
                                    .frame(height: 50)
                            )
                    }
                    //English
                    VStack(alignment: .leading, spacing: 20){
                        Text("Điểm Tiếng Anh")
                        TextField("", text: $englishScore)
                            .foregroundStyle(.purple)
                            
                            .placeholder(when: englishScore.isEmpty){
                                //                    Text(currentUser.firstname)
                                Text("điểm Tiếng Anh")
    
                                    .foregroundStyle(
                                        .linearGradient(
                                            colors: [.purple, .indigo], startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .opacity(0.7)
                            }
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(Color.secondary, lineWidth: 3)
                                    .frame(height: 50)
                            )
                    }
                    VStack(alignment: .leading, spacing: 20){
                        Text("Điểm cộng (nếu có)")
                        TextField("", text: $thptqgBonus)
                            .foregroundStyle(.purple)
                         
                            .placeholder(when: thptqgBonus.isEmpty){
                                //                    Text(currentUser.firstname)
                                Text("điểm cộng")
    
                                    .foregroundStyle(
                                        .linearGradient(
                                            colors: [.purple, .indigo], startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .opacity(0.7)
                            }
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(Color.secondary, lineWidth: 3)
                                    .frame(height: 50)
                            )
                    }

                }
                .padding(.top)
            }else{
                VStack(spacing: 25){
                    VStack(alignment: .leading, spacing: 20){
                        Text("Điểm Đánh giá năng lực")
                        TextField("", text: $dgnlScore)
                            .foregroundStyle(.purple)
                            .keyboardType(.numberPad)
                            .placeholder(when: dgnlScore.isEmpty){
                                //                    Text(currentUser.firstname)
                                Text("điểm ĐGNL")
    
                                    .foregroundStyle(
                                        .linearGradient(
                                            colors: [.purple, .indigo], startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .opacity(0.7)
                            }
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(Color.secondary, lineWidth: 3)
                                    .frame(height: 50)
                            )
                    }
                    VStack(alignment: .leading, spacing: 20){
                        Text("Điểm cộng nếu có")
                        TextField("", text: $dgnlBonus)
                            .foregroundStyle(.purple)
                            .keyboardType(.decimalPad)
                            .placeholder(when: dgnlBonus.isEmpty){
                                //                    Text(currentUser.firstname)
                                Text("điểm cộng")
    
                                    .foregroundStyle(
                                        .linearGradient(
                                            colors: [.purple, .indigo], startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .opacity(0.7)
                            }
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(Color.secondary, lineWidth: 3)
                                    .frame(height: 50)
                            )
                    }
                }
                .padding(.top)
            }
            
            Button{
                viewmodel.calculateScore(admissionMethodName: viewmodel.selectedadmissionMethod.rawValue, inputScore:  viewmodel.selectedadmissionMethod == .dgnl ? Double(dgnlTotalScore) :thpgqgTotalScore, inputMajor: viewmodel.selectedMajor.name)
            }label: {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.width * 0.15 )
                    .foregroundStyle( 
                        .linearGradient(
                        colors: [.purple, .indigo], startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .overlay(
                    Text("Kiểm tra điểm")
                        .foregroundStyle(.white)
                        .bold()
                    )
            }
            .sheet(isPresented: $viewmodel.showResults){
                ResultsView(yourScore: viewmodel.selectedadmissionMethod == .dgnl ? Double(dgnlTotalScore) : thpgqgTotalScore , isFailedResult: $viewmodel.failedResults, results: viewmodel.Results)
            }
            .padding(.top, 30)
            
            Spacer()
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .padding(.horizontal)
        .sheet(isPresented: $showMajorList){
            SelectMajorView(selectedMajor: $viewmodel.selectedMajor)
        }
    }
        
}

#Preview {
    CaculatorView()
}
