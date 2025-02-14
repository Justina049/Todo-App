import Buffer "mo:base/Buffer";
import Nat "mo:base/Nat";

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

  // Delete tasksk
  public func deleteTask(index : Nat) {
    if (index < tasks.size()) {
      ignore tasks.remove(index);
    };
  };

}