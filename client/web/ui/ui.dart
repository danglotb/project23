library ui;

import '../utils/utils.dart' as utils;
import '../core/core.dart' as core;
import 'dart:html' as html;

part 'event.dart';

/*
 * Component
 */
part 'component/component.dart';
part 'component/container.dart';
part 'component/interactive_component.dart';
part 'component/selectable_component.dart';
part 'component/bidon.dart';

/*
 * Style
 */
part 'style/component_style.dart';
part 'style/container_style.dart';
part 'style/interactive_component_style.dart';
part 'style/selectable_component_style.dart';
part 'style/bidon_style.dart';

/*
 * Layout
 */
part 'layout/layout.dart';
part 'layout/passif_layout.dart';
part 'layout/vertical_layout.dart';

typedef void ListenerStateFunc(bool);
