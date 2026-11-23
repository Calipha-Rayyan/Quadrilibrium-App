import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme_tokens.dart';
import '../../../core/utils/input_validators.dart';
import '../../../data/sample_data.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_header.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';

/// Screen 33 — Add Thought Card preserving all 3 required fields:
/// Stressful Thought, Thinking Trap, and Realistic Counter-Statement.
class AddThoughtCardScreen extends StatefulWidget {
  const AddThoughtCardScreen({super.key});

  @override
  State<AddThoughtCardScreen> createState() => _AddThoughtCardScreenState();
}

class _AddThoughtCardScreenState extends State<AddThoughtCardScreen> {
  final _formKey = GlobalKey<FormState>();
  final _thoughtController = TextEditingController();
  final _counterController = TextEditingController();
  String _selectedTrap = SampleData.thinkingTraps.first;

  @override
  void dispose() {
    _thoughtController.dispose();
    _counterController.dispose();
    super.dispose();
  }

  void _save() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    AppStateScope.of(context).mentalWellbeing.addThoughtCard(
      stressfulThought: _thoughtController.text,
      thinkingTrap: _selectedTrap,
      counterStatement: _counterController.text,
    );
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Thought card saved.')));
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return AuroraScaffold(
      auroraColor: AppColors.mentalWellbeing,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppHeader(
                title: 'Add Thought Card',
                subtitle: 'Reframe what\'s weighing on you',
                titleColor: AppColors.mentalWellbeing,
              ),
              const SizedBox(height: 22),
              AppTextField(
                label: 'Stressful Thought',
                controller: _thoughtController,
                hintText: 'I will fail this exam',
                maxLines: 3,
                validator: (v) => InputValidators.requiredField(
                  v,
                  label: 'Stressful thought',
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Thinking Trap',
                style: Theme.of(context).textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: SampleData.thinkingTraps.map((trap) {
                  final selected = trap == _selectedTrap;
                  return ChoiceChip(
                    label: Text(trap),
                    selected: selected,
                    showCheckmark: true,
                    checkmarkColor: AppColors.mentalWellbeing,
                    selectedColor: AppColors.mentalWellbeing.withValues(
                      alpha: 0.2,
                    ),
                    backgroundColor: AppColors.surfaceCard,
                    side: BorderSide(
                      color: selected
                          ? AppColors.mentalWellbeing
                          : AppColors.border,
                    ),
                    labelStyle: TextStyle(
                      color: selected
                          ? AppColors.mentalWellbeing
                          : AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                    onSelected: (_) => setState(() => _selectedTrap = trap),
                  );
                }).toList(),
              ),
              const SizedBox(height: 18),
              AppTextField(
                label: 'Realistic Counter-Statement',
                controller: _counterController,
                hintText: 'I have prepared and can handle each question one at a time.',
                maxLines: 4,
                validator: (v) => InputValidators.requiredField(
                  v,
                  label: 'Realistic counter-statement',
                ),
              ),
              const SizedBox(height: 26),
              PrimaryButton(
                label: 'Save',
                backgroundColor: AppColors.mentalWellbeing,
                onPressed: _save,
              ),
              const SizedBox(height: 12),
              SecondaryButton(label: 'Cancel', onPressed: () => context.pop()),
            ],
          ),
        ),
      ),
    );
  }
}
