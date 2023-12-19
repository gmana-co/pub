# gmana-pub

## install

```yaml
flutter pub add gmana_ext
```

## usage

```dart
import 'package:gmana_ext/gmana_ext.dart';

void main() {
  print('Grapheme clusters have varying length in the underlying representation'.toSentenceCase());
  print('Grapheme clusters have varying length in the underlying representation'.toTitleCase());
  print('12.9'.toDouble);
  print('1'.toInt);
  print('md5'.md5);

  print([
    [1, 2, 3],
    [4, 5, 6]
  ].flatten());
  // [1, 2, 3, 4, 5, 6]

  print(7.max(14));
}
```
