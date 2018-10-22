// =====================================================================
//   LABEL STYLE SHEET
// =====================================================================

// FONT SET FOR UBUNTU BUILD
@sans: "Ubuntu Regular";
@sans_bld: "Ubuntu Medium";
@sans_italic: "Ubuntu Italic";
@sans_lt_italic: "Ubuntu Light Italic";
@sans_lt: "Ubuntu Light";

// FONT SET FOR OSX BUILD
// @sans: "Open Sans Regular";
// @sans_bld: "Open Sans Semibold";
// @sans_italic: "Open Sans Semibold Italic";
// @sans_lt_italic: "Open Sans Italic";
// @sans_lt: "Open Sans Light";
@native_label: #cc8400;
@path_label: #4f3c35;
@park_label: #487229;
@park_halo: #e4eddd;

@name: [name];
@admin_name: [name];
@state_name: [state_name];
@county_name: [county_nam];
@water_name: [gnis_name];
@waterbody_name: [GNIS_NAME];
@road_name: [name]+"  "+[ref];
@rail_name: [operator]+' '+[name];
@usda_name: [wilderne_1];

// =====================================================================
//   ADMIN BOUNDARY LABELS
// =====================================================================

#admin_L1_label {
  [zoom=8] {
    text-name: @state_name;
    text-face-name: @sans;
    text-fill: @admin;
    text-size: 16;
    [@state_name = 'Maryland'] { text-dy: -25; }
  }
}

.admin_L2_label {
  line-opacity: 0;
  [zoom>=15] { 
    line-width: 1;
    text-name: @county_name;
  	text-face-name: @sans;
    text-fill: @admin_2;
    text-size: 12;
    text-placement: line;
    text-dy: -10;
    text-spacing: 800;
  } 
}

.admin_L3_label {
  // MILITARY
  [ftype=673] {
    [shape_area>0.001][zoom>=12] {
      text-name: @admin_name;
      text-face-name: @sans_bld;
      text-fill: @military;
      text-size: 14;
      text-wrap-width: 45;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 80%);
      text-halo-rasterizer: fast;
      text-allow-overlap: true;
      [zoom>=15] { 
        text-size: 14;
        text-face-name: @sans_bld;
        text-fill: @military;
        text-halo-radius: 0;
        text-placement: line;
        text-dy: -10;
        text-halo-rasterizer: fast;
      }
    }
    [shape_area<=0.001][shape_area>0.0001][zoom>=14] {
      text-name: @admin_name;
      text-face-name: @sans_bld;
      text-fill: @military;
      text-size: 14;
      text-wrap-width: 45;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 80%);
      text-halo-rasterizer: fast;
      [zoom>=15] { 
        text-size: 14;
        text-face-name: @sans_bld;
        text-fill: @military;
        text-halo-radius: 0;
        text-placement: line;
        text-dy: -10;
        text-halo-rasterizer: fast;
      }
    }
    [shape_area<=0.0001][zoom>=15] {
      text-name: @admin_name;
      text-face-name: @sans_bld;
      text-fill: @military;
      text-size: 14;
      text-wrap-width: 30;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 80%);
      text-halo-rasterizer: fast;
      [zoom>=15] { 
        text-size: 14;
        text-face-name: @sans_bld;
        text-fill: @military;
        text-halo-radius: 0;
        text-placement: line;
        text-dy: -10;
        text-halo-rasterizer: fast;
      }
    }
  }
  // PARKS
  [ftype=671],
  [ftype=674],  
  [ftype=676] {
    [shape_area>0.01][zoom>=10] {
      text-name: @admin_name;
      text-face-name: @sans_bld;
      text-fill: @park_label;
      text-size: 12;
      text-wrap-width: 45;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 80%);
      text-halo-rasterizer: fast;
      text-placement: interior;
      [zoom>=13] { text-size: 13; }
      [zoom>=14] { text-size: 15; }
      [zoom>=15] { 
        text-size: 14;
        text-face-name: @sans_bld;
        text-fill: @park_label;
        text-halo-radius: 0;
        text-placement: line;
        text-dy: -10;
        text-min-distance: 25;
        text-halo-rasterizer: fast;
      }
    }
    [shape_area<=0.01][shape_area>0.001][zoom>=12] {
      text-name: @admin_name;
      text-face-name: @sans_bld;
      text-fill: @park_label;
      text-size: 12;
      text-wrap-width: 45;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 80%);
      text-halo-rasterizer: fast;
      text-placement: interior;
      [zoom<13] { text-size: 13; }
      [zoom>=14] { text-size: 15; }
      [zoom>=15] { 
        text-size: 14;
        text-face-name: @sans_bld;
        text-fill: @park_label;
        text-halo-radius: 0;
        text-placement: line;
        text-dy: -10;
        text-min-distance: 25;
        text-halo-rasterizer: fast;
      }
    }
    [shape_area<=0.001][shape_area>0.0001][zoom>=13] {
      text-name: @admin_name;
      text-face-name: @sans_bld;
      text-fill: @park_label;
      text-size: 14;
      text-wrap-width: 30;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 80%);
      text-halo-rasterizer: fast;
      text-placement: interior;
      [zoom>=15] { 
        text-size: 14;
        text-face-name: @sans_bld;
        text-fill: @park_label;
        text-halo-radius: 0;
        text-placement: line;
        text-dy: -10;
        text-halo-rasterizer: fast;
      }
    }
    [shape_area<=0.0001][zoom>=14] {
      text-name: @admin_name;
      text-face-name: @sans_bld;
      text-fill: @park_label;
      text-size: 14;
      text-wrap-width: 30;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 80%);
      text-halo-rasterizer: fast;
      text-placement: interior;
      [zoom>=15] { 
        text-size: 14;
        text-face-name: @sans_bld;
        text-fill: @park_label;
        text-halo-radius: 0;
        text-placement: line;
        text-dy: -10;
        text-halo-rasterizer: fast;
      }
    }
  }
}

