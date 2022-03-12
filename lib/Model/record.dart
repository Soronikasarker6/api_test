class Result {
  int? total;
  List<Records>? records;

  Result({this.total, this.records});

  Result.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(new Records.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.records != null) {
      data['records'] = this.records!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Records {
  String? id;
  String? startDate;
  String? endDate;
  String? problem;
  String? taskType;
  String? erledigt;
  String? responsiblePersonNr;
  String? activeTask;
  String? responsibleName;
  String? clientName;
  String? moduleName;
  String? probabilityColor;
  bool? isRead;
  String? estTime;
  String? sprintName;
  String? clientId;
  String? moduleId;
  String? typ;
  List<AllDocs>? allDocs;
  int? totalDocs;
  String? kvpid;

  Records(
      {this.id,
        this.startDate,
        this.endDate,
        this.problem,
        this.taskType,
        this.erledigt,
        this.responsiblePersonNr,
        this.activeTask,
        this.responsibleName,
        this.clientName,
        this.moduleName,
        this.probabilityColor,
        this.isRead,
        this.estTime,
        this.sprintName,
        this.clientId,
        this.moduleId,
        this.typ,
        this.allDocs,
        this.totalDocs,
        this.kvpid});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    problem = json['problem'];
    taskType = json['task_type'];
    erledigt = json['erledigt'];
    responsiblePersonNr = json['responsible_person_nr'];
    activeTask = json['active_task'];
    responsibleName = json['responsible_name'];
    clientName = json['client_name'];
    moduleName = json['module_name'];
    probabilityColor = json['probability_color'];
    isRead = json['is_read'];
    estTime = json['est_time'];
    sprintName = json['sprint_name'];
    clientId = json['client_id'];
    moduleId = json['module_id'];
    typ = json['typ'];
    if (json['all_docs'] != null) {
      allDocs = <AllDocs>[];
      json['all_docs'].forEach((v) {
        allDocs!.add(new AllDocs.fromJson(v));
      });
    }
    totalDocs = json['total_docs'];
    kvpid = json['kvpid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['problem'] = this.problem;
    data['task_type'] = this.taskType;
    data['erledigt'] = this.erledigt;
    data['responsible_person_nr'] = this.responsiblePersonNr;
    data['active_task'] = this.activeTask;
    data['responsible_name'] = this.responsibleName;
    data['client_name'] = this.clientName;
    data['module_name'] = this.moduleName;
    data['probability_color'] = this.probabilityColor;
    data['is_read'] = this.isRead;
    data['est_time'] = this.estTime;
    data['sprint_name'] = this.sprintName;
    data['client_id'] = this.clientId;
    data['module_id'] = this.moduleId;
    data['typ'] = this.typ;
    if (this.allDocs != null) {
      data['all_docs'] = this.allDocs!.map((v) => v.toJson()).toList();
    }
    data['total_docs'] = this.totalDocs;
    data['kvpid'] = this.kvpid;
    return data;
  }
}

class AllDocs {
  String? docId;
  String? typ;
  String? taskId;
  String? docOriginalName;
  String? docFileName;
  String? docSize;
  String? docPath;
  String? docExtension;

  AllDocs(
      {this.docId,
        this.typ,
        this.taskId,
        this.docOriginalName,
        this.docFileName,
        this.docSize,
        this.docPath,
        this.docExtension});

  AllDocs.fromJson(Map<String, dynamic> json) {
    docId = json['doc_id'];
    typ = json['typ'];
    taskId = json['task_id'];
    docOriginalName = json['doc_original_name'];
    docFileName = json['doc_file_name'];
    docSize = json['doc_size'];
    docPath = json['doc_path'];
    docExtension = json['doc_extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc_id'] = this.docId;
    data['typ'] = this.typ;
    data['task_id'] = this.taskId;
    data['doc_original_name'] = this.docOriginalName;
    data['doc_file_name'] = this.docFileName;
    data['doc_size'] = this.docSize;
    data['doc_path'] = this.docPath;
    data['doc_extension'] = this.docExtension;
    return data;
  }
}