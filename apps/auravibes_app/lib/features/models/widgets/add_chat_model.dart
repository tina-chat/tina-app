import 'package:auravibes_app/domain/enums/chat_models_type.dart';
import 'package:auravibes_app/features/models/providers/add_model_provider_providers.dart';
import 'package:auravibes_app/features/models/widgets/enhanced_model_input.dart';
import 'package:auravibes_app/i18n/locale_keys.dart';
import 'package:auravibes_app/widgets/text_locale.dart';
import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: implementation_imports
import 'package:riverpod/src/framework.dart';

class AddModelProviderWidget extends HookConsumerWidget {
  const AddModelProviderWidget({super.key});

  void _submitForm(BuildContext context, WidgetRef ref) {
    addChatModelMutationProvider.run(ref, (transaction) async {
      final notifier = transaction.get(addModelProviderStateProvider.notifier);
      final created = await notifier.addModelProvider();
      if (context.mounted && created != null) {
        Navigator.of(context).pop(created);
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final formKey = useMemoized(GlobalKey<FormState>.new, []);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ModalHeader(
          onClose: () => Navigator.of(context).pop(),
        ),
        Flexible(
          child: SingleChildScrollView(
            controller: scrollController,
            padding: EdgeInsets.all(context.auraTheme.spacing.lg),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _BasicInfoSection(),
                  SizedBox(height: context.auraTheme.spacing.xl),
                  _ApiConfigSection(
                    onSubmit: () => _submitForm(context, ref),
                  ),
                  SizedBox(height: context.auraTheme.spacing.xl),
                  _CreateButton(onSubmit: () => _submitForm(context, ref)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Modal header with title and close button
class _ModalHeader extends StatelessWidget {
  const _ModalHeader({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.auraTheme.spacing.lg),
      child: Row(
        children: [
          const Expanded(
            child: AuraText(
              style: AuraTextStyle.heading5,
              child: TextLocale(
                LocaleKeys.models_screens_add_provider_title,
              ),
            ),
          ),
          AuraIconButton(
            onPressed: onClose,
            icon: Icons.close,
            semanticLabel: 'Close dialog',
          ),
        ],
      ),
    );
  }
}

/// Basic information section with name and provider type
class _BasicInfoSection extends StatelessWidget {
  const _BasicInfoSection();

  @override
  Widget build(BuildContext context) {
    return _FormSection(
      title: LocaleKeys.models_screens_add_provider_basic_info_section,
      children: [
        const EnhancedModelInput(
          fieldType: ModelInputFieldType.name,
          // onSubmitted: keyFocusNode.requestFocus,
        ),
        SizedBox(height: context.auraTheme.spacing.lg),
        _ModelTypeSelector(),
      ],
    );
  }
}

/// API configuration section with key and URL
class _ApiConfigSection extends StatelessWidget {
  const _ApiConfigSection({
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return _FormSection(
      title: LocaleKeys.models_screens_add_provider_api_config_section,
      children: [
        const EnhancedModelInput(
          fieldType: ModelInputFieldType.key,
        ),
        SizedBox(height: context.auraTheme.spacing.lg),
        EnhancedModelInput(
          fieldType: ModelInputFieldType.url,

          onSubmitted: onSubmit,
        ),
      ],
    );
  }
}

/// Reusable form section with title and content
class _FormSection extends StatelessWidget {
  const _FormSection({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextLocale(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: context.auraColors.primary,
          ),
        ),
        SizedBox(height: context.auraTheme.spacing.md),
        ...children,
      ],
    );
  }
}

/// Enhanced model type selector with hint text
class _ModelTypeSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = ref.watch(
      addModelProviderStateProvider.select(
        (value) => value.type,
      ),
    );

    final notifier = ref.read(addModelProviderStateProvider.notifier);

    return AuraDropdownSelector<ChatModelType>(
      value: type,
      onChanged: notifier.setType,
      label: const TextLocale(
        LocaleKeys.models_screens_add_provider_model_label,
      ),
      hint: const TextLocale(LocaleKeys.models_screens_add_provider_model_hint),

      options: const [
        AuraDropdownOption(
          value: ChatModelType.anthropic,
          child: TextLocale(
            LocaleKeys.models_screens_add_provider_anthropic_option,
          ),
        ),
        AuraDropdownOption(
          value: ChatModelType.openai,
          child: TextLocale(
            LocaleKeys.models_screens_add_provider_openai_option,
          ),
        ),
      ],
    );
  }
}

/// Error banner for displaying general errors
class _ErrorBanner extends ConsumerWidget {
  const _ErrorBanner();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addChatModelMutation = ref.watch(addChatModelMutationProvider);

    final error = switch (addChatModelMutation) {
      MutationError<void>(:final error as AddModelException) => switch (error) {
        AddModelExceptionNoWorkspace() => 'no workspace found',
        AddModelExceptionNoUnkown() => 'unkown error',
      },
      _ => null,
    };

    if (error == null) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: EdgeInsets.all(context.auraTheme.spacing.md),
      decoration: BoxDecoration(
        color: context.auraColors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DesignBorderRadius.md),
        border: Border.all(
          color: context.auraColors.error,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: context.auraColors.error,
            size: 20,
          ),
          SizedBox(width: context.auraTheme.spacing.sm),
          Expanded(
            child: Text(
              error,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: context.auraColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Create button with loading state
class _CreateButton extends HookConsumerWidget {
  const _CreateButton({required this.onSubmit});

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSubmitting = ref.watch(
      addChatModelMutationProvider.select(
        (value) => value.isPending,
      ),
    );

    final isValid = ref.watch(
      addModelProviderStateProvider.select(
        (value) => value.isValid(),
      ),
    );

    return Column(
      children: [
        const _ErrorBanner(),
        AuraButton(
          disabled: isSubmitting || !isValid,
          onPressed: onSubmit,
          isLoading: isSubmitting,
          isFullWidth: true,
          size: AuraButtonSize.large,
          child: const TextLocale(
            LocaleKeys.models_screens_add_provider_create_button,
          ),
        ),
      ],
    );
  }
}
