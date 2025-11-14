import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Image Attachment', type: AuraAttachmentPreview)
Widget imageAttachmentUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'vacation_photo.jpg',
      fileType: AuraAttachmentType.image,
      fileSize: 2048576, // 2MB
      thumbnailUrl: 'https://picsum.photos/400/300',
      size: AuraAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Video Attachment', type: AuraAttachmentPreview)
Widget videoAttachmentUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'presentation_demo.mp4',
      fileType: AuraAttachmentType.video,
      fileSize: 15728640, // 15MB
      size: AuraAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'PDF Document', type: AuraAttachmentPreview)
Widget pdfDocumentUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'project_requirements.pdf',
      fileType: AuraAttachmentType.pdf,
      fileSize: 1048576, // 1MB
      size: AuraAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Audio File', type: AuraAttachmentPreview)
Widget audioFileUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'meeting_recording.mp3',
      fileType: AuraAttachmentType.audio,
      fileSize: 5242880, // 5MB
      size: AuraAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Spreadsheet', type: AuraAttachmentPreview)
Widget spreadsheetUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'budget_analysis.xlsx',
      fileType: AuraAttachmentType.spreadsheet,
      fileSize: 512000, // 500KB
      size: AuraAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Presentation', type: AuraAttachmentPreview)
Widget presentationUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'quarterly_review.pptx',
      fileType: AuraAttachmentType.presentation,
      fileSize: 3145728, // 3MB
      size: AuraAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Archive File', type: AuraAttachmentPreview)
Widget archiveFileUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'project_assets.zip',
      fileType: AuraAttachmentType.archive,
      fileSize: 10485760, // 10MB
      size: AuraAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Code File', type: AuraAttachmentPreview)
Widget codeFileUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'main.dart',
      fileType: AuraAttachmentType.code,
      fileSize: 4096, // 4KB
      size: AuraAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Document File', type: AuraAttachmentPreview)
Widget documentFileUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'meeting_notes.docx',
      fileType: AuraAttachmentType.document,
      fileSize: 256000, // 250KB
      size: AuraAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Other File Type', type: AuraAttachmentPreview)
Widget otherFileTypeUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'unknown_file.xyz',
      fileType: AuraAttachmentType.other,
      fileSize: 1024, // 1KB
      size: AuraAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Downloading State', type: AuraAttachmentPreview)
Widget downloadingStateUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'large_dataset.csv',
      fileType: AuraAttachmentType.spreadsheet,
      fileSize: 52428800, // 50MB
      size: AuraAttachmentPreviewSize.medium,
      isDownloading: true,
      downloadProgress: 0.65,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Downloading Indeterminate',
  type: AuraAttachmentPreview,
)
Widget downloadingIndeterminateUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'processing_file.dat',
      fileType: AuraAttachmentType.other,
      fileSize: 1048576, // 1MB
      size: AuraAttachmentPreviewSize.medium,
      isDownloading: true,
      // No downloadProgress for indeterminate progress
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Small Size', type: AuraAttachmentPreview)
Widget smallSizeUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'thumbnail.png',
      fileType: AuraAttachmentType.image,
      fileSize: 51200, // 50KB
      size: AuraAttachmentPreviewSize.small,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Large Size', type: AuraAttachmentPreview)
Widget largeSizeUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'high_resolution_image.png',
      fileType: AuraAttachmentType.image,
      fileSize: 20971520, // 20MB
      size: AuraAttachmentPreviewSize.large,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'No Actions', type: AuraAttachmentPreview)
Widget noActionsUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'readonly_document.pdf',
      fileType: AuraAttachmentType.pdf,
      fileSize: 2097152, // 2MB
      size: AuraAttachmentPreviewSize.medium,
      // No onDownload or onRemove callbacks
    ),
  );
}

@widgetbook.UseCase(name: 'Download Only', type: AuraAttachmentPreview)
Widget downloadOnlyUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'shared_resource.zip',
      fileType: AuraAttachmentType.archive,
      fileSize: 7340032, // 7MB
      size: AuraAttachmentPreviewSize.medium,
      onDownload: () {},
      // No onRemove callback
    ),
  );
}

