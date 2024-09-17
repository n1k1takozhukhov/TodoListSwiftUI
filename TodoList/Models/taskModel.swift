import Foundation

struct TaskModel: Identifiable ,Codable{
    let id:String = UUID().uuidString
    let title:String
    let isCompleted:Bool
    
    func updateTaskCompletion()-> TaskModel{
        return TaskModel(title:title,isCompleted: !isCompleted)
    }
}