// NATIVE RESERVATION
.admin_L4_label {
  [shape_area>0.001][zoom>=12] {
    text-name: @admin_name;
    text-face-name: @sans_bld;
    text-fill: @native_label;
    text-size: 14;
    text-wrap-width: 45;
    text-halo-radius: 2.5;
    text-halo-fill: fadeout(@land, 80%);
    text-halo-rasterizer: fast;
    [zoom>=15] { 
      text-size: 14;
      text-face-name: @sans_bld;
      text-fill: @native_label;
      text-halo-radius: 0;
      text-placement: line;
      text-dy: -10;
      text-halo-rasterizer: fast;
    }
  }
  [shape_area<=0.001][shape_area>0.0001][zoom>=14] {
    text-name: @admin_name;
    text-face-name: @sans_bld;
    text-fill: @native_label;
    text-size: 14;
    text-wrap-width: 45;
    text-halo-radius: 2.5;
    text-halo-fill: fadeout(@land, 80%);
    text-halo-rasterizer: fast;
    [zoom>=15] { 
      text-size: 14;
      text-face-name: @sans_bld;
      text-fill: @native_label;
      text-halo-radius: 0;
      text-placement: line;
      text-dy: -10;
      text-halo-rasterizer: fast;
    }
  }
  [shape_area<=0.0001][zoom>=15] {
    text-name: @admin_name;
    text-face-name: @sans_bld;
    text-fill: @native_label;
    text-size: 14;
    text-wrap-width: 30;
    text-halo-radius: 2.5;
    text-halo-fill: fadeout(@land, 80%);
    text-halo-rasterizer: fast;
    [zoom>=15] { 
      text-size: 14;
      text-face-name: @sans_bld;
      text-fill: @native_label;
      text-halo-radius: 0;
      text-placement: line;
      text-dy: -10;
      text-halo-rasterizer: fast;
    }
  }
}

// PRISONS
#prison_label {
  [zoom>=17] {
    text-name: @admin_name;
    text-face-name: @sans;
    text-fill: @military;
    text-size: 10;
    text-wrap-width: 45;
    text-line-spacing: -2;
    text-halo-radius: 2;
    text-halo-fill: @text_case;
    text-halo-rasterizer: fast; 
  }
}

