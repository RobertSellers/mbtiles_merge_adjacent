// =====================================================================
//   UTILITY STYLE SHEET
// =====================================================================

@util: #717171;
@util_text: #666;

#util_power {
  [zoom>=12] {
    line-width: 1;
    line-opacity: 0.25;
    line-dasharray: 4, 4, 2;
    line-color: @util;
  }
  [zoom>=15] {
    line-width: 1.5;
    line-opacity: 0.6;
    line-dasharray: 4, 4, 2;
    line-color: @util;
    ::label {
      text-name: "'Power Line'";
      text-face-name: @sans;
      [zoom<=14] { text-opacity: 0; }
      [zoom>=15] { 
        text-avoid-edges: true;
        text-placement: line;
        text-fill: @util_text;
        text-size: 10;
        text-halo-fill: fadeout(@land,40);
        text-halo-radius: 2;
        text-halo-rasterizer: fast;
        text-min-distance: 100;
      }
      [zoom>=16] { text-size: 12; }
    }
  } 
}

#util_pipeline {
  [zoom>=12] {
    line-width: 1;
    line-opacity: 0.25;
    line-dasharray: 4, 4, 2;
    line-color: @util;

  }
  [zoom>=15] {
    line-width: 1.5;
    line-opacity: 0.6;
    line-dasharray: 4, 4, 2;
    line-color: @util;
    ::label {
      text-name: "'Pipeline'";
      text-face-name: @sans;
      [zoom<=14] { text-opacity: 0; }
      [zoom>=15] { 
        text-avoid-edges: true;
        text-placement: line;
        text-fill: @util_text;
        text-size: 10;
        text-halo-fill: fadeout(@land,40);
        text-halo-radius: 2;
        text-halo-rasterizer: fast;
        text-min-distance: 100;
      }
      [zoom>=16] { text-size: 12; }
    }
  } 
}