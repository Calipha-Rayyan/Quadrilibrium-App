import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme_tokens.dart';
import '../../../data/models/meal_model.dart';
import '../../../data/sample_data.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';

/// Screen 26 — Add Meal (food selection + Small/Medium/Large serving size).
class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  FoodOption _selectedFood = SampleData.foodCatalog.first;
  ServingSize _selectedServing = ServingSize.medium;

  void _save() {
    AppStateScope.of(context).fitness
        .addMeal(food: _selectedFood, servingSize: _selectedServing);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Added ${_selectedFood.name} (${_selectedServing.label}).',
        ),
      ),
    );
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return AuroraScaffold(
      auroraColor: AppColors.physicalFitness,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(
              title: 'Add Meal',
              subtitle: 'Choose food and serving',
              titleColor: AppColors.physicalFitness,
            ),
            const SizedBox(height: 22),
            Text(
              'Food',
              style: Theme.of(context).textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            ...SampleData.foodCatalog.map((food) {
              final selected = food.name == _selectedFood.name;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () => setState(() => _selectedFood = food),
                  borderRadius: BorderRadius.circular(AppRadii.md),
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceCard,
                      borderRadius: BorderRadius.circular(AppRadii.md),
                      border: Border.all(
                        color: selected
                            ? AppColors.physicalFitness
                            : AppColors.border,
                        width: selected ? 1.4 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selected
                                ? AppColors.physicalFitness
                                : Colors.transparent,
                            border: Border.all(
                              color: selected
                                  ? AppColors.physicalFitness
                                  : AppColors.border,
                              width: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            food.name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        if (selected)
                          const Text(
                            'Selected',
                            style: TextStyle(
                              color: AppColors.physicalFitness,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 14),
            Text(
              'Serving size',
              style: Theme.of(context).textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: ServingSize.values.map((size) {
                final selected = size == _selectedServing;
                return ChoiceChip(
                  label: Text(size.label),
                  selected: selected,
                  showCheckmark: true,
                  checkmarkColor: AppColors.physicalFitness,
                  selectedColor: AppColors.physicalFitness.withValues(
                    alpha: 0.18,
                  ),
                  backgroundColor: AppColors.surfaceCard,
                  side: BorderSide(
                    color: selected
                        ? AppColors.physicalFitness
                        : AppColors.border,
                  ),
                  labelStyle: TextStyle(
                    color: selected
                        ? AppColors.physicalFitness
                        : AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  onSelected: (_) => setState(() => _selectedServing = size),
                );
              }).toList(),
            ),
            const SizedBox(height: 28),
            PrimaryButton(
              label: 'Save',
              backgroundColor: AppColors.physicalFitness,
              onPressed: _save,
            ),
            const SizedBox(height: 12),
            SecondaryButton(label: 'Cancel', onPressed: () => context.pop()),
          ],
        ),
      ),
    );
  }
}
