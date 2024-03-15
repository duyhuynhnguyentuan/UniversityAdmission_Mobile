//
//  CaculatorView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 05/03/2024.
//

import SwiftUI

struct CaculatorView: View {
    
    
    var body: some View {
        VStack{
            Text("Máy tính điểm")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("Hãy nhập điểm và chọn ngành mà bạn mong muốn để xem bạn có đủ điểm")
                .font(.system(size: 12))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            Spacer()
           
        
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    CaculatorView()
}
