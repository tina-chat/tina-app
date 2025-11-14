import 'package:auravibes_ui/src/tokens/auravibes_theme.dart';
import 'package:auravibes_ui/src/tokens/design_tokens.dart';
import 'package:flutter/material.dart';

/// An attachment preview component for file attachments.
///
/// This component displays file attachments with appropriate icons, file
/// information, and action buttons for download or removal.
class AuraAttachmentPreview extends StatelessWidget {
  /// Creates a Aura attachment preview.
  const AuraAttachmentPreview({
    required this.fileName,
    required this.fileType,
    super.key,
    this.fileSize,
    this.thumbnailUrl,
    this.onDownload,
    this.onRemove,
    this.isDownloading = false,
    this.downloadProgress,
    this.size = AuraAttachmentPreviewSize.medium,
  });

  /// The name of the file.
  final String fileName;

  /// The type of the file.
  final AuraAttachmentType fileType;

  /// The size of the file in bytes.
  final int? fileSize;

  /// URL for thumbnail preview (for images/videos).
  final String? thumbnailUrl;

  /// Called when the download button is tapped.
  final VoidCallback? onDownload;

  /// Called when the remove button is tapped.
  final VoidCallback? onRemove;

  /// Whether the file is currently being downloaded.
  final bool isDownloading;

  /// Download progress (0.0 to 1.0). Only shown when isDownloading is true.
  final double? downloadProgress;

  /// The size of the attachment preview.
  final AuraAttachmentPreviewSize size;

