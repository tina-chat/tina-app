# Workspace Screen Text Button Issue Analysis

## Issue Location
**File**: `apps/tina_app/lib/screens/workspaces/widgets/workspace_card.dart`
**Lines**: 107-134 (Edit and Delete buttons)

## Problem Description
The workspace card contains edit and delete buttons with both icons and text that may have fitting issues:

```dart
TinaButton(
  onPressed: onEdit,
  variant: TinaButtonVariant.outlined,
  size: TinaButtonSize.small,
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Icon(Icons.edit, size: 16),
      const SizedBox(width: 4),
      const Text('Edit'),
    ],
  ),
),
```

## Technical Analysis

### Button Sizing Constraints
- **Button Height**: 32px (`DesignButtonSizes.heightSm`)
- **Horizontal Padding**: 16px each side (`spacing.md` = 16px)
- **Internal Content**: Icon (16px) + 4px spacing + Text
- **Font Size**: 14px (`typography.sizes.sm`)

### Potential Issues
1. **Text Overflow**: With longer text or larger font scales, "Edit" and "Delete" may not fit comfortably
2. **Internationalization**: Text may be longer in other languages
3. **Accessibility**: Larger font sizes from user settings could cause overflow
4. **Button Width**: No minimum width constraint, could become too narrow

### Current Layout
- Row with `MainAxisSize.min` - button width adapts to content
- Fixed 4px spacing between icon and text
- Small button size with limited internal space

## Navigation Path
Settings → Workspace Management → `/workspaces` route → `WorkspacesScreen` → `WorkspaceCard`

## Related Components
- **WorkspacesScreen**: Main workspace management screen
- **WorkspaceCard**: Individual workspace display with action buttons
- **TinaButton**: Custom button component from tina_ui package
- **Workspace Entity**: Domain model for workspace data

## Design System Context
- Uses Tina UI design system with atomic design principles
- Follows Material Design conventions
- Consistent spacing and typography tokens
- Small button size optimized for compact layouts

## Recommendations
1. Consider icon-only buttons for space-constrained situations
2. Add minimum width constraints
3. Implement responsive text handling
4. Test with accessibility font scaling
5. Consider internationalization text length variations