// =====================================================================
//   PRIMARY STYLE SHEET
// =====================================================================

@land: #f4efe1;
@water: #ccdddd;
@wetland: #c0d5cc;
@crop: #eeeed4;
@grass: #e7ebd1;
@wood: #d4e2c6;
@snow: #f4f8ff;
@rock: #c8cecc;
@sand: #ffffee;

@admin: #2e2f32;
@admin_2: #88a;

@cemetery: #b7b7b7;
@park: #609737;
@military: #9a3131;
@native: #e59400;
@z8_military: #976561;
@z8_park: #849c72;
@z8_native: #d4a244;

@boundary: [boundary];

@building: #b9b8b4;
@building_outline: #989898;

@contour: #964B00;
@contour_text: #655334;

Map {
  background-color: @water;
}

#mask{
  polygon-fill: @water
}

// =====================================================================
//   ADMIN BOUNDARIES
// =====================================================================

// STATE
#admin_L1 {
  line-color: @admin;
  line-width: 0.25;
  line-opacity: 0.25;
  [zoom>=16] { line-width: 0.5; }
  [zoom>=17] { line-width: 0.75; }
}

// COUNTY
.admin_L2 {
  line-color: @admin_2;
  line-width: 0.075;
  [zoom>12] {
  	line-width: 0.1;
    line-opacity: 0.5;
  }
  [zoom>=13] {
  	line-width: 0.25;
  }
  [zoom>=14] {
    line-width: 0.5;
  }
}

// PARK, MILITARY, CEMETERY
.admin_L3 {
  [zoom>=8] {
    // ftype=673 -> DOD
    [ftype=673] {
      line-join: round;
      line-color: @military;
      line-width: 1.25;
      line-dasharray: 10,3,3,3;
      line-opacity: 0;
      polygon-fill: @z8_military;
      polygon-opacity: 0.15;
      [zoom>=11] { polygon-opacity: 0.25; }
      [zoom>=12] {
        line-opacity: 1;
      }
      [zoom>=13] {
        polygon-opacity: 0.15;
        ::outline {
          line-join: bevel;
          line-width: 15;
          line-offset: -7.5;
          line-color: @military;
          line-opacity: 0.1;
        }
      }
      [zoom>=14] {
        polygon-opacity: 0.125;
        line-width: 2;
        ::outline {
          line-width: 20;
          line-offset: -10;
          line-opacity: 0.15;
        }
      }
      [zoom>=15] { polygon-opacity: 0.1; }
      [zoom>=17] {
        ::outline {
          line-width: 30;
          line-offset: -15;
        }
      }
    }
    // ftype=674 -> NPS
    // ftype=675 -> USFS
    // ftype=676 -> USFWS
    [ftype=674],
    [ftype=671],
    [ftype=676] {
      [@admin_name!='Blue Ridge Parkway'] {
        line-join: round;
        line-color: @park;
        line-width: 1.25;
        line-dasharray: 10,2,2,2;
        line-opacity: 0;
        polygon-fill: @z8_park;
        polygon-opacity: 0.2;
        [zoom>=11] { polygon-opacity: 0.25; }
        [zoom>=12] { line-opacity: 1; }
        [zoom>=13] {
          polygon-opacity: 0.15;
          ::outline {
            line-width: 15;
            line-offset: -7.5;
            line-color: @park;
            line-opacity: 0.1;
          }
        }
        [zoom>=14] {
          polygon-opacity: 0.125;
          line-width: 2;
          ::outline {
            line-width: 20;
            line-offset: -10;
            line-opacity: 0.15;
          }
        }
        [zoom>=15] {
          polygon-opacity: 0;
          ::outline { line-opacity: 0.25; }
        }
        [zoom>=17] {
          ::outline {
            line-width: 30;
            line-offset: -15;
          }
        }
      }
    }
    // ftype=670 -> Cemetery
	[ftype=670] {
      polygon-fill: @cemetery;
      polygon-opacity: 0;
      [zoom>=13] { polygon-opacity: 0.25; }
    }
  }
}