// USDA WILDERNESS AREAS
#wilderness_area_label {
  [zoom>=12] {
    text-name: @usda_name;
    text-face-name: @sans_bld;
    text-fill: @park_label;
    text-size: 12;
    text-wrap-width: 45;
    text-halo-radius: 2.5;
    text-halo-fill: fadeout(@land, 80%);
    text-halo-rasterizer: fast;
    text-placement: interior;
    [zoom>=15] { 
      text-size: 12;
      text-face-name: @sans_bld;
      text-fill: @park_label;
      text-halo-radius: 0;
      text-placement: line;
      text-dy: -10;
      text-min-distance: 25;
      text-halo-rasterizer: fast;
    }
  }
}

// LOCAL PARKS
#park_label {
  [zoom>=15] {
    [@boundary!='national_park'] {
      [@name!='Prince William Forest Park'] {
        text-name: @name;
        text-face-name: @sans;
        text-fill: @park_label;
        text-size: 10;
        text-wrap-width: 45;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @park_halo;
        text-halo-rasterizer: fast; 
      }
    }
  }
}

// =====================================================================
//   CITY, TOWN, VILLAGE LABELS
// =====================================================================

#place {
  [place='city'] {
    [zoom>=9] {
      text-name: @name;
      text-face-name: @sans;
      text-size: 15;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 60%);
      text-halo-rasterizer: fast;
      text-placement-type: simple;
      text-placements: "N,S,E,W,NE,SE,NW,SW";
    }
    [zoom>=11] { text-size: 16; }
    [zoom>=14] { text-size: 18; }
    [zoom>=17] { text-size: 24; }
  }
  [place="town"] {
    [zoom>=11] {
      text-name: @name;
      text-face-name: @sans;
      text-size: 12;
      text-opacity: 0.85;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 30%);
      text-halo-rasterizer: fast;
    }
    [zoom>=12] { text-size: 14; }
    [zoom>=13] { text-size: 16; }
    [zoom>=14] { text-size: 18; }
  }
  [place="village"] {
    [zoom>=12] {
      text-name: @name;
      text-face-name: @sans;
      text-size: 12;
      text-opacity: 0.85;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 30%);
      text-halo-rasterizer: fast;
    }
    [zoom>=13] { text-size: 12; }
    [zoom>=14] { text-size: 14; }
    [zoom>=15] { text-size: 15; }
  }
  [place="hamlet"] {
  	[zoom>=14] {
      text-name: @name;
      text-face-name: @sans;
      text-size: 12;
      text-opacity: 0.85;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 30%);
      text-halo-rasterizer: fast;
    }
    [zoom>=17] { text-size: 15; }
  }
}

// =====================================================================
//   ROAD AND TRANSPORT LABELS
// =====================================================================

#road_label {
  [highway="motorway"],
  [highway="trunk"],
  [highway="primary"] {
    [zoom>=14] {
      text-name: @road_name;
      text-face-name: @sans;
      text-placement: line;
      text-size: 12;
      text-halo-radius: 2.5;
      text-halo-fill: @text_case;
      text-halo-rasterizer: fast;
      text-dy: -10;
      text-min-distance: 25;
      [zoom>=17] { 
        text-size: 14;
        text-dy: 0;
        text-halo-radius: 2.75;
        text-character-spacing: 0.5;
      }
    }
  }
  [highway="secondary"],
  [highway="tertiary"] {
    [zoom>=15] {
      text-name: @road_name;
  	  text-face-name: @sans;
      text-placement: line;
      text-size: 11;
      text-halo-radius: 2.5;
      text-halo-fill: @text_case;
      text-halo-rasterizer: fast;
      text-dy: -10;
      text-min-distance: 25;
      [zoom>=17] { 
        text-size: 12; 
      	text-dy: -10;
        text-character-spacing: 0.5;
      }
    }
  }
  [highway='motorway_link'],
  [highway='trunk_link'],
  [highway='primary_link'],
  [highway="secondary_link"],
  [highway="tertiary_link"],
  [highway='residential_link'],
  [highway='unclassified'],
  [highway='residential'],
  [highway='residential;serv'],
  [highway='pedestrian'],
  [highway='living_street'],
  [highway='road'],
  [highway='service'],
  [highway='access'],
  [highway='raceway'],
  [highway='bus_guideway'] {
    [zoom>=15] {
      text-name: @road_name;
      text-face-name: @sans;
      text-placement: line;
      text-size: 10;
      text-halo-radius: 2;
      text-halo-fill: @text_case;
      text-halo-rasterizer: fast;
      text-dy: -10;
      text-min-distance: 25;
      text-character-spacing: 0.5;
    }
  }
  [highway='track'],
  [highway='construction'] {
    [zoom>=15] {
      text-name: @road_name;
      text-face-name: @sans;
      text-placement: line;
      text-size: 10;
      text-halo-radius: 2;
      text-halo-fill: @text_case;
      text-halo-rasterizer: fast;
      text-dy: -10;
      text-min-distance: 25;
      text-character-spacing: 0.5;
    }
  }
}

