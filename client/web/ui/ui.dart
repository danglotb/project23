library ui;

import '../utils/utils.dart' as utils;
import '../core/core.dart' as core;
import 'dart:html' as html;
import 'dart:async' as async;
import "dart:math" as math;

part 'event.dart';
part 'selectable_manager.dart';

/*
 * Component
 */
part 'component/component.dart';
part 'component/container.dart';
part 'component/interactive_component.dart';
part 'component/selectable_component.dart';
part 'component/text_input.dart';
part 'component/text_field.dart';
part 'component/toggleable_component.dart';
part 'component/button.dart';
part 'component/bidon.dart';
part 'component/cursor.dart';
part 'component/checkbox_container.dart';
part 'component/label.dart';
part 'component/text_label.dart';

/*
 * Style
 */
part 'style/component_style.dart';
part 'style/container_style.dart';
part 'style/interactive_component_style.dart';
part 'style/selectable_component_style.dart';
part 'style/text_input_style.dart';
part 'style/text_field_style.dart';
part 'style/toggleable_component_style.dart';
part 'style/button_style.dart';
part 'style/bidon_style.dart';
part 'style/cursor_style.dart';
part 'style/label_style.dart';
part 'style/text_label_style.dart';

//Basic style
part 'style/basic/basic_style_manager.dart';
part 'style/basic/basic_button_style.dart';
part 'style/basic/basic_text_field_style.dart';

//Menu style
part 'style/menu/menu_button_style.dart';


/*
 * Layout
 */
part 'layout/layout.dart';
part 'layout/passif_layout.dart';
part 'layout/vertical_layout.dart';
part 'layout/vertical_divide_layout.dart';
part 'layout/vertical_gap_layout.dart';

/*
 * Screen
 */

part 'screen/screen_menu_unlogged.dart';