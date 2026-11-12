

class GroceryItem {
  String _uid = "";
  String _itemName = "";
  int _quantity = 0;

  GroceryItem(this._uid, this._itemName, this._quantity);
  GroceryItem.empty() {
    _uid = "";
    _itemName = "";
    _quantity = 0;
  }

  GroceryItem.defFromJsonDbObject(Map<String, dynamic> jsonObject, String firebaseUid) {
    uid = firebaseUid;
    itemName = jsonObject["item_name"] ?? "";
    quantity = jsonObject["quantity"] ?? 0;
  }

  set uid(String value) => _uid = value;
  set itemName(String value) => _itemName = value;
  set quantity(int quantity) => _quantity = quantity;

  String get uid => _uid;
  String get itemName => _itemName;
  int get quantity => _quantity;
}