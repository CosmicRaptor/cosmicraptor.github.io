// lib/widgets/glass_text.dart
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web; // This provides web.document
import 'dart:ui_web' as ui_web;

class GlassTextWeb extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const GlassTextWeb(
      this.text, {
        super.key,
        required this.fontSize,
        this.fontWeight = FontWeight.bold,
      });

  @override
  Widget build(BuildContext context) {
    const svgNS = 'http://www.w3.org/2000/svg';
    final viewType = 'glass-text-view-${text.hashCode}-${fontSize.hashCode}';
    final clipPathId = 'svgTextPath-${text.hashCode}-${fontSize.hashCode}';

    ui_web.platformViewRegistry.registerViewFactory(
      viewType,
          (int viewId) {
        final container = web.document.createElement('div') as web.HTMLDivElement
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.position = 'relative';

        final fontWeightValue =
        fontWeight.toString().replaceAll('FontWeight.w', '');

        // 1. THE SVG CONTAINER
        final svgElement =
        web.document.createElementNS(svgNS, 'svg') as web.SVGSVGElement
          ..setAttribute('height', '100%')
          ..setAttribute('width', '100%')
          ..style.position = 'absolute';

        // 2. THE DEFINITIONS (for the blur mask)
        final defs =
        web.document.createElementNS(svgNS, 'defs') as web.SVGDefsElement;

        final clipPath = web.document.createElementNS(svgNS, 'clipPath')
        as web.SVGClipPathElement
          ..id = clipPathId;

        final textMask =
        web.document.createElementNS(svgNS, 'text') as web.SVGTextElement
          ..textContent = text
          ..setAttribute('x', '50%')
          ..setAttribute('y', '50%')
          ..setAttribute('dominant-baseline', 'middle')
          ..setAttribute('text-anchor', 'middle')
          ..setAttribute('font-family', 'system-ui, -apple-system, sans-serif')
          ..setAttribute('font-size', '${fontSize}px')
          ..setAttribute('font-weight', fontWeightValue);

        // Assemble the invisible mask
        clipPath.append(textMask);
        defs.append(clipPath);

        // 3. THE VISIBLE BORDER (a new <text> element)
        // We create a second text element that will be visible
        final textBorder =
        web.document.createElementNS(svgNS, 'text') as web.SVGTextElement
          ..textContent = text
        // Use the EXACT same position attributes as the mask
          ..setAttribute('x', '50%')
          ..setAttribute('y', '50%')
          ..setAttribute('dominant-baseline', 'middle')
          ..setAttribute('text-anchor', 'middle')
          ..setAttribute('font-family', 'system-ui, -apple-system, sans-serif')
          ..setAttribute('font-size', '${fontSize}px')
          ..setAttribute('font-weight', fontWeightValue)
        // Style it as a border
          ..setAttribute('fill', 'transparent')
          ..setAttribute('stroke', 'rgba(255, 255, 255, 0.7)')
          ..setAttribute('stroke-width', '1px');


        // 4. THE BLURRED DIV (clipped by the mask)
        final clippedDiv =
        web.document.createElement('div') as web.HTMLDivElement
          ..style.position = 'absolute'
          ..style.top = '0'
          ..style.left = '0'
          ..style.bottom = '0'
          ..style.right = '0'
          ..style.background = 'rgba(255, 255, 255, 0.15)'
          ..style.setProperty('backdrop-filter', 'blur(8px)')
          ..style.setProperty('-webkit-backdrop-filter', 'blur(8px)')
          ..style.setProperty('clip-path', 'url(#$clipPathId)');

        // Add elements to the SVG container
        svgElement.append(defs);
        svgElement.append(textBorder); // Add the visible border

        // Add elements to the main container
        container.append(clippedDiv); // This sits *under* the SVG
        container.append(svgElement);   // The SVG sits on top

        return container;
      },
      isVisible: true,
    );

    return SizedBox(
      height: fontSize * 1.5,
      width: double.infinity,
      child: HtmlElementView(viewType: viewType),
    );
  }
}