@widgetbook.UseCase(name: 'Remove Only', type: AuraAttachmentPreview)
Widget removeOnlyUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'temp_file.tmp',
      fileType: AuraAttachmentType.other,
      fileSize: 1024, // 1KB
      size: AuraAttachmentPreviewSize.medium,
      // No onDownload callback
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Long Filename', type: AuraAttachmentPreview)
Widget longFilenameUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName:
          'this_is_a_very_long_filename_that_should_be_truncated_properly_in_the_ui.pdf',
      fileType: AuraAttachmentType.pdf,
      fileSize: 1048576, // 1MB
      size: AuraAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'No File Size', type: AuraAttachmentPreview)
Widget noFileSizeUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'unknown_size.dat',
      fileType: AuraAttachmentType.other,
      // No fileSize provided
      size: AuraAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Image with Broken Thumbnail',
  type: AuraAttachmentPreview,
)
Widget brokenThumbnailUseCase(BuildContext context) {
  return Center(
    child: AuraAttachmentPreview(
      fileName: 'corrupted_image.jpg',
      fileType: AuraAttachmentType.image,
      fileSize: 1048576, // 1MB
      thumbnailUrl: 'https://invalid-url-that-will-fail.com/image.jpg',
      size: AuraAttachmentPreviewSize.medium,
      onDownload: () {},
      onRemove: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'All Sizes Comparison', type: AuraAttachmentPreview)
Widget allSizesComparisonUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text('Small Size', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      AuraAttachmentPreview(
        fileName: 'small_file.pdf',
        fileType: AuraAttachmentType.pdf,
        fileSize: 512000, // 500KB
        size: AuraAttachmentPreviewSize.small,
        onDownload: () {},
        onRemove: () {},
      ),
      const SizedBox(height: 24),
      const Text('Medium Size', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      AuraAttachmentPreview(
        fileName: 'medium_file.pdf',
        fileType: AuraAttachmentType.pdf,
        fileSize: 1048576, // 1MB
        size: AuraAttachmentPreviewSize.medium,
        onDownload: () {},
        onRemove: () {},
      ),
      const SizedBox(height: 24),
      const Text('Large Size', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      AuraAttachmentPreview(
        fileName: 'large_file.pdf',
        fileType: AuraAttachmentType.pdf,
        fileSize: 5242880, // 5MB
        size: AuraAttachmentPreviewSize.large,
        onDownload: () {},
        onRemove: () {},
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'File Type Showcase', type: AuraAttachmentPreview)
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
            AuraAttachmentPreview(
              fileName: 'photo.jpg',
              fileType: AuraAttachmentType.image,
              fileSize: 2048576,
              size: AuraAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            AuraAttachmentPreview(
              fileName: 'video.mp4',
              fileType: AuraAttachmentType.video,
              fileSize: 15728640,
              size: AuraAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            AuraAttachmentPreview(
              fileName: 'audio.mp3',
              fileType: AuraAttachmentType.audio,
              fileSize: 5242880,
              size: AuraAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            AuraAttachmentPreview(
              fileName: 'document.docx',
              fileType: AuraAttachmentType.document,
              fileSize: 256000,
              size: AuraAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            AuraAttachmentPreview(
              fileName: 'file.pdf',
              fileType: AuraAttachmentType.pdf,
              fileSize: 1048576,
              size: AuraAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            AuraAttachmentPreview(
              fileName: 'sheet.xlsx',
              fileType: AuraAttachmentType.spreadsheet,
              fileSize: 512000,
              size: AuraAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            AuraAttachmentPreview(
              fileName: 'slides.pptx',
              fileType: AuraAttachmentType.presentation,
              fileSize: 3145728,
              size: AuraAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            AuraAttachmentPreview(
              fileName: 'archive.zip',
              fileType: AuraAttachmentType.archive,
              fileSize: 10485760,
              size: AuraAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            AuraAttachmentPreview(
              fileName: 'code.dart',
              fileType: AuraAttachmentType.code,
              fileSize: 4096,
              size: AuraAttachmentPreviewSize.small,
              onDownload: () {},
            ),
            AuraAttachmentPreview(
              fileName: 'unknown.xyz',
              fileType: AuraAttachmentType.other,
              fileSize: 1024,
              size: AuraAttachmentPreviewSize.small,
              onDownload: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    ),
  );
}