// NATIVE RESERVATION
.admin_L4 {
  [zoom>=8] {
    line-join: round;
    line-color: @native;
    line-width: 1.25;
    line-dasharray: 10,2,2,2;
    line-opacity: 0;
    polygon-fill: @z8_native;
    polygon-opacity: 0.2;
    [zoom>=11] { polygon-opacity: 0.25; }
    [zoom>=12] { line-opacity: 1; }
    [zoom>=13] {
      polygon-opacity: 0.15;
      ::outline {
        line-width: 15;
        line-offset: -7.5;
        line-color: @native;
        line-opacity: 0.1;
      }
    }
    [zoom>=14] {
      polygon-opacity: 0.125;
      line-width: 2;
      ::outline {
        line-width: 20;
        line-offset: -10;
        line-opacity: 0.15;
      }
    }
    [zoom>=15] {
      polygon-opacity: 0;
      ::outline { line-opacity: 0.25; }
    }
    [zoom>=17] {
      ::outline {
        line-width: 30;
        line-offset: -15;
      }
    }
  }
}

#park {
  [zoom>=12] {
    [@boundary!='national_park'] {
      [@name!='Prince William Forest Park'] {
        polygon-fill: @park;
        polygon-opacity: 0.15;
        [zoom>=15] {
          line-join: round;
          line-color: @park;
          line-width: 1.25;
          line-opacity: 1;
          [zoom>=17] {
            line-dasharray: 10,2,2,2;
            line-offset: -2;
          }
        }
      }
    }
  }
}

#wilderness_area {
  [zoom>=10] {
    line-join: round;
    line-color: @park;
    line-width: 1.25;
    line-dasharray: 10,2,2,2;
    line-opacity: 0;
    polygon-fill: @z8_park;
    polygon-opacity: 0.25;
    [zoom>=14] {
      polygon-opacity: 0.15;
      line-opacity: 1;
      line-width: 2;
    }
  }
}

#prison {
  [zoom>=15] {
    line-color: @military;
  	line-width: 0.85;
  	line-dasharray: 10,3,3,3;
  }
}


// =====================================================================
//   LAND COVER
// =====================================================================

#landcover_L1 {
  polygon-fill: @land;
  // URBAN OR BUILT-UP
  // 11 Residental
  // 12 Commercial and services
  // 13 Industrial
  // 14 Transportation, communication, utilities
  // 15 Industrial and commercial complexes
  // 16 Mixed urban or built-up land
  // 17 Other urban or built-up land
  [LUCODE=11],
  [LUCODE=12],
  [LUCODE=13],
  [LUCODE=14],
  [LUCODE=15],
  [LUCODE=16],
  [LUCODE=17] { polygon-fill: @land; }
  // AGRICULTURAL
  // 21 Cropland and pasture
  // 22 Orchards, groves, vineyards, nurseries, and ornamental horticultural
  // 23 Confined feeding operations
  // 24 Other agricultural land
  [LUCODE=21],
  [LUCODE=22],
  [LUCODE=23],
  [LUCODE=24] { polygon-fill: @crop; }
  // GRASS AND SHRUB
  // 31 Herbaceous rangeland
  // 32 Shrub and brush rangeland
  // 33 Mixed rangeland
  [LUCODE=31],
  [LUCODE=32],
  [LUCODE=33] { polygon-fill: @land; }
  // FOREST
  // 41 Deciduous forest land
  // 42 Evergreen forest land
  // 43 Mixed forest land
  [LUCODE=41],
  [LUCODE=42],
  [LUCODE=43] {
    // Use ‘landcover_L1‘ for low levels, and transition to ‘landcover_L2' for high levels
    [zoom<12] { polygon-fill: @wood; }
    [zoom>=12] { polygon-fill: @land; }
  }
  // WATER
  // 51 Streams and canals
  // 52 Lakes
  // 53 Resevoirs
  // 54 Bays and estuaries
  [LUCODE=51],
  [LUCODE=52],
  [LUCODE=53],
  [LUCODE=54] {
    // Style as land so more detailed NHD data can be used instead.
   	polygon-fill: @land;
  }
  // WETLAND
  // 61 Forested wetland
  // 62 Nonforested wetland
  [LUCODE=61],
  [LUCODE=62] {
    // Use ‘landcover_L1‘ for low levels, and transition to NHD for high levels
    [zoom<12] { polygon-fill: @wetland; }
	[zoom>=12] { polygon-fill: @land; }
  }
  // BARREN
  // 71 Dry salt flats
  // 72 Beaches
  // 73 Sandy areas not beaches
  // 74 Bare exposed rock
  // 75 Strip mines, quarries, gravel pits
  // 76 Transitional areas
  // 77 Mixed Barren Land
  [LUCODE=71],
  [LUCODE=72],
  [LUCODE=73] { polygon-fill: @sand; }
  [LUCODE=74],
  [LUCODE=75],
  [LUCODE=77] { polygon-fill: @rock; }
  [LUCODE=76] { polygon-fill: @land; }
  // SNOWFIELDS AND ICE
  // 91 Perennial snowfields
  // 92 Glaciers
  [LUCODE=91],
  [LUCODE=92] { polygon-fill: @land; }
}

