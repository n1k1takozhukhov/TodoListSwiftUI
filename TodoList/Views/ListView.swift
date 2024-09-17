import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.tasks.isEmpty {
                NoTasksView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.tasks) { task in
                        ListRowView(task: task)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    listViewModel.updateTask(task: task)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteTask)
                    .onMove(perform: listViewModel.moveTask)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Tasks 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddTaskView())
        )
    }
}

#Preview {
    NavigationView {
        ListView()
            .environmentObject(ListViewModel())
    }
}
