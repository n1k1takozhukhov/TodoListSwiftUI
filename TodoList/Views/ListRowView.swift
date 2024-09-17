import SwiftUI

struct ListRowView: View {
    let task: TaskModel
    
    var body: some View {
        HStack {
            Image(task.isCompleted ? "checkmark" : "disturb")
                .resizable()
                .frame(width: 30, height: 30)
            
            Text(task.title)
                .font(.headline)
        }
    }
}

#Preview {
    Group {
        ListRowView(task: TaskModel(title: "task 1", isCompleted: true))
        ListRowView(task: TaskModel(title: "task 2", isCompleted: false))
    }
    .previewLayout(.sizeThatFits)
}