  @override
  Widget build(BuildContext context) {
    final auraColors = context.auraColors;

    return Container(
      constraints: BoxConstraints(
        maxWidth: _getMaxWidth(),
      ),
      decoration: BoxDecoration(
        color: auraColors.surfaceVariant,
        border: Border.all(
          color: auraColors.outline,
        ),
        borderRadius: BorderRadius.circular(DesignBorderRadius.md),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(auraColors),
          _buildContent(auraColors),
          if (onDownload != null || onRemove != null) _buildActions(auraColors),
        ],
      ),
    );
  }

  Widget _buildHeader(AuraColorScheme auraColors) {
    if (thumbnailUrl != null && fileType == AuraAttachmentType.image) {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(DesignBorderRadius.md),
        ),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            thumbnailUrl!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                _buildFileIcon(auraColors),
          ),
        ),
      );
    }

    return Container(
      height: _getIconContainerHeight(),
      decoration: BoxDecoration(
        color: auraColors.surfaceVariant,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(DesignBorderRadius.md),
        ),
      ),
      child: Center(child: _buildFileIcon(auraColors)),
    );
  }

  Widget _buildFileIcon(AuraColorScheme auraColors) {
    final iconData = _getFileTypeIcon();
    final iconColor = _getFileTypeColor(auraColors);

    return Icon(
      iconData,
      size: _getIconSize(),
      color: iconColor,
      semanticLabel: '${fileType.name} file',
    );
  }

  Widget _buildContent(AuraColorScheme auraColors) {
    return Padding(
      padding: EdgeInsets.all(_getContentPadding()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fileName,
            style: TextStyle(
              fontSize: _getFileNameFontSize(),
              fontWeight: DesignTypography.fontWeightMedium,
              fontFamily: DesignTypography.bodyFontFamily,
              color: auraColors.onSurface,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (fileSize != null) ...[
            const SizedBox(height: DesignSpacing.xs),
            Text(
              _formatFileSize(fileSize!),
              style: TextStyle(
                fontSize: _getFileSizeFontSize(),
                color: auraColors.onSurfaceVariant,
                fontFamily: DesignTypography.bodyFontFamily,
              ),
            ),
          ],
          if (isDownloading) ...[
            const SizedBox(height: DesignSpacing.sm),
            _buildProgressIndicator(auraColors),
          ],
        ],
      ),
    );
  }

  Widget _buildProgressIndicator(AuraColorScheme auraColors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: downloadProgress,
          backgroundColor: auraColors.outline,
          valueColor: AlwaysStoppedAnimation<Color>(
            auraColors.primary,
          ),
        ),
        if (downloadProgress != null) ...[
          const SizedBox(height: DesignSpacing.xs),
          Text(
            '${(downloadProgress! * 100).toInt()}%',
            style: TextStyle(
              fontSize: DesignTypography.fontSizeXs,
              color: auraColors.onSurfaceVariant,
              fontFamily: DesignTypography.bodyFontFamily,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildActions(AuraColorScheme auraColors) {
    return Container(
      padding: EdgeInsets.all(_getActionsPadding()),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: auraColors.outline,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (onDownload != null) ...[
            IconButton(
              onPressed: isDownloading ? null : onDownload,
              icon: Icon(
                isDownloading ? Icons.downloading : Icons.download,
                size: _getActionIconSize(),
              ),
              tooltip: isDownloading ? 'Downloading...' : 'Download',
              color: auraColors.primary,
            ),
          ],
          if (onRemove != null) ...[
            if (onDownload != null) const SizedBox(width: DesignSpacing.xs),
            IconButton(
              onPressed: onRemove,
              icon: Icon(
                Icons.close,
                size: _getActionIconSize(),
              ),
              tooltip: 'Remove',
              color: auraColors.error,
            ),
          ],
        ],
      ),
    );
  }

  double _getMaxWidth() {
    return switch (size) {
      AuraAttachmentPreviewSize.small => 200.0,
      AuraAttachmentPreviewSize.medium => 280.0,
      AuraAttachmentPreviewSize.large => 360.0,
    };
  }

  double _getIconContainerHeight() {
    return switch (size) {
      AuraAttachmentPreviewSize.small => 60.0,
      AuraAttachmentPreviewSize.medium => 80.0,
      AuraAttachmentPreviewSize.large => 100.0,
    };
  }

  double _getIconSize() {
    return switch (size) {
      AuraAttachmentPreviewSize.small => 24.0,
      AuraAttachmentPreviewSize.medium => 32.0,
      AuraAttachmentPreviewSize.large => 40.0,
    };
  }

  double _getContentPadding() {
    return switch (size) {
      AuraAttachmentPreviewSize.small => DesignSpacing.sm,
      AuraAttachmentPreviewSize.medium => DesignSpacing.md,
      AuraAttachmentPreviewSize.large => DesignSpacing.lg,
    };
  }

  double _getActionsPadding() {
    return switch (size) {
      AuraAttachmentPreviewSize.small => DesignSpacing.xs,
      AuraAttachmentPreviewSize.medium => DesignSpacing.sm,
      AuraAttachmentPreviewSize.large => DesignSpacing.md,
    };
  }

  double _getFileNameFontSize() {
    return switch (size) {
      AuraAttachmentPreviewSize.small => DesignTypography.fontSizeSm,
      AuraAttachmentPreviewSize.medium => DesignTypography.fontSizeBase,
      AuraAttachmentPreviewSize.large => DesignTypography.fontSizeLg,
    };
  }

  double _getFileSizeFontSize() {
    return switch (size) {
      AuraAttachmentPreviewSize.small => DesignTypography.fontSizeXs,
      AuraAttachmentPreviewSize.medium => DesignTypography.fontSizeSm,
      AuraAttachmentPreviewSize.large => DesignTypography.fontSizeBase,
    };
  }

  double _getActionIconSize() {
    return switch (size) {
      AuraAttachmentPreviewSize.small => 16.0,
      AuraAttachmentPreviewSize.medium => 20.0,
      AuraAttachmentPreviewSize.large => 24.0,
    };
  }

  IconData _getFileTypeIcon() {
    return switch (fileType) {
      AuraAttachmentType.image => Icons.image,
      AuraAttachmentType.video => Icons.videocam,
      AuraAttachmentType.audio => Icons.audiotrack,
      AuraAttachmentType.document => Icons.description,
      AuraAttachmentType.pdf => Icons.picture_as_pdf,
      AuraAttachmentType.spreadsheet => Icons.table_chart,
      AuraAttachmentType.presentation => Icons.slideshow,
      AuraAttachmentType.archive => Icons.archive,
      AuraAttachmentType.code => Icons.code,
      AuraAttachmentType.other => Icons.attach_file,
    };
  }

  Color _getFileTypeColor(AuraColorScheme auraColors) {
    return switch (fileType) {
      AuraAttachmentType.image => auraColors.success,
      AuraAttachmentType.video => auraColors.primary,
      AuraAttachmentType.audio => auraColors.secondary,
      AuraAttachmentType.document => auraColors.info,
      AuraAttachmentType.pdf => auraColors.error,
      AuraAttachmentType.spreadsheet => auraColors.success,
      AuraAttachmentType.presentation => auraColors.warning,
      AuraAttachmentType.archive => auraColors.onSurfaceVariant,
      AuraAttachmentType.code => auraColors.onSurface,
      AuraAttachmentType.other => auraColors.onSurfaceVariant,
    };
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    } else {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
    }
  }
}

/// The type of file attachment.
enum AuraAttachmentType {
  /// Image file (jpg, png, gif, etc.).
  image,

  /// Video file (mp4, avi, mov, etc.).
  video,

  /// Audio file (mp3, wav, etc.).
  audio,

  /// Document file (txt, docx, etc.).
  document,

  /// PDF file.
  pdf,

  /// Spreadsheet file (xlsx, csv, etc.).
  spreadsheet,

  /// Presentation file (pptx, etc.).
  presentation,

  /// Archive file (zip, rar, etc.).
  archive,

  /// Code file (js, dart, py, etc.).
  code,

  /// Other file types.
  other,
}

/// The size of a [AuraAttachmentPreview].
enum AuraAttachmentPreviewSize {
  /// A small attachment preview.
  small,

  /// A medium attachment preview (default).
  medium,

  /// A large attachment preview.
  large,
}
