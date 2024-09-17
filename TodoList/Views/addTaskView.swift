import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var TaskField: String = ""
    @State var alertContent: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type your Task ...", text: $TaskField)
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(Color(hue: 0.958, saturation: 0.0, brightness: 0.912))
                    .cornerRadius(10)
                
                Button(
                    action: handleSaveClick,
                    label: {
                        Text("SAVE")
                            .frame(height: 60)
                            .frame(maxWidth: .infinity)
                            .font(.headline)
                            .foregroundColor(.white)
                            .background(.green)
                            .cornerRadius(10)
                    }
                )
            }
            .padding(12)
        }
        .navigationTitle("Add Tasks ✏️")
        .alert(isPresented: $showAlert, content: setAlert)
    }
    
    func handleSaveClick() {
        if listViewModel.textChek(text: TaskField) {
            listViewModel.addTask(title: TaskField)
            presentationMode.wrappedValue.dismiss()
        } else {
            alertContent = "Your task must be at least 3 characters 🥲"
            showAlert.toggle()
        }
    }
    
    func setAlert() -> Alert {
        return Alert(title: Text(alertContent))
    }
}

#Preview {
    NavigationView {
        AddTaskView()
            .environmentObject(ListViewModel())
    }
}
