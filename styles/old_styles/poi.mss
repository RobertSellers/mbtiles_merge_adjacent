// =====================================================================
//   POI STYLE SHEET
// =====================================================================

@exit: #006747;

@benchmark: "BM "+ [elev_ft_calc] + "'";
@hsip_name: [name];
@g_class: [FEATURE_CL];
@g_name: [FEATURE_NA];
@g_name_elev: [FEATURE_NA] + ', ' + [ELEV_IN_FT];
@mine_name: [site_name];


// =====================================================================
//   BENCHMARKS
// =====================================================================

.benchmark {
  [zoom>=17] {
    marker-file: url(img/ico/cross-12.svg);
    marker-allow-overlap: true;
    marker-ignore-placement: true;
  	text-name: @benchmark;
    text-face-name: @sans;
    text-allow-overlap: true;
    text-size: 10;
    text-dy: -5;
    text-dx: -6;
  }
}

// =====================================================================
//   HSIP
// =====================================================================

#school_pub,
#school_prv,
#school_sup {
  [zoom>=15] {
    marker-file: url(img/ico/school.png);
  	[zoom>=17] {
      text-name: @hsip_name;
      text-face-name: @sans;
      text-size: 10;
      text-transform: capitalize;
      text-opacity: 0.85;
      text-wrap-width: 45;
      text-line-spacing: -2;
      text-halo-radius: 2;
      text-halo-fill: @text_case;
      text-halo-rasterizer: fast;
      text-placement-type: simple;
      text-placements: "N,S,E,W,NE,SE,NW,SW";
      text-dy: 12;
      text-dx: 12;
    }
  }
}

#school_uni {
  [zoom>=15] {
    marker-file: url(img/ico/college-18.svg);
  	[zoom>=17] {
      text-name: @hsip_name;
      text-face-name: @sans;
      text-size: 10;
      text-opacity: 0.85;
      text-transform: capitalize;
      text-wrap-width: 45;
      text-line-spacing: -2;
      text-halo-radius: 2;
      text-halo-fill: @text_case;
      text-halo-rasterizer: fast; 
      text-placement-type: simple;
      text-placements: "N,S,E,W,NE,SE,NW,SW";
      text-dy: 12;
      text-dx: 12;
    }
  }
}

#mining {
  [zoom>=15] {
    marker-file: url(img/ico/mine.png);
    [zoom>=17] {
      text-name: @mine_name;
      text-face-name: @sans;
      text-size: 10;
      text-opacity: 0.85;
      text-transform: capitalize;
      text-wrap-width: 45;
      text-line-spacing: -2;
      text-halo-radius: 2;
      text-halo-fill: @text_case;
      text-halo-rasterizer: fast;
      text-placement-type: simple;
      text-placements: "N,S,E,W,NE,SE,NW,SW";
      text-dy: 12;
      text-dx: 12;
    }
  }
}

// =====================================================================
//   GENERAL POI
// =====================================================================

#poi {
  [zoom>=15] {
    [amenity='hospital'] {
      marker-file: url(img/ico/ems.png);
      [zoom>=17] {
        text-name: @name;
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        text-halo-rasterizer: fast; 
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 12;
        text-dx: 12; 
      }
    }
    [amenity='clinic'],
    [amenity='doctors'],
    [amenity='veterinary'],
    [amenity='rescue_station'] {
      marker-file: url(img/ico/hospital.16.svg);
      [zoom>=17] {
		text-name: @name;
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        text-halo-rasterizer: fast; 
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 12;
        text-dx: 12; 
      }
    }
    [amenity='police'] {
      marker-file: url(img/ico/police.16.svg);
      [zoom>=17] {
		text-name: @name;
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        text-halo-rasterizer: fast; 
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 12;
        text-dx: 12; 
      }
    }
    [amenity='fire_station'] {
      marker-file: url(img/ico/firestation.16.svg);
      marker-fill: red;
      [zoom>=17] {
		text-name: @name;
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        text-halo-rasterizer: fast; 
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 12;
        text-dx: 12; 
      }
    }
    [tourism='camp_site'] { 
      marker-file: url(img/ico/camp.png);
      [zoom>=17] {
		text-name: @name;
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        text-halo-rasterizer: fast; 
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 12;
        text-dx: 12; 
      }
    }
    [amenity='bus_station'] {
      marker-file: url(img/ico/bus-11.svg);
      [zoom>=17] {
		text-name: @name;
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        text-halo-rasterizer: fast; 
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 12;
        text-dx: 12; 
      }
    }
    [amenity='place_of_worship'],
    [amenity='shelter'],
    [amenity='hunting_stand'],
    [tourism='wilderness_hut'],
    [tourism='alpine_hut'],
    [tourism='picnic_site'],
    [tourism='viewpoint'],
    [leisure='bird_hide'],
    [leisure='wildlife_hide'] { 
      point-opacity: 1;
      point-allow-overlap: true;
      point-ignore-placement: true;
      [zoom>=17] {
		text-name: @name;
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        text-halo-rasterizer: fast; 
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 8;
        text-dx: 8;
      }
    }
  }
}

