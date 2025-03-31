
import 'dart:convert';

ClientProposalListModel clientProposalListModelFromJson(String str) => ClientProposalListModel.fromJson(json.decode(str));


class ClientProposalListModel {
  bool? result;
  String? message;
  Data? data;

  ClientProposalListModel({
    this.result,
    this.message,
    this.data,
  });

  factory ClientProposalListModel.fromJson(Map<String, dynamic> json) => ClientProposalListModel(
    result: json["result"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );
}

class Data {
  List<ClientProposal>? data;
  Pagination? pagination;

  Data({
    this.data,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: json["data"] == null ? [] : List<ClientProposal>.from(json["data"]!.map((x) => ClientProposal.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );
}

class ClientProposal {
  int? id;
  String? invoiceNo;
  String? type;
  int? item;
  int? totalQty;
  int? totalDiscount;
  int? totalTax;
  int? totalCost;
  dynamic orderTaxRate;
  dynamic orderTax;
  int? orderDiscount;
  int? shippingCost;
  int? grandTotal;
  int? paidAmount;
  String? paymentStatus;
  String? note;
  DateTime? createdAt;
  ProposalStatus? status;
  CreatedBy? createdBy;
  Warehouse? warehouse;

  ClientProposal({
    this.id,
    this.invoiceNo,
    this.type,
    this.item,
    this.totalQty,
    this.totalDiscount,
    this.totalTax,
    this.totalCost,
    this.orderTaxRate,
    this.orderTax,
    this.orderDiscount,
    this.shippingCost,
    this.grandTotal,
    this.paidAmount,
    this.paymentStatus,
    this.note,
    this.createdAt,
    this.status,
    this.createdBy,
    this.warehouse,
  });

  factory ClientProposal.fromJson(Map<String, dynamic> json) => ClientProposal(
    id: json["id"],
    invoiceNo: json["invoice_no"],
    type: json["type"],
    item: json["item"],
    totalQty: json["total_qty"],
    totalDiscount: json["total_discount"],
    totalTax: json["total_tax"],
    totalCost: json["total_cost"],
    orderTaxRate: json["order_tax_rate"],
    orderTax: json["order_tax"],
    orderDiscount: json["order_discount"],
    shippingCost: json["shipping_cost"],
    grandTotal: json["grand_total"],
    paidAmount: json["paid_amount"],
    paymentStatus: json["payment_status"],
    note: json["note"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    status: json["status"] == null ? null : ProposalStatus.fromJson(json["status"]),
    createdBy: json["created_by"] == null ? null : CreatedBy.fromJson(json["created_by"]),
    warehouse: json["warehouse"] == null ? null : Warehouse.fromJson(json["warehouse"]),
  );
}

class CreatedBy {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? avatarId;

  CreatedBy({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatarId,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    avatarId: json["avatar_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "avatar_id": avatarId,
  };
}

class ProposalStatus {
  int? id;
  String? name;
  String? statusClass;
  String? colorCode;
  String? translatedName;

  ProposalStatus({
    this.id,
    this.name,
    this.statusClass,
    this.colorCode,
    this.translatedName,
  });

  factory ProposalStatus.fromJson(Map<String, dynamic> json) => ProposalStatus(
    id: json["id"],
    name: json["name"],
    statusClass: json["class"],
    colorCode: json["color_code"],
    translatedName: json["translated_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "class": statusClass,
    "color_code": colorCode,
    "translated_name": translatedName,
  };
}

class Warehouse {
  int? id;
  String? name;

  Warehouse({
    this.id,
    this.name,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Pagination {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    count: json["count"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "total_pages": totalPages,
  };
}
