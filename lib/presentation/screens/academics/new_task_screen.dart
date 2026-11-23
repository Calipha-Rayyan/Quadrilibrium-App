import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/theme_tokens.dart';
import '../../../core/utils/date_time_utils.dart';
import '../../../core/utils/input_validators.dart';
import '../../../data/models/task_model.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_header.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';

/// Screen 13 — New Task form.
class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _deadlineController = TextEditingController(
    text: DateTimeUtils.formatShortDate(
      DateTime.now().add(const Duration(days: 3)),
      includeYear: true,
    ),
  );
  final _durationController = TextEditingController(text: '30');
  TaskType _selectedType = TaskType.quiz;

  @override
  void dispose() {
    _titleController.dispose();
    _deadlineController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  Future<void> _pickDeadline() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 3)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _deadlineController.text = DateTimeUtils.formatShortDate(
          picked,
          includeYear: true,
        );
      });
    }
  }

  void _save() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final minutes = int.tryParse(_durationController.text.trim()) ?? 30;
    AppStateScope.of(context).academics.addTask(
      title: _titleController.text,
      type: _selectedType,
      deadlineLabel: _deadlineController.text,
      durationMinutes: minutes > 0 ? minutes : 30,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Task added to your schedule.')),
    );
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return AuroraScaffold(
      auroraColor: AppColors.academics,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppHeader(
                title: 'New Task',
                subtitle: 'Add to your schedule',
                titleColor: AppColors.academics,
              ),
              const SizedBox(height: 22),
              AppTextField(
                label: 'Task name',
                controller: _titleController,
                hintText: 'DSA Quiz 3',
                validator: (v) =>
                    InputValidators.requiredField(v, label: 'Task name'),
              ),
              const SizedBox(height: 18),
              Text(
                'Task type',
                style: Theme.of(context).textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: TaskType.values.map((type) {
                  final selected = type == _selectedType;
                  return ChoiceChip(
                    label: Text(type.label),
                    selected: selected,
                    showCheckmark: true,
                    checkmarkColor: AppColors.academics,
                    selectedColor: AppColors.academics.withValues(alpha: 0.2),
                    backgroundColor: AppColors.surfaceCard,
                    side: BorderSide(
                      color: selected ? AppColors.academics : AppColors.border,
                    ),
                    labelStyle: TextStyle(
                      color: selected
                          ? AppColors.academics
                          : AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                    onSelected: (_) => setState(() => _selectedType = type),
                  );
                }).toList(),
              ),
              const SizedBox(height: 18),
              AppTextField(
                label: 'Deadline',
                controller: _deadlineController,
                readOnly: true,
                onTap: _pickDeadline,
                suffixIcon: const Icon(
                  LucideIcons.calendar,
                  size: 18,
                  color: AppColors.textSecondary,
                ),
                validator: (v) =>
                    InputValidators.requiredField(v, label: 'Deadline'),
              ),
              const SizedBox(height: 18),
              AppTextField(
                label: 'Duration in minutes (optional)',
                controller: _durationController,
                hintText: '30',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 28),
              PrimaryButton(
                label: 'Save',
                backgroundColor: AppColors.academics,
                onPressed: _save,
              ),
              const SizedBox(height: 12),
              SecondaryButton(label: 'Discard', onPressed: () => context.pop()),
            ],
          ),
        ),
      ),
    );
  }
}
