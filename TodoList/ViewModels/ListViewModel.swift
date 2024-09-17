import Foundation

class ListViewModel: ObservableObject {
   
    @Published var tasks:[TaskModel] = [] {
        didSet{
            saveTasks()
        }
    }
    var tasksKey:String="tasks_list"
    
    init(){
        getTasks()
    }
    
    func getTasks(){
        guard let data=UserDefaults.standard.data(forKey:tasksKey),
              let decoded  = try? JSONDecoder().decode([TaskModel].self,from:data)
        else {return}
        self.tasks=decoded
     
    
    }
    
    func deleteTask(indexSet: IndexSet){
        tasks.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet,to: Int){
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func addTask(title:String){
        let newTask = TaskModel(title:title,isCompleted: false)
        tasks.append(newTask)
    }
    
    func textChek(text:String)->Bool{
        text.count < 3 ? false:true
    }

    func updateTask(task:TaskModel){
        if let index=tasks.firstIndex(where: { $0.id==task.id }){
            tasks[index]=task.updateTaskCompletion()
        }
    }

    func saveTasks(){
        if let endcoded = try? JSONEncoder().encode(tasks){
            UserDefaults.standard.set(endcoded,forKey: tasksKey)
        }
    }    
}
