import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme_tokens.dart';
import '../../../core/utils/input_validators.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_header.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';

/// Screen 18 — Add Subject form.
class AddSubjectScreen extends StatefulWidget {
  const AddSubjectScreen({super.key});

  @override
  State<AddSubjectScreen> createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _save() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    AppStateScope.of(context).academics.addSubject(
      name: _nameController.text,
      description: _descController.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Subject "${_nameController.text.trim()}" created.'),
      ),
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
                title: 'Add Subject',
                subtitle: 'Create a new deck',
                titleColor: AppColors.academics,
              ),
              const SizedBox(height: 24),
              AppTextField(
                label: 'Subject name',
                controller: _nameController,
                hintText: 'Theory of Automata',
                validator: (v) =>
                    InputValidators.requiredField(v, label: 'Subject name'),
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'Short description (optional)',
                controller: _descController,
                hintText: 'Regular languages, DFAs and grammars',
                maxLines: 4,
              ),
              const SizedBox(height: 28),
              PrimaryButton(
                label: 'Save',
                backgroundColor: AppColors.academics,
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
