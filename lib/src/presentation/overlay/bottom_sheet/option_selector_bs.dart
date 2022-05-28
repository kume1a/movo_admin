import 'package:flutter/material.dart';

class OptionSelectorBS<T extends Object?> extends StatelessWidget {
  const OptionSelectorBS({
    Key? key,
    required this.options,
    required this.toStringMapper,
    this.header,
  }) : super(key: key);

  final String? header;
  final List<T> options;
  final String Function(T option) toStringMapper;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);

    return Material(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: mediaQueryData.size.height * .6,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (header != null) ...<Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  header!,
                  style: TextStyle(
                    fontSize: 16,
                    color: theme.secondaryHeaderColor,
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
                indent: 16,
                endIndent: 16,
              ),
            ],
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (_, int index) {
                  final T option = options[index];

                  return ListTile(
                    title: Text(toStringMapper.call(option)),
                    onTap: () => Navigator.of(context).maybePop(option),
                    visualDensity: VisualDensity.compact,
                  );
                },
                itemCount: options.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
