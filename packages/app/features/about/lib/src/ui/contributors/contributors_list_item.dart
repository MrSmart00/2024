import 'package:app_cores_designsystem/common_assets.dart';
import 'package:common_data/contributor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const _imageSize = 56.0;

/// コントリビューター一覧のリストアイテム
class ContributorsListItem extends StatelessWidget {
  const ContributorsListItem({
    required this.contributor,
    super.key,
  });

  final Contributor contributor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Image.network(
        contributor.avatarUrl.toString(),
        width: _imageSize,
        height: _imageSize,
        cacheWidth: _imageSize.toInt(),
        cacheHeight: _imageSize.toInt(),
        frameBuilder: (context, child, _, __) => _BorderedImage(
          child: child,
        ),
        errorBuilder: (context, error, stackTrace) => _BorderedImage(
          child: CommonAssets.logo.mainLogo.svg(
            width: 32,
            height: 32,
          ),
        ),
        fit: BoxFit.cover,
      ),
      title: Text(
        contributor.name,
        style: theme.textTheme.bodyMedium,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<Contributor>('contributor', contributor));
  }
}

class _BorderedImage extends StatelessWidget {
  const _BorderedImage({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surface,
      ),
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: child,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Widget>('child', child));
  }
}
