import Buffer "mo:base/Buffer";
import Nat "mo:base/Nat";
import Bool "mo:base/Bool";
import Iter "mo:base/Iter";
import Array "mo:base/Array";


actor ToDo {
  var tasks = Buffer.Buffer<(Text, Bool)>(0);

  // Add Task
  public func addTask(task : Text) {
    tasks.add((task, false));
  };

  // Mark Task as completed
  public func markTaskCompleted(index : Nat) {
    if (index  < tasks.size()) {
      let (task, _) = tasks.get(index);
      tasks.put(index, (task, true));
    };
  };

  // Delete task
  public func deleteTask(index : Nat) {
    if (index < tasks.size()) {
      ignore tasks.remove(index);
    };
  };

  // Get Completed Tasks
  public query func getCompletedTasks() : async [(Text, Bool)] {
    let allTasks = Iter.toArray(tasks.vals());
    return Array.filter<(Text, Bool)>(allTasks, func(task) { task.1 == true });  
  }

}