import '../models/sleep_record_model.dart';
import '../sample_data.dart';

/// In-memory repository for Sleep records.
class SleepRepository {
  SleepRepository() : _records = SampleData.initialSleepRecords();

  final List<SleepRecordModel> _records;

  List<SleepRecordModel> get records => List.unmodifiable(_records);

  void addRecord(SleepRecordModel record) => _records.insert(0, record);

  void deleteRecord(String id) => _records.removeWhere((r) => r.id == id);

  void resetAll() => _records.clear();
}
