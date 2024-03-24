//
//  UniSearchDetailView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 04/03/2024.
//

import SwiftUI

struct UniSearchDetailView: View {
    var University: University
    var body: some View {
        ScrollView{
            VStack(spacing: 12){
                Image(systemName: "info.circle")
                    .scaleEffect(4)
                    .symbolEffect(.pulse.wholeSymbol)
                    .foregroundStyle(.purple)
                    .padding(.vertical, 35)
                VStack(alignment:.leading, spacing: 10){
                    Text("Tên: ")
                        .fontWeight(.thin)
                    +  Text(University.name)
                        .foregroundStyle(.primary)
                    HStack{
                        Text("Cơ sở: ")
                            .fontWeight(.thin)
                        if((University.province?.count) == 1){
                            Text(University.province?.first?.province ?? "")
                                .foregroundStyle(.primary)
                        }else{
                            ForEach(University.province ?? []) { province in
                                Text(province.province)
                                    .foregroundStyle(.primary)
                            }
                        }
                    }
                    Text("Viết tắt: ")
                        .fontWeight(.thin)
                    +  Text(University.abbreviation)
                        .foregroundStyle(.primary)
                    Text("Mã trường: ")
                        .fontWeight(.thin)
                    +  Text(University.code)
                        .foregroundStyle(.primary)
                    Text("Năm thành lập: ")
                        .fontWeight(.thin)
                    +  Text(String(University.yearEstablish))
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading){
                        Text("Mô tả: ")
                            .fontWeight(.thin)
                        Text(University.description)
                            .foregroundStyle(.primary)
                            .lineLimit(nil)
                    }
                    Text("Chính sách tuyển sinh: ")
                        .fontWeight(.thin)
                    +  Text(University.admissionPolicy)
                        .foregroundStyle(.primary)
                    Text("Địa chỉ: ")
                        .fontWeight(.thin)
                    +  Text(University.address)
                        .foregroundStyle(.primary)
                    Text("Liên hệ: ")
                        .fontWeight(.thin)
                    +  Text(University.contactInfo)
                        .foregroundStyle(.primary)
                    
                    
                }
                Spacer()
                Divider()
                Text("Kế hoạch tuyển sinh các năm:")
                    .bold()
                    .foregroundStyle(.purple)
                ForEach(University.admissionPlan ?? [AdmissionPlan(_id: "chua", planDescription: "", schoolYear: ["2023", "2024"])]) { plan in
                    HStack{
                        Text("- \(plan.planDescription)")
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }.padding(.all)
        }
    }
}

#Preview {
    UniversitySearchView()
}
