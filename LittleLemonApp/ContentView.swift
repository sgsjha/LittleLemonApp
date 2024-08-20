//
//  ContentView.swift
//  LittleLemonApp
//
//  Created by Sarthak Jha on 06/08/2024.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseAuth
import FirebaseCore

struct Task: Identifiable, Codable {
    var id: String
    var name: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, name: String, isCompleted: Bool = false) {
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
    }
}

struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var newTaskName: String = ""
    private var databaseRef: DatabaseReference = Database.database().reference().child("tasks")
    
    var body: some View {
        NavigationView {
            VStack {
                // Input field to add a new task
                HStack {
                    TextField("Enter new task", text: $newTaskName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        addTask(name: newTaskName)
                        newTaskName = ""
                    }) {
                        Text("Add Task")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }.padding()
                
                // List of tasks
                List {
                    ForEach(tasks) { task in
                        HStack {
                            Text(task.name)
                            Spacer()
                            Button(action: {
                                updateTask(task)
                            }) {
                                Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                    .onDelete(perform: deleteTask)
                }
            }
            .navigationTitle("Tasks")
            .onAppear {
                observeTasks()
            }
        }
    }
    
    // MARK: Firebase Operations
    
    private func addTask(name: String) {
        let task = Task(name: name)
        let taskRef = databaseRef.child(task.id)
        taskRef.setValue(["name": task.name, "isCompleted": task.isCompleted])
    }
    
    private func observeTasks() {
        databaseRef.observe(.value) { snapshot in
            var newTasks: [Task] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let value = snapshot.value as? [String: AnyObject],
                   let name = value["name"] as? String,
                   let isCompleted = value["isCompleted"] as? Bool {
                    let task = Task(id: snapshot.key, name: name, isCompleted: isCompleted)
                    newTasks.append(task)
                }
            }
            tasks = newTasks
        }
    }
    
    private func updateTask(_ task: Task) {
        let taskRef = databaseRef.child(task.id)
        taskRef.updateChildValues(["isCompleted": !task.isCompleted])
    }
    
    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = tasks[index]
            let taskRef = databaseRef.child(task.id)
            taskRef.removeValue()
        }
        tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




#Preview {
    ContentView()
}
