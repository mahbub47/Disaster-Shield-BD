import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChecklistController extends GetxController {
  static ChecklistController get instance => Get.find();
  final GetStorage box = GetStorage(); // Access GetStorage
  var checklist = <Map<String, dynamic>>[].obs; // Observable list of checklist items

  final List<Map<String, dynamic>> defaultItems = [
    {'title': 'First Aid Kit', 'isChecked': false},
    {'title': 'Flashlight with Extra Batteries', 'isChecked': false},
    {'title': 'Bottled Water (At least 3 days\' supply)', 'isChecked': false},
    {'title': 'Non-Perishable Food (Canned Goods, Energy Bars)', 'isChecked': false},
    {'title': 'Emergency Contacts List', 'isChecked': false},
    {'title': 'Multi-tool or Swiss Army Knife', 'isChecked': false},
    {'title': 'Portable Phone Charger (Power Bank)', 'isChecked': false},
    {'title': 'Whistle (For Signaling Help)', 'isChecked': false},
    {'title': 'Face Masks (N95 or Surgical Masks)', 'isChecked': false},
    {'title': 'Raincoat or Poncho', 'isChecked': false},
    {'title': 'Emergency Blanket or Sleeping Bag', 'isChecked': false},
    {'title': 'Local Maps (Physical Copy)', 'isChecked': false},
    {'title': 'Cash (Small Bills and Coins)', 'isChecked': false},
    {'title': 'Medications (7-Day Supply)', 'isChecked': false},
    {'title': 'Personal Identification Documents', 'isChecked': false},
    {'title': 'Fire Extinguisher', 'isChecked': false},
    {'title': 'Duct Tape and Plastic Sheeting', 'isChecked': false},
    {'title': 'Hygiene Supplies (Toothbrush, Toothpaste, Soap)', 'isChecked': false},
    {'title': 'Tissues or Wet Wipes', 'isChecked': false},
    {'title': 'Radio (Battery-Powered or Hand-Crank)', 'isChecked': false},
  ];

  @override
  void onInit() {
    super.onInit();
    loadChecklist(); // Load checklist when the controller is initialized
  }

  // Load checklist from local storage
  void loadChecklist() {
    final data = box.read<List>('emergencyChecklist');
    if (data == null) {
      // If no data exists, use default items
      checklist.value = defaultItems;
      saveChecklist(); // Save default items to local storage
    } else {
      checklist.value = data.map((item) => Map<String, dynamic>.from(item)).toList();
    }
  }

  // Save checklist to local storage
  void saveChecklist() {
    box.write('emergencyChecklist', checklist);
  }

  // Add a new item
  void addChecklistItem(String title) {
    checklist.add({'title': title, 'isChecked': false});
    saveChecklist();
  }

  // Toggle an item's checked status
  void toggleChecklistItem(int index) {
    checklist[index]['isChecked'] = !checklist[index]['isChecked'];
    checklist.refresh(); // Notify observers
    saveChecklist();
  }

  // Remove an item
  void removeChecklistItem(int index) {
    checklist.removeAt(index);
    saveChecklist();
  }

  // Reset checklist to default items
  void resetChecklistToDefault() {
    checklist.value = defaultItems; // Reset the in-memory list
    saveChecklist(); // Overwrite local storage with default items
    Get.snackbar('Checklist Reset', 'Checklist has been reset to default.');
  }

}
