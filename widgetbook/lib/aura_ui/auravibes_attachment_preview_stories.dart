import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Aura Attachment Preview',
  type: AuraAttachmentPreview,
)
Widget imageAttachmentUseCase(BuildContext context) {
  return AuraAttachmentPreview(
    fileName: context.knobs.string(
      label: 'file name',
      initialValue: 'document.pdf',
    ),
    fileType: context.knobs.object.dropdown(
      label: 'file type',
      options: AuraAttachmentType.values,
      labelBuilder: (value) => value.name,
    ),
    fileSize: context.knobs.int.input(
      label: 'file size',
      description: 'bytes of data',
      initialValue: 2048576,
    ), // 2MB
    thumbnailUrl: context.knobs.stringOrNull(
      label: 'thumbnail url',
      initialValue: 'https://picsum.photos/400/300',
    ),
    size: context.knobs.object.dropdown(
      label: 'size',
      options: AuraAttachmentPreviewSize.values,
      initialOption: AuraAttachmentPreviewSize.medium,
      labelBuilder: (value) => value.name,
    ),
    onDownload: () {},
    onRemove: () {},
    downloadProgress: context.knobs.doubleOrNull.slider(
      label: 'downloadProgress',
      min: 0,
      max: 1,
      description: 'the progress of the download',
      initialValue: null,
    ),
    isDownloading: context.knobs.boolean(
      label: 'isDownloading',
      initialValue: false,
    ),
  );
}
