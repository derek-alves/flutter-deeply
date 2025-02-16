## Repaint Boundary

1. A [RepaintBoundary](https://api.flutter.dev/flutter/widgets/RepaintBoundary-class.html?ref=lazebny.io) is a special marker in the render tree that tells Flutter to limit the painting area. When a widget is wrapped with a **RepaintBoundary**, a new layer is created in the rendering engine, isolating itself and its children from the rest of the tree.

2. Therefore, any repaints that happen inside the repaint boundary will not trigger repaints to other widgets in the application. Conversely, if the widgets outside are repainted, the content inside the repaint boundary won't be affected.

3. Even a small paint change can potentially affect a large portion of the tree. For example, CircularProgressIndicator can cause the entire tree to be repainted.

4. [RepaintBoundary](https://api.flutter.dev/flutter/widgets/RepaintBoundary-class.html) has the further side-effect of possibly hinting to the engine that it should further optimize animation performance if the render subtree behind the [RepaintBoundary](https://api.flutter.dev/flutter/widgets/RepaintBoundary-class.html) is sufficiently complex and is static while the surrounding tree changes frequently. In those cases, the engine may choose to pay a one time cost of rasterizing and caching the pixel values of the subtree for faster future GPU re-rendering speed.

5. (INTERNAL USAGES)Several framework widgets insert [RepaintBoundary](https://api.flutter.dev/flutter/widgets/RepaintBoundary-class.html) widgets to mark natural separation points in applications. For instance, contents in Material Design drawers typically don't change while the drawer opens and closes, so repaints are automatically contained to regions inside or outside the drawer when using the [Drawer](https://api.flutter.dev/flutter/material/Drawer-class.html) widget during transitions.
