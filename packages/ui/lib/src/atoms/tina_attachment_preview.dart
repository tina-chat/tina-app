import 'package:flutter/material.dart';
import '../tokens/design_tokens.dart';

/// An attachment preview component for file attachments.
///
/// This component displays file attachments with appropriate icons, file
/// information, and action buttons for download or removal.
class TinaAttachmentPreview extends StatelessWidget {
  /// Creates a Tina attachment preview.
  const TinaAttachmentPreview({
    required this.fileName,
    required this.fileType,
    super.key,
    this.fileSize,
    this.thumbnailUrl,
    this.onDownload,
    this.onRemove,
    this.isDownloading = false,
    this.downloadProgress,
    this.size = TinaAttachmentPreviewSize.medium,
  });

  /// The name of the file.
  final String fileName;

  /// The type of the file.
  final TinaAttachmentType fileType;

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
  final TinaAttachmentPreviewSize size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      constraints: BoxConstraints(
        maxWidth: _getMaxWidth(),
      ),
      decoration: BoxDecoration(
        color: DesignColors.neutral50,
        border: Border.all(
          color: DesignColors.neutral200,
          width: DesignBorderWidth.thin,
        ),
        borderRadius: BorderRadius.circular(DesignBorderRadius.md),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          _buildContent(theme),
          if (onDownload != null || onRemove != null) _buildActions(theme),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    if (thumbnailUrl != null && fileType == TinaAttachmentType.image) {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(DesignBorderRadius.md),
        ),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            thumbnailUrl!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => _buildFileIcon(),
          ),
        ),
      );
    }
    
    return Container(
      height: _getIconContainerHeight(),
      decoration: const BoxDecoration(
        color: DesignColors.neutral100,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(DesignBorderRadius.md),
        ),
      ),
      child: Center(child: _buildFileIcon()),
    );
  }

  Widget _buildFileIcon() {
    final iconData = _getFileTypeIcon();
    final iconColor = _getFileTypeColor();
    
    return Icon(
      iconData,
      size: _getIconSize(),
      color: iconColor,
      semanticLabel: '${fileType.name} file',
    );
  }

  Widget _buildContent(ThemeData theme) {
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
              color: DesignColors.neutral800,
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
                color: DesignColors.neutral500,
                fontFamily: DesignTypography.bodyFontFamily,
              ),
            ),
          ],
          if (isDownloading) ...[
            const SizedBox(height: DesignSpacing.sm),
            _buildProgressIndicator(),
          ],
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: downloadProgress,
          backgroundColor: DesignColors.neutral200,
          valueColor: const AlwaysStoppedAnimation<Color>(
            DesignColors.primaryBase,
          ),
        ),
        if (downloadProgress != null) ...[
          const SizedBox(height: DesignSpacing.xs),
          Text(
            '${(downloadProgress! * 100).toInt()}%',
            style: TextStyle(
              fontSize: DesignTypography.fontSizeXs,
              color: DesignColors.neutral500,
              fontFamily: DesignTypography.bodyFontFamily,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildActions(ThemeData theme) {
    return Container(
      padding: EdgeInsets.all(_getActionsPadding()),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: DesignColors.neutral200,
            width: DesignBorderWidth.thin,
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
              color: DesignColors.primaryBase,
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
              color: DesignColors.error,
            ),
          ],
        ],
      ),
    );
  }

  double _getMaxWidth() {
    return switch (size) {
      TinaAttachmentPreviewSize.small => 200.0,
      TinaAttachmentPreviewSize.medium => 280.0,
      TinaAttachmentPreviewSize.large => 360.0,
    };
  }

  double _getIconContainerHeight() {
    return switch (size) {
      TinaAttachmentPreviewSize.small => 60.0,
      TinaAttachmentPreviewSize.medium => 80.0,
      TinaAttachmentPreviewSize.large => 100.0,
    };
  }

  double _getIconSize() {
    return switch (size) {
      TinaAttachmentPreviewSize.small => 24.0,
      TinaAttachmentPreviewSize.medium => 32.0,
      TinaAttachmentPreviewSize.large => 40.0,
    };
  }

  double _getContentPadding() {
    return switch (size) {
      TinaAttachmentPreviewSize.small => DesignSpacing.sm,
      TinaAttachmentPreviewSize.medium => DesignSpacing.md,
      TinaAttachmentPreviewSize.large => DesignSpacing.lg,
    };
  }

  double _getActionsPadding() {
    return switch (size) {
      TinaAttachmentPreviewSize.small => DesignSpacing.xs,
      TinaAttachmentPreviewSize.medium => DesignSpacing.sm,
      TinaAttachmentPreviewSize.large => DesignSpacing.md,
    };
  }

  double _getFileNameFontSize() {
    return switch (size) {
      TinaAttachmentPreviewSize.small => DesignTypography.fontSizeSm,
      TinaAttachmentPreviewSize.medium => DesignTypography.fontSizeBase,
      TinaAttachmentPreviewSize.large => DesignTypography.fontSizeLg,
    };
  }

  double _getFileSizeFontSize() {
    return switch (size) {
      TinaAttachmentPreviewSize.small => DesignTypography.fontSizeXs,
      TinaAttachmentPreviewSize.medium => DesignTypography.fontSizeSm,
      TinaAttachmentPreviewSize.large => DesignTypography.fontSizeBase,
    };
  }

  double _getActionIconSize() {
    return switch (size) {
      TinaAttachmentPreviewSize.small => 16.0,
      TinaAttachmentPreviewSize.medium => 20.0,
      TinaAttachmentPreviewSize.large => 24.0,
    };
  }

  IconData _getFileTypeIcon() {
    return switch (fileType) {
      TinaAttachmentType.image => Icons.image,
      TinaAttachmentType.video => Icons.videocam,
      TinaAttachmentType.audio => Icons.audiotrack,
      TinaAttachmentType.document => Icons.description,
      TinaAttachmentType.pdf => Icons.picture_as_pdf,
      TinaAttachmentType.spreadsheet => Icons.table_chart,
      TinaAttachmentType.presentation => Icons.slideshow,
      TinaAttachmentType.archive => Icons.archive,
      TinaAttachmentType.code => Icons.code,
      TinaAttachmentType.other => Icons.attach_file,
    };
  }

  Color _getFileTypeColor() {
    return switch (fileType) {
      TinaAttachmentType.image => DesignColors.success,
      TinaAttachmentType.video => DesignColors.primaryBase,
      TinaAttachmentType.audio => DesignColors.accentBase,
      TinaAttachmentType.document => DesignColors.info,
      TinaAttachmentType.pdf => DesignColors.error,
      TinaAttachmentType.spreadsheet => DesignColors.success,
      TinaAttachmentType.presentation => DesignColors.warning,
      TinaAttachmentType.archive => DesignColors.neutral600,
      TinaAttachmentType.code => DesignColors.neutral700,
      TinaAttachmentType.other => DesignColors.neutral500,
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
enum TinaAttachmentType {
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

/// The size of a [TinaAttachmentPreview].
enum TinaAttachmentPreviewSize {
  /// A small attachment preview.
  small,

  /// A medium attachment preview (default).
  medium,

  /// A large attachment preview.
  large,
}