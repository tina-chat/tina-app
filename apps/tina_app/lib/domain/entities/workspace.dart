import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/workspace_type.dart';

part 'workspace.freezed.dart';

/// Entity representing a workspace in the Tina application.
///
/// A workspace is a container for organizing and managing different
/// projects or environments within the Tina application.
@freezed
abstract class WorkspaceEntity with _$WorkspaceEntity {
  const WorkspaceEntity._();

  /// Creates a new Workspace instance
  const factory WorkspaceEntity({
    /// Unique identifier for the workspace
    required String id,

    /// Human-readable name of the workspace
    required String name,

    /// Type of workspace (local or remote)
    required WorkspaceType type,

    /// URL for remote workspaces, null for local workspaces
    final String? url,

    /// Timestamp when the workspace was created
    required DateTime createdAt,

    /// Timestamp when the workspace was last updated
    required DateTime updatedAt,
  }) = _WorkspaceEntity;
}

@freezed
abstract class WorkspaceToCreate with _$WorkspaceToCreate {
  const WorkspaceToCreate._();

  /// Creates a new WorkspaceToCreate instance
  const factory WorkspaceToCreate({
    /// Human-readable name of the workspace
    required String name,

    /// Type of workspace (local or remote)
    required WorkspaceType type,

    /// URL for remote workspaces, null for local workspaces
    final String? url,
  }) = _WorkspaceToCreate;

  /// Returns true if the workspace name is not empty
  bool get hasValidName => name.isNotEmpty;

  /// Returns true if this is a local workspace
  bool get isLocal => type.isLocal;

  /// Returns true if this is a remote workspace
  bool get isRemote => type.isRemote;

  /// Returns true if the workspace has a valid URL (for remote workspaces)
  bool get hasValidUrl {
    if (isLocal && url == null) return true;
    return !isLocal && url != null && url!.isNotEmpty;
  }

  /// Returns true if the workspace is in a valid state
  bool get isValid {
    return hasValidName && hasValidUrl;
  }
}
