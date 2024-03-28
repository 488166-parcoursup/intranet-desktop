//
//  SupplyFormView.swift
//  Intranet
//
//  Created by Léo Lesimple on 28/05/2023.
//

import SwiftUI
import SQLite

struct SupplyFormView: SwiftUI.View {
    @State private var customer: String = ""
    @State private var ar: String = ""
    @State private var title: String = ""
    @State private var user: String = ""
    @State private var delay: String = ""
    @State private var comments: String = ""
    @State private var status: String = ""
    @State private var isPresented: Bool = false

    var body: some SwiftUI.View {
        VStack(spacing: 20) {
            TextField("Customer", text: $customer)
                .textFieldStyle(CustomTextFieldStyle())

            TextField("AR", text: $ar)
                .textFieldStyle(CustomTextFieldStyle())

            TextField("Title", text: $title)
                .textFieldStyle(CustomTextFieldStyle())

            TextField("User", text: $user)
                .textFieldStyle(CustomTextFieldStyle())

            TextField("Delay", text: $delay)
                .textFieldStyle(CustomTextFieldStyle())

            TextField("Comments", text: $comments)
                .textFieldStyle(CustomTextFieldStyle())

            TextField("Status", text: $status)
                .textFieldStyle(CustomTextFieldStyle())

            Button(action: {
                isPresented.toggle()
            }) {
                Text("Save")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .sheet(isPresented: $isPresented) {
            SupplyFormDetailView(customer: customer, ar: ar, title: title, user: user, delay: delay, comments: comments, status: status)
        }
    }
}

struct SupplyFormDetailView: SwiftUI.View {
    var customer: String
    var ar: String
    var title: String
    var user: String
    var delay: String
    var comments: String
    var status: String

    var body: some SwiftUI.View {
        VStack {
            Text("Customer: \(customer)")
            Text("AR: \(ar)")
            Text("Title: \(title)")
            Text("User: \(user)")
            Text("Delay: \(delay)")
            Text("Comments: \(comments)")
            Text("Status: \(status)")
        }
        .padding()
        .navigationTitle("Form Details")
    }
}

struct CustomTextFieldStyle: SwiftUI.TextFieldStyle {
    func _body(configuration: SwiftUI.TextField<Self._Label>) -> some SwiftUI.View {
        configuration
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color("gray"))
            )
            .foregroundColor(.primary)
            .font(.body)
    }
}

struct SupplyFormView_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        SupplyFormView()
    }
}