.landcover_L2 {
  [zoom>=12] { polygon-fill: @wood; }
}

#pitch {
  [zoom>=13] {
    polygon-fill: @park;
    polygon-opacity: 0.2;
  }
  [zoom>=14] {
    polygon-opacity: 0.3;
  }
  [zoom>=15] {
    polygon-pattern-file: url(img/pattern/diagonal_green.png);
    polygon-pattern-opacity: 0.5;
    line-color: @park;
    line-width: 1;
  }
  [zoom>=17] {
    line-width: 2;
  }
}

// =====================================================================
//   ELEVATION CONTOURS
// =====================================================================

.contour {
  line-color: @contour;
  [zoom<=12]{ line-opacity: 0; }
  [zoom>=13]{
    line-opacity: 0.1;
    line-width: 0.5;
    [FCODE=10102],
    [FCODE=10105] {
      line-opacity: 0.15;
      line-width: 0.75;
    }
  }
  [zoom>=14] {
    line-opacity: 0.1;
    line-width: 1;
    [FCODE=10102],
    [FCODE=10105] {
      line-opacity: 0.25;
      line-width: 1.05;
    }
  }
  [zoom>=15] {
    line-opacity: 0.25;
    line-width: 1;
    [FCODE=10104] {
      hatch/line-width: 2;
      hatch/line-opacity: 0.25;
      hatch/line-offset: -1;
      hatch/line-color: @contour;
      hatch/line-dasharray: 1,7;
    }
    [FCODE=10102],
    [FCODE=10105] {
      line-opacity: 0.5;
      line-width: 1.25;
      [FCODE=10105] {
		hatch/line-width: 2;
        hatch/line-opacity: 0.5;
        hatch/line-offset: -1;
        hatch/line-color: @contour;
        hatch/line-dasharray: 1,7;
      }
    }
  }
  [zoom>=16] {
    line-opacity: 0.5;
    [FCODE=10104] {
      hatch/line-width: -3;
      hatch/line-opacity: 0.275;
      hatch/line-offset: -1.5;
      hatch/line-color: @contour;
      hatch/line-dasharray: 1,7;
    }
    [FCODE=10102],
    [FCODE=10105] {
	  line-opacity: 0.9;
      [FCODE=10105] {
      	hatch/line-width: -3;
     	hatch/line-opacity: 0.575;
      	hatch/line-offset: -1.5;
      	hatch/line-color: @contour;
      	hatch/line-dasharray: 1,7;
      }
    }
  }
  [zoom>=17] {
    line-opacity: 0.5;
    [FCODE=10104] {
      hatch/line-width: 5;
      hatch/line-opacity: 0.35;
      hatch/line-offset: -2.5;
      hatch/line-color: @contour;
      hatch/line-dasharray: 1,10;
    }
    [FCODE=10102],
    [FCODE=10105] {
      line-opacity: 0.9;
      line-width: 1.3;
      [FCODE=10105] {
		hatch/line-width: 5;
        hatch/line-opacity: 0.65;
        hatch/line-offset: -2.5;
        hatch/line-color: @contour;
        hatch/line-dasharray: 1,10;
      }
    }
  }
  // CONTOUR LABELS
  [zoom>=15] {
    [FCODE=10102],
    [FCODE=10105] {
      text-name: [CONTOURELE];
      text-face-name: @sans;
      text-placement: line;
      text-size: 10;
      text-fill: @contour_text;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@land, 50%);
      text-halo-rasterizer: fast;
      text-spacing: 600;
      [zoom>=16] { text-size: 11; }
      [zoom>=17] { text-size: 12; }
    }
  }
}