#path_label {
  [zoom>=15] {
    text-name: @name;
    text-face-name: @sans;
    text-fill: @path_label;
    text-placement: line;
    text-size: 10;
    text-halo-radius: 2;
    text-halo-fill: @text_case;
    text-halo-rasterizer: fast;
    text-dy: -10;
    text-min-distance: 25;
    text-character-spacing: 0.5;
  }
}

#rail_label {
  [zoom>=15] {
    text-name: @rail_name;
    text-face-name: @sans;
    text-placement: line;
    text-size: 10;
    text-halo-radius: 2;
    text-halo-fill: @text_case;
    text-halo-rasterizer: fast;
    text-dy: -10;
    text-min-distance: 500;
    text-character-spacing: 0.5;
  }
}

// =====================================================================
//   WATER FEATURE LABELS
// =====================================================================

.water_way_label {
  // TEMP: block labeling on articial flow lines until filter written
  [FCODE!=55800],
  [FCODE!=33400] {
    [zoom>=15] {
      text-name: @waterbody_name;
      text-face-name: @sans_italic;
      text-placement: line;
      text-fill: @water_dark;
      text-character-spacing: 1.5;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      text-halo-rasterizer: fast;
      text-dy: -5;
      [zoom>=16] { text-size: 13; }
    }
  }
}

.water_area_label {
  [shape_area>0.001] {
    [zoom>=10] {
      text-name: @water_name;
      text-face-name: @sans_italic;
      text-size: 12;
      text-fill: @water_dark;
      text-character-spacing: 1.5;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      text-halo-rasterizer: fast;
      text-wrap-width: 50;
      [zoom>=15] { text-size: 16; }
    }
  }
  [shape_area<0.001][shape_area>0.0001] {
    [zoom>=12] {
      text-name: @water_name;
      text-face-name: @sans_italic;
      text-fill: @water_dark;
      text-placement: interior;
      text-size: 12;
      text-character-spacing: 1.5;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      text-halo-rasterizer: fast;
      text-wrap-width: 50;
      [zoom>=15] { text-size: 16; }
    }
  }  
  [shape_area<0.0001] {
    [zoom>=15] {
   	  text-name: @water_name;
      text-face-name: @sans_italic;
      text-fill: @water_dark;
      text-placement: interior;
      text-size: 12;
      text-character-spacing: 1.5;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      text-halo-rasterizer: fast;
      text-wrap-width: 50;
    }
  }
}

.water_body_label{
  [Shape_Area>0.001] {
    [zoom>=10] {
      text-name: @waterbody_name;
      text-face-name: @sans_italic;
      text-size: 12;
      text-fill: @water_dark;
      text-character-spacing: 1.5;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      text-halo-rasterizer: fast;
      text-wrap-width: 50;
      [zoom>=15] { text-size: 16; }
    }
  }
  [Shape_Area<0.001][Shape_Area>0.0001] {
    [zoom>=12] {
      text-name: @waterbody_name;
      text-face-name: @sans_italic;
      text-fill: @water_dark;
      text-placement: interior;
      text-size: 12;
      text-character-spacing: 1.5;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      text-halo-rasterizer: fast;
      text-wrap-width: 50;
      [zoom>=15] { text-size: 16; }
    }
  }  
  [Shape_Area<0.0001] {
    [zoom>=15] {
   	  text-name: @waterbody_name;
      text-face-name: @sans_italic;
      text-fill: @water_dark;
      text-placement: interior;
      text-size: 12;
      text-character-spacing: 1.5;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      text-halo-rasterizer: fast;
      text-wrap-width: 50;
    }
  }
}