#winter_rec {
  [zoom>=14] {
    marker-file: url(img/ico/skiing-15.svg);
    text-name: @name;
    text-face-name: @sans;
    text-size: 12;
    text-wrap-width: 60;
    text-line-spacing: -2;
    text-halo-radius: 2;
    text-halo-fill: @text_case;
    text-halo-rasterizer: fast; 
    text-dy: 12; 
    [zoom>=17] { text-size: 14; }
  }
}

// =====================================================================
//   GNIS
// =====================================================================

.gnis::main {
  [@g_class='Basin'],
  [@g_class='Beach'],
  [@g_class='Bend'],
  [@g_class='Cliff'],
  [@g_class='Crater'],
  [@g_class='Gap'],
  [@g_class='Flat'],
  [@g_class='Island'],
  [@g_class='Ridge'] {
    [zoom>=15] {
      text-name: @g_name;
      text-face-name: @sans_lt_italic;
      text-size: 10;
      text-wrap-width: 50;
      text-line-spacing: -2;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@land, 30%);
      text-halo-rasterizer: fast; 
      text-placement-type: simple;
      text-placements: "N,S,E,W,NE,SE,NW,SW";
      [zoom>=17] { text-size: 12; }
    }
  } 
}

.gnis::range {
  [zoom>=12] {
    [@g_class='Range'] {
      text-name: @g_name + ' Range';
      text-face-name: @sans_lt_italic;
      text-size: 12;
      text-wrap-width: 60;
      text-line-spacing: -2;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 60%);
      text-halo-rasterizer: fast;
      text-placement-type: simple;
      text-placements: "N,S,E,W,NE,SE,NW,SW";
      text-opacity: 0.75;
      [zoom>=15] { text-size: 13; }
      [zoom>=17] { text-size: 14; }
    }
  }
}

.gnis::valley {
  [@g_class='Valley'] {
    [zoom>=14] {
      text-name: @g_name;
      text-face-name: @sans_lt_italic;
      text-size: 11;
      text-wrap-width: 50;
      text-line-spacing: -2;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 60%);
      text-halo-rasterizer: fast;
      text-placement-type: simple;
      text-placements: "N,S,E,W,NE,SE,NW,SW";
      text-opacity: 0.75;
      [zoom>=17] { text-size: 13; }
    }
  } 
}

.gnis::summit {
  [@g_class='Arch'],
  [@g_class='Pillar'],
  [@g_class='Summit'] {
    [zoom>=14] {
      marker-file: url(img/ico/triangle-stroked-12.svg);
      [zoom>=15] {
        text-name: @g_name_elev;
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: fadeout(@land, 30%);
        text-halo-rasterizer: fast; 
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 8;
        text-dx: 8;
      }
    }
  }
}

.gnis::glacier {
  [@g_class='Glacier'] {
    [zoom>=15] {
      text-name: @g_name_elev;
      text-face-name: @sans_lt_italic;
      text-fill: @water_dark;
      text-size: 10;
      text-wrap-width: 60;
      text-line-spacing: -2;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      text-halo-rasterizer: fast; 
      text-placement-type: simple;
      text-placements: "N,S,E,W,NE,SE,NW,SW";
      [zoom>=17] { text-size: 12; }
    }
  } 
}

.gnis::cemetery {
  [@g_class='Cemetery'] { 
    [zoom>=15] {
      marker-file: url(img/ico/cemetery-12.svg);
      [zoom>=17] {
        text-name: @g_name;
        text-face-name: @sans;
        text-size: 10;
        text-opacity: 0.85;
        text-wrap-width: 45;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        text-halo-rasterizer: fast;
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 12;
        text-dx: 12;
      }
    }
  } 
}

.gnis::tower {
  [@g_class='Tower'] {
    [zoom>=15] {
      marker-file: url(img/ico/tower.svg);
      marker-allow-overlap: true;
      marker-ignore-placement: true;
    }
  }
}

.gnis::post {
  [@g_class='Post Office'] {
    [zoom>=15] {
      shield-name: '"PO"';
      shield-file: url(img/shield/default-1.svg);
      shield-face-name: @sans;
      shield-fill: black;
      shield-halo-radius: 0.05;
      [zoom>=17] {
        shield-transform: 'scale(1.25)';
      	shield-size: 12; 
      }
    }
  }
}

.gnis_crossing {
  // NOTE: RECOLOR default-4 TO ACCOUNT FOR LARGER EXIT NUMBERS
  [@g_class='Crossing'][cross_type='EXIT'] {
    [zoom>=14] {
      shield-name: @g_name;
      shield-file: url(img/shield/default-2.svg);
      shield-face-name: @sans;
      shield-fill: white;
      shield-halo-fill: white;
      shield-halo-radius: 0.25;
      [zoom>=15] {
        shield-transform: 'scale(1.25)';
        shield-size: 12;
      }
      [zoom>=17] {
        shield-transform: 'scale(1.5)';
        shield-size: 13;
        shield-halo-radius: 0.35;
      }
    }
  }
  [@g_class='Crossing'][cross_type!='EXIT'] {
    [zoom>=15] {
      text-name: @g_name;
      text-face-name: @sans_lt_italic;
      text-fill: @water_dark;
      text-size: 11;
      text-wrap-width: 50;
      text-line-spacing: -2;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 60%);
      text-halo-rasterizer: fast;
      text-placement-type: simple;
      text-placements: "N,S,E,W,NE,SE,NW,SW";
    }
  }
}