import Buffer "mo:base/Buffer";

actor ToDo {
  var tasks = Buffer.Buffer<(Text, Bool)>(0);

  // Add Task
  public func addTask(task : Text) {
    tasks.add((task, false));
  };

}