.contour_ice {
  line-color: @water_dark;
  [zoom<=12]{ line-opacity: 0; }
  [zoom>=13]{
    line-opacity: 0.1;
    line-width: 0.5;
    [FCODE=10102],
    [FCODE=10105] {
      line-opacity: 0.15;
      line-width: 0.75;
    }
  }
  [zoom>=14] {
    line-opacity: 0.1;
    line-width: 1;
    [FCODE=10102],
    [FCODE=10105] {
      line-opacity: 0.25;
      line-width: 1.05;
    }
  }
  [zoom>=15] {
    line-opacity: 0.25;
    line-width: 1;
    [FCODE=10104] {
      hatch/line-width: 2;
      hatch/line-opacity: 0.25;
      hatch/line-offset: -1;
      hatch/line-color: @water_dark;
      hatch/line-dasharray: 1,7;
    }
    [FCODE=10102],
    [FCODE=10105] {
      line-opacity: 0.5;
      line-width: 1.25;
      [FCODE=10105] {
		hatch/line-width: 2;
        hatch/line-opacity: 0.5;
        hatch/line-offset: -1;
        hatch/line-color: @water_dark;
        hatch/line-dasharray: 1,7;
      }
    }
  }
  [zoom>=16] {
    line-opacity: 0.5;
    [FCODE=10104] {
      hatch/line-width: -3;
      hatch/line-opacity: 0.275;
      hatch/line-offset: -1.5;
      hatch/line-color: @water_dark;
      hatch/line-dasharray: 1,7;
    }
    [FCODE=10102],
    [FCODE=10105] {
	  line-opacity: 0.9;
      [FCODE=10105] {
      	hatch/line-width: -3;
     	hatch/line-opacity: 0.575;
      	hatch/line-offset: -1.5;
      	hatch/line-color: @water_dark;
      	hatch/line-dasharray: 1,7;
      }
    }
  }
  [zoom>=17] {
    line-opacity: 0.5;
    [FCODE=10104] {
      hatch/line-width: 5;
      hatch/line-opacity: 0.35;
      hatch/line-offset: -2.5;
      hatch/line-color: @water_dark;
      hatch/line-dasharray: 1,10;
    }
    [FCODE=10102],
    [FCODE=10105] {
      line-opacity: 0.9;
      line-width: 1.3;
      [FCODE=10105] {
		hatch/line-width: 5;
        hatch/line-opacity: 0.65;
        hatch/line-offset: -2.5;
        hatch/line-color: @water_dark;
        hatch/line-dasharray: 1,10;
      }
    }
  }
  // CONTOUR LABELS
  [zoom>=15] {
    [FCODE=10102],
    [FCODE=10105] {
      text-name: [CONTOURELE];
      text-face-name: @sans;
      text-placement: line;
      text-size: 10;
      text-fill: @water_dark;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@snow, 50%);
      text-halo-rasterizer: fast;
      text-spacing: 600;
      [zoom>=16] { text-size: 11; }
      [zoom>=17] { text-size: 12; }
    }
  }
}

// =====================================================================
//   BUILDING AND STRUCTURES
// =====================================================================

#building_S1,
#building_S2 {
  [zoom>=14] { polygon-fill: @building; }
  [zoom>=16] {
    line-color: @building_outline;
    line-width: 1.25;
  }
}

#building_S2_point {
  [zoom>=15] {
    marker-file: url(img/ico/square-6.svg);
    marker-fill: @building_outline;
    marker-allow-overlap: true;
    marker-ignore-placement: true;
  }
  [zoom>=17] { marker-geometry-transform: 'scale(2)'; }
}