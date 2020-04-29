class Todo {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Todo(this._title, this._priority, this._date, [this._description]);
  Todo.witId(this._id, this._title, this._priority, this._date,
      [this._description]);

  int get id => _id;
  int get priority => _priority;

  String get title => _title;
  String get description => _description;
  String get date => _date;

  set title(String newT) {
    if (newT.length <= 255) {
      _title = newT;
    }
  }

  set description(String newDesc) {
    if (newDesc.length <= 255) {
      _description = newDesc;
    }
  }

  set priority(int newPriority) {
    if (newPriority > 0 && newPriority <= 3) {
      _priority = newPriority;
    }
  }

  set date(String newDate) {
    _date = newDate;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    map["date"] = _date;
    map["priority"] = _priority;
    if (_id != null) {
      map["id"] = _id;
    }

    return map;
  }

  Todo.fromObject(dynamic obj) {
    this._id = obj["id"];
    this._title = obj["title"];
    this._description = obj["description"];
    this._date = obj["date"];
    this._priority = obj["priority"];
  }
}
