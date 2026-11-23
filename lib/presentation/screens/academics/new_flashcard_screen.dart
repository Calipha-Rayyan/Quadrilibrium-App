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

/// Screen 20 — New Flashcard form.
class NewFlashcardScreen extends StatefulWidget {
  const NewFlashcardScreen({super.key, required this.subjectId});

  final String subjectId;

  @override
  State<NewFlashcardScreen> createState() => _NewFlashcardScreenState();
}

class _NewFlashcardScreenState extends State<NewFlashcardScreen> {
  final _formKey = GlobalKey<FormState>();
  final _termController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void dispose() {
    _termController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _save() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    AppStateScope.of(context).academics.addFlashcard(
      subjectId: widget.subjectId,
      term: _termController.text,
      description: _descController.text,
    );
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Flashcard added to deck.')));
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final subject = AppStateScope.of(context).academics
        .subjectById(widget.subjectId);

    return AuroraScaffold(
      auroraColor: AppColors.academics,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(
                title: 'New Flashcard',
                subtitle: 'Add to ${subject?.name ?? 'subject'}',
                titleColor: AppColors.academics,
              ),
              const SizedBox(height: 24),
              AppTextField(
                label: 'Term (front)',
                controller: _termController,
                hintText: 'Binary Search Tree',
                validator: (v) =>
                    InputValidators.requiredField(v, label: 'Term'),
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'Description (back)',
                controller: _descController,
                hintText: 'A binary tree where left children are smaller and right children are larger than the parent.',
                maxLines: 5,
                validator: (v) =>
                    InputValidators.requiredField(v, label: 'Description'),
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
