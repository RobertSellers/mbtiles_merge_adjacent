// =====================================================================
//   TRANSPORT STYLE SHEET
// =====================================================================

@aeroway: #a4a4a2;
@rail: #4e4e4e;
@rail_tunnel: #9b9b9b;

@rail_point_name: [name]+' Station';

// =====================================================================
//   AEROWAY
// =====================================================================
  
#aero_line {
  line-color: @aeroway;
  line-join: bevel;
  [zoom<12]  { line-width:  0; }
  [zoom>=14] { line-width:  5; }
  [zoom>=15] { line-width:  9; }
  [zoom>=16] { line-width: 15; }
}

#aero_area {
  [aeroway='terminal'],
  [aeroway='hangar'] {
    [zoom>=14] { polygon-fill: #b9b8b4; }
    [zoom>=16] { 
      line-color: #989898; 
      line-width: 1.25;
    }
  }
}

#aero_label {
  [zoom>=14] {
    text-name: [field_2]+", "+[field_5];
    text-face-name: @sans;
    text-size: 13;
    text-wrap-width: 120;
    text-line-spacing: -2;
    text-halo-radius: 2;
    text-halo-fill: @text_case;
    text-halo-rasterizer: fast;
    [zoom>=16] { text-size: 14; }
  }
}

// =====================================================================
//   RAIL
// =====================================================================

#rail_bridge {
  [zoom>10] {
    line-width: 0.8;
    line-color: @rail;
    line-opacity: 0.5;
	[zoom>=14] {
      line-opacity: 1;
      hatch/line-width: 3;
      hatch/line-color: @rail;
      hatch/line-dasharray: 1,15; 
    }
  }
}

#rail {
  [zoom>10][type=null] {
    line-width: 0.8;
    line-color: @rail;
    line-opacity: 0.5;
	[zoom>=14] {
      line-opacity: 1;
      hatch/line-width: 3;
      hatch/line-color: @rail;
      hatch/line-dasharray: 1,15; 
    }
  }
}

#rail_tunnel {
  [zoom>10] {
    line-width: 0.8;
    line-color: @rail_tunnel;
    line-opacity: 0.5;
	[zoom>=14] {
      line-opacity: 1;
      hatch/line-width: 3;
      hatch/line-color: @rail_tunnel;
      hatch/line-dasharray: 1,15; 
    }
  } 
}

#rail_area {
  [zoom>=14] { polygon-fill: #b9b8b4; }
  [zoom>=16] { 
    line-color: #989898; 
    line-width: 1.25;
  } 
}

#rail_point {
  [zoom>=15] {
    //[public_transport='platform'],
    [railway='halt'],
    [railway='station'],
    [railway='subway_entrance'],
    [railway='tram_stop'] {
      point-opacity: 1;
      point-allow-overlap: true;
      [zoom>=17] {
        text-name: @rail_point_name;
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 45;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        text-halo-rasterizer: fast; 
        text-avoid-edges: true;
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 8;
        text-dx: 8;
      }
    }
  }
}