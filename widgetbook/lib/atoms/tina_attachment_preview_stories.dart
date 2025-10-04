import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Image Attachment', type: TinaAttachmentPreview)
Widget imageAttachmentUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'vacation_photo.jpg',
      fileType: TinaAttachmentType.image,
      fileSize: 2048576, // 2MB
      thumbnailUrl: 'https://picsum.photos/400/300',
      size: TinaAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Video Attachment', type: TinaAttachmentPreview)
Widget videoAttachmentUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'presentation_demo.mp4',
      fileType: TinaAttachmentType.video,
      fileSize: 15728640, // 15MB
      size: TinaAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'PDF Document', type: TinaAttachmentPreview)
Widget pdfDocumentUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'project_requirements.pdf',
      fileType: TinaAttachmentType.pdf,
      fileSize: 1048576, // 1MB
      size: TinaAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Audio File', type: TinaAttachmentPreview)
Widget audioFileUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'meeting_recording.mp3',
      fileType: TinaAttachmentType.audio,
      fileSize: 5242880, // 5MB
      size: TinaAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Spreadsheet', type: TinaAttachmentPreview)
Widget spreadsheetUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'budget_analysis.xlsx',
      fileType: TinaAttachmentType.spreadsheet,
      fileSize: 512000, // 500KB
      size: TinaAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Presentation', type: TinaAttachmentPreview)
Widget presentationUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'quarterly_review.pptx',
      fileType: TinaAttachmentType.presentation,
      fileSize: 3145728, // 3MB
      size: TinaAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Archive File', type: TinaAttachmentPreview)
Widget archiveFileUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'project_assets.zip',
      fileType: TinaAttachmentType.archive,
      fileSize: 10485760, // 10MB
      size: TinaAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Code File', type: TinaAttachmentPreview)
Widget codeFileUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'main.dart',
      fileType: TinaAttachmentType.code,
      fileSize: 4096, // 4KB
      size: TinaAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Document File', type: TinaAttachmentPreview)
Widget documentFileUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'meeting_notes.docx',
      fileType: TinaAttachmentType.document,
      fileSize: 256000, // 250KB
      size: TinaAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Other File Type', type: TinaAttachmentPreview)
Widget otherFileTypeUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'unknown_file.xyz',
      fileType: TinaAttachmentType.other,
      fileSize: 1024, // 1KB
      size: TinaAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Downloading State', type: TinaAttachmentPreview)
Widget downloadingStateUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'large_dataset.csv',
      fileType: TinaAttachmentType.spreadsheet,
      fileSize: 52428800, // 50MB
      size: TinaAttachmentPreviewSize.medium,
      isDownloading: true,
      downloadProgress: 0.65,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Downloading Indeterminate',
  type: TinaAttachmentPreview,
)
Widget downloadingIndeterminateUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'processing_file.dat',
      fileType: TinaAttachmentType.other,
      fileSize: 1048576, // 1MB
      size: TinaAttachmentPreviewSize.medium,
      isDownloading: true,
      // No downloadProgress for indeterminate progress
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Small Size', type: TinaAttachmentPreview)
Widget smallSizeUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'thumbnail.png',
      fileType: TinaAttachmentType.image,
      fileSize: 51200, // 50KB
      size: TinaAttachmentPreviewSize.small,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Large Size', type: TinaAttachmentPreview)
Widget largeSizeUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'high_resolution_image.png',
      fileType: TinaAttachmentType.image,
      fileSize: 20971520, // 20MB
      size: TinaAttachmentPreviewSize.large,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'No Actions', type: TinaAttachmentPreview)
Widget noActionsUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'readonly_document.pdf',
      fileType: TinaAttachmentType.pdf,
      fileSize: 2097152, // 2MB
      size: TinaAttachmentPreviewSize.medium,
      // No onDownload or onRemove callbacks
    ),
  );
}

@widgetbook.UseCase(name: 'Download Only', type: TinaAttachmentPreview)
Widget downloadOnlyUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'shared_resource.zip',
      fileType: TinaAttachmentType.archive,
      fileSize: 7340032, // 7MB
      size: TinaAttachmentPreviewSize.medium,
      onDownload: () {},
      // No onRemove callback
    ),
  );
}

