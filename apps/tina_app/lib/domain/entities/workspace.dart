import '../enums/workspace_type.dart';

/// Entity representing a workspace in the Tina application.
///
/// A workspace is a container for organizing and managing different
/// projects or environments within the Tina application.
class Workspace {
  /// Unique identifier for the workspace
  final int id;

  /// Human-readable name of the workspace
  final String name;

  /// Type of workspace (local or remote)
  final WorkspaceType type;

  /// URL for remote workspaces, null for local workspaces
  final String? url;

  /// Timestamp when the workspace was created
  final DateTime createdAt;

  /// Timestamp when the workspace was last updated
  final DateTime updatedAt;

  /// Creates a new Workspace instance
  const Workspace({
    required this.id,
    required this.name,
    required this.type,
    this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Creates a copy of this Workspace with updated values
  Workspace copyWith({
    int? id,
    String? name,
    WorkspaceType? type,
    String? url,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Workspace(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      url: url ?? this.url,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Returns true if this is a local workspace
  bool get isLocal => type.isLocal;

  /// Returns true if this is a remote workspace
  bool get isRemote => type.isRemote;

  /// Returns true if the workspace has a valid URL (for remote workspaces)
  bool get hasValidUrl {
    if (isLocal) return true;
    return url != null && url!.isNotEmpty;
  }

  /// Returns true if the workspace name is not empty
  bool get hasValidName => name.isNotEmpty;

  /// Returns true if the workspace is in a valid state
  bool get isValid {
    return hasValidName && !id.isNaN && hasValidUrl;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Workspace &&
        other.id == id &&
        other.name == name &&
        other.type == type &&
        other.url == url &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(id, name, type, url, createdAt, updatedAt);
  }

  @override
  String toString() {
    return 'Workspace('
        'id: $id, '
        'name: $name, '
        'type: $type, '
        'url: $url, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt'
        ')';
  }

  /// Converts the workspace to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.value,
      'url': url,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Creates a Workspace from a JSON map
  factory Workspace.fromJson(Map<String, dynamic> json) {
    return Workspace(
      id: json['id'] as int,
      name: json['name'] as String,
      type: WorkspaceType.fromString(json['type'] as String),
      url: json['url'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}

class WorkspaceToCreate {
  /// Human-readable name of the workspace
  final String name;

  /// Type of workspace (local or remote)
  final WorkspaceType type;

  /// URL for remote workspaces, null for local workspaces
  final String? url;

  /// Creates a new WorkspaceToCreate instance
  const WorkspaceToCreate({required this.name, required this.type, this.url});

  /// Returns true if the workspace name is not empty
  bool get hasValidName => name.isNotEmpty;

  /// Returns true if this is a local workspace
  bool get isLocal => type.isLocal;

  /// Returns true if this is a remote workspace
  bool get isRemote => type.isRemote;

  /// Returns true if the workspace has a valid URL (for remote workspaces)
  bool get hasValidUrl {
    if (isLocal) return true;
    return url != null && url!.isNotEmpty;
  }

  /// Returns true if the workspace is in a valid state
  bool get isValid {
    return hasValidName && hasValidUrl;
  }

  WorkspaceToCreate copyWith({String? name, WorkspaceType? type, String? url}) {
    return WorkspaceToCreate(
      name: name ?? this.name,
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }
}