@widgetbook.UseCase(name: 'Remove Only', type: TinaAttachmentPreview)
Widget removeOnlyUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'temp_file.tmp',
      fileType: TinaAttachmentType.other,
      fileSize: 1024, // 1KB
      size: TinaAttachmentPreviewSize.medium,
      // No onDownload callback
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Long Filename', type: TinaAttachmentPreview)
Widget longFilenameUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName:
          'this_is_a_very_long_filename_that_should_be_truncated_properly_in_the_ui.pdf',
      fileType: TinaAttachmentType.pdf,
      fileSize: 1048576, // 1MB
      size: TinaAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'No File Size', type: TinaAttachmentPreview)
Widget noFileSizeUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'unknown_size.dat',
      fileType: TinaAttachmentType.other,
      // No fileSize provided
      size: TinaAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Image with Broken Thumbnail',
  type: TinaAttachmentPreview,
)
Widget brokenThumbnailUseCase(BuildContext context) {
  return Center(
    child: TinaAttachmentPreview(
      fileName: 'corrupted_image.jpg',
      fileType: TinaAttachmentType.image,
      fileSize: 1048576, // 1MB
      thumbnailUrl: 'https://invalid-url-that-will-fail.com/image.jpg',
      size: TinaAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'All Sizes Comparison', type: TinaAttachmentPreview)
Widget allSizesComparisonUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text('Small Size', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      TinaAttachmentPreview(
        fileName: 'small_file.pdf',
        fileType: TinaAttachmentType.pdf,
        fileSize: 512000, // 500KB
        size: TinaAttachmentPreviewSize.small,
        onDownload: () {},
        onRemove: () {},
      ),
      const SizedBox(height: 24),
      const Text('Medium Size', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      TinaAttachmentPreview(
        fileName: 'medium_file.pdf',
        fileType: TinaAttachmentType.pdf,
        fileSize: 1048576, // 1MB
        size: TinaAttachmentPreviewSize.medium,
        onDownload: () {},
        onRemove: () {},
      ),
      const SizedBox(height: 24),
      const Text('Large Size', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      TinaAttachmentPreview(
        fileName: 'large_file.pdf',
        fileType: TinaAttachmentType.pdf,
        fileSize: 5242880, // 5MB
        size: TinaAttachmentPreviewSize.large,
        onDownload: () {},
        onRemove: () {},
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'File Type Showcase', type: TinaAttachmentPreview)
Widget fileTypeShowcaseUseCase(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            TinaAttachmentPreview(
              fileName: 'photo.jpg',
              fileType: TinaAttachmentType.image,
              fileSize: 2048576,
              size: TinaAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            TinaAttachmentPreview(
              fileName: 'video.mp4',
              fileType: TinaAttachmentType.video,
              fileSize: 15728640,
              size: TinaAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            TinaAttachmentPreview(
              fileName: 'audio.mp3',
              fileType: TinaAttachmentType.audio,
              fileSize: 5242880,
              size: TinaAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            TinaAttachmentPreview(
              fileName: 'document.docx',
              fileType: TinaAttachmentType.document,
              fileSize: 256000,
              size: TinaAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            TinaAttachmentPreview(
              fileName: 'file.pdf',
              fileType: TinaAttachmentType.pdf,
              fileSize: 1048576,
              size: TinaAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            TinaAttachmentPreview(
              fileName: 'sheet.xlsx',
              fileType: TinaAttachmentType.spreadsheet,
              fileSize: 512000,
              size: TinaAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            TinaAttachmentPreview(
              fileName: 'slides.pptx',
              fileType: TinaAttachmentType.presentation,
              fileSize: 3145728,
              size: TinaAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            TinaAttachmentPreview(
              fileName: 'archive.zip',
              fileType: TinaAttachmentType.archive,
              fileSize: 10485760,
              size: TinaAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            TinaAttachmentPreview(
              fileName: 'code.dart',
              fileType: TinaAttachmentType.code,
              fileSize: 4096,
              size: TinaAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            TinaAttachmentPreview(
              fileName: 'unknown.xyz',
              fileType: TinaAttachmentType.other,
              fileSize: 1024,
              size: TinaAttachmentPreviewSize.small,
              onDownload: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    ),
  );
}
