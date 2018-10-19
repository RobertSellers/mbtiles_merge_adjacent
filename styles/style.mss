// =====================================================================
//   PRIMARY STYLE SHEET
// =====================================================================

@land: #f4efe1;
@water: #ccdddd;
@backgroundcolor: #dddcde;
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
@building: #b9b8b4;
@building_outline: #989898;
@contour: #964B00;
@contour_text: #655334;
@water_dark: #185869;
@wetland: #c0d5cc;
@water_infra: #585151;
@levee: #6f5842;
@util: #717171;
@util_text: #666;
@aeroway: #a4a4a2;
@rail: #4e4e4e;
@rail_tunnel: #9b9b9b;
@case: #2F2626;
@road: #DD4747;
@road_tunnel: #e98888;
@main: #FFFFFF;
@link: #7a7a7a;
@res: #cccccc;
@path: #6d534a;
@text_case: #f9f7ef;
@exit: #006747;
@native_label: #cc8400;
@path_label: #4f3c35;
@park_label: #487229;
@park_halo: #e4eddd;
@nsfs_text: #FF0000;

// FONT SET FOR AWS BUILD
@sans:              "DejaVu Sans Book";
@sans_bld:          "DejaVu Sans Bold";
@sans_italic:       "DejaVu Sans Oblique";
@sans_bold_italic:  "DejaVu Sans Condensed Bold Oblique";
@sans_lt_italic:    "DejaVu Sans Condensed Oblique";
@sans_lt:           "DejaVu ExtraLight";
@sans_condensed: 	"DejaVu Sans Condensed";

// FONT SET FOR UBUNTU BUILD
//@sans: "Ubuntu Regular";
//@sans_bld: "Ubuntu Medium";
//@sans_italic: "Ubuntu Italic";
//@sans_lt_italic: "Ubuntu Light Italic";
//@sans_lt: "Ubuntu Light";

// FONT SET FOR OSX BUILD
// @sans: "Open Sans Regular";
// @sans_bld: "Open Sans Semibold";
// @sans_italic: "Open Sans Semibold Italic";
// @sans_lt_italic: "Open Sans Italic";
// @sans_lt: "Open Sans Light";

Map {
  background-color: @backgroundcolor;
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
    [FTYPE=673] {
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
    [FTYPE=674],
    [FTYPE=671],
    [FTYPE=676] {
      [NAME!='Blue Ridge Parkway'] {
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
	[FTYPE=670] {
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
    [boundary!='national_park'] {
      [name!='Prince William Forest Park'] {
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
  [LUCODE=11],
  [LUCODE=12],
  [LUCODE=13],
  [LUCODE=14],
  [LUCODE=15],
  [LUCODE=16],
  [LUCODE=17] { polygon-fill: @land; }
  [LUCODE=21],
  [LUCODE=22],
  [LUCODE=23],
  [LUCODE=24] { polygon-fill: @crop; }
  [LUCODE=31],
  [LUCODE=32],
  [LUCODE=33] { polygon-fill: @land; }
  [LUCODE=41],
  [LUCODE=42],
  [LUCODE=43] {
    [zoom<12] { polygon-fill: @wood; }
    [zoom>=12] { polygon-fill: @land; }
  }
  [LUCODE=51],
  [LUCODE=52],
  [LUCODE=53],
  [LUCODE=54] {
   	polygon-fill: @land;
  }
  [LUCODE=61],
  [LUCODE=62] {
    [zoom<12] { polygon-fill: @wetland; }
	[zoom>=12] { polygon-fill: @land; }
  }
  [LUCODE=71],
  [LUCODE=72],
  [LUCODE=73] { polygon-fill: @sand; }
  [LUCODE=74],
  [LUCODE=75],
  [LUCODE=77] { polygon-fill: @rock; }
  [LUCODE=76] { polygon-fill: @land; }
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

.building_S2 {
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

// =============================================
// WATER_AREA_SHORE
// =============================================

.water_area_shore {
  [FCODE=31200],
  [FCODE=46006],
  [FCODE=44500],
  [FCODE=49300] {
    polygon-clip: false;
    polygon-fill: @water_dark;
    ::blur {
      image-filters: agg-stack-blur(1,1);
      image-filters-inflate: true;
      polygon-clip: false;
      polygon-fill: @water;
      polygon-gamma: 0.35;
      [FCODE=46006] { 
        polygon-gamma: 0.5; 
        [zoom>=12] { polygon-gamma: 0.75; }
      }
    }
  }
  [FCODE=53700] {
	[zoom>=10] {
      polygon-fill: @wetland;
      line-color: @wetland;
      [zoom>=16] { line-width: 4; }
      [zoom>=17] { line-width: 7; }
    }
  }
  [FCODE=34300],
  [FCODE=34305],
  [FCODE=34306] {
  	[zoom>=12] {
      polygon-fill: @water_infra;
      polygon-opacity: 0.5; 
    }
    [zoom>=15] {
      line-color: @water_infra;
      line-width: 1.5;
      line-opacity: 0.5; 
      polygon-opacity: 0.25;
    }
  }
  [FCODE=39800],
  [FCODE=45500],
  [FCODE=36200],
  [FCODE=48500] {
    [zoom>=12] {
      polygon-fill: mix(@water, @water_infra, 80);
      polygon-opacity: 1; 
    }
    [zoom>=15] {
      line-color: @water_infra;
      line-width: 1.5;
      line-opacity: 0.5; 
    }
  }
  [FCODE=56800] {
    [zoom>=12] {
      polygon-fill: @water_infra;
      polygon-opacity: 0.5; 
    }
    [zoom>=14] {
      line-color: @water_infra;
      line-width: 4;
      line-dasharray: 4, 2;
      line-opacity: 0.75;
      polygon-opacity: 0.25; 
    }
  }
  [FCODE=36400] {
    [zoom>=13] {
      polygon-fill: @water_dark;
      polygon-opacity: 0.025;
    }
    [zoom>=14] { polygon-opacity: 0.05; }
  }
  [FCODE=40300],
  [FCODE=40307],
  [FCODE=40308],
  [FCODE=40309] {
  	[zoom>=12] { 
      polygon-fill: @wetland; 
      polygon-opacity: 0.4;
    }
  }
  [FCODE=43100] {
    [zoom>=14] {
      polygon-pattern-file: url(img/pattern/wave.png);
      polygon-pattern-opacity: 0.35;
    }
    [zoom>=15] { polygon-pattern-opacity: 0.5; }
  }
  [FCODE=45400],
  [FCODE=45401],
  [FCODE=45402],
  [FCODE=45403],
  [FCODE=45404] {
    [Shape_Area>17300000] {
      polygon-clip: false;
      polygon-fill: @water_dark;
      ::blur {
        image-filters: agg-stack-blur(1,1);
        image-filters-inflate: true;
        polygon-clip: false;
        polygon-fill: @water;
        polygon-gamma: 0.6;
      }
    }
    [Shape_Area<17300000] {
      [zoom>10] {
     	polygon-clip: false;
        polygon-fill: @water_dark;
        ::blur {
          polygon-clip: false;
          polygon-fill: @water;
        }
      }
    }
  }
  [FCODE=46000],
  [FCODE=46003],
  [FCODE=33600],
  [FCODE=33601],
  [FCODE=33602] {
	[Shape_Area>17300000] {
      polygon-clip: false;
      polygon-fill: @water_dark;
      ::blur {
        image-filters: agg-stack-blur(1,1);
        image-filters-inflate: true;
        polygon-clip: false;
        polygon-fill: @water;
        polygon-gamma: 0.6;
      }
    }
    [Shape_Area<17300000] {
      [zoom>10] {
     	polygon-clip: false;
        polygon-fill: @water_dark;
        ::blur {
          polygon-clip: false;
          polygon-fill: @water;
        }
      }
    }
  }
  [FCODE=48400] {
    [zoom>10] {
      polygon-clip: false;
      polygon-fill: @water_dark;
      ::blur {
        polygon-clip: false;
        polygon-fill: @land;
        [zoom>=14] { 
          polygon-pattern-file: url(img/pattern/diagonal.png);
          polygon-pattern-opacity: 0.75;
        }
      }
    }
  }
}

// =============================================
// WATER_AREA
// =============================================
.water_area_shore {
  // FCODE=31200 -> BAY/INLET
  // FCODE=44500 -> SEA/OCEAN
  // FCODE=46006 -> STREAM/RIVER: PERENNIAL
  // FCODE=49300 -> ESTUARY
  [FCODE=31200],
  [FCODE=46006],
  [FCODE=44500],
  [FCODE_2=49300] {
    polygon-clip: false;
    polygon-fill: @water_dark;
    ::blur {
      image-filters: agg-stack-blur(1,1);
      image-filters-inflate: true;
      polygon-clip: false;
      polygon-fill: @water;
      polygon-gamma: 0.35;
      [FCODE=46006] { 
        polygon-gamma: 0.5; 
        [zoom>=12] { polygon-gamma: 0.75; }
      }
    }
  }
  // FCODE=53700 -> AREA OF COMPLEX CHANNELS
  [FCODE=53700] {
	[zoom>=10] {
      polygon-fill: @wetland;
      line-color: @wetland;
      [zoom>=16] { line-width: 4; }
      [zoom>=17] { line-width: 7; }
    }
  }
  // FCODE=34300 -> DAM/WEIR: NO ATTRIBUTES
  // FCODE=34305 -> DAM/WEIR: EARTHEN
  // FCODE=34306 -> DAM/WEIR: NON-EARTHEN
  [FCODE=34300],
  [FCODE=34305],
  [FCODE=34306] {
  	[zoom>=12] {
      polygon-fill: @water_infra;
      polygon-opacity: 0.5; 
    }
    [zoom>=15] {
      line-color: @water_infra;
      line-width: 1.5;
      line-opacity: 0.5; 
      polygon-opacity: 0.25;
    }
  }
  // FCODE=39800 -> LOCK CHAMBER
  // FCODE=45500 -> SPILLWAY
  // FCODE=36200 -> FLUME
  // FCODE=48500 -> WATER INTAKE/OUTFLOW
  [FCODE=39800],
  [FCODE=45500],
  [FCODE=36200],
  [FCODE=48500] {
    [zoom>=12] {
      polygon-fill: mix(@water, @water_infra, 80);
      polygon-opacity: 1; 
    }
    [zoom>=15] {
      line-color: @water_infra;
      line-width: 1.5;
      line-opacity: 0.5; 
    }
  }
  // FCODE=56800 -> LEVEE
  [FCODE=56800] {
    [zoom>=12] {
      polygon-fill: @water_infra;
      polygon-opacity: 0.5; 
    }
    [zoom>=14] {
      line-color: @water_infra;
      line-width: 4;
      line-dasharray: 4, 2;
      line-opacity: 0.75;
      polygon-opacity: 0.25; 
    }
  }
  // FCODE=36400 -> FORESHORE
  [FCODE=36400] {
    [zoom>=13] {
      polygon-fill: @water_dark;
      polygon-opacity: 0.025;
    }
    [zoom>=14] { polygon-opacity: 0.05; }
  }
  // FCODE=40300 -> INUNDATION AREA: NO ATTRIBUTES
  // FCODE=40307 -> INUNDATION AREA: NOT CONTROLLED
  // FCODE=40308 -> INUNDATION AREA: CONTROLLED
  // FCODE=40309 -> INUNDATION AREA: CONTROLLED: FLOOD ELEV.
  [FCODE=40300],
  [FCODE=40307],
  [FCODE=40308],
  [FCODE=40309] {
  	[zoom>=12] { 
      polygon-fill: @wetland; 
      polygon-opacity: 0.4;
    }
  }
  // FCODE=43100 -> RAPIDS
  [FCODE=43100] {
    [zoom>=14] {
      polygon-pattern-file: url(img/pattern/wave.png);
      polygon-pattern-opacity: 0.35;
    }
    [zoom>=15] { polygon-pattern-opacity: 0.5; }
  }
  // FCODE=45400 -> SPECIAL USE ZONE: NO ATTRIBUTES
  // FCODE=45401 -> SPECIAL USE ZONE: DUMP SITE: OPERATIONAL
  // FCODE=45402 -> SPECIAL USE ZONE: DUMP SITE: ABANDONED
  // FCODE=45403 -> SPECIAL USE ZONE: SPOIL AREA: OPERATIONAL
  // FCODE=45404 -> SPECIAL USE ZONE: SPOIL AREA: ABANDONED
  [FCODE=45400],
  [FCODE=45401],
  [FCODE=45402],
  [FCODE=45403],
  [FCODE=45404] {
    [Shape_Area>17300000] {
      polygon-clip: false;
      polygon-fill: @water_dark;
      ::blur {
        image-filters: agg-stack-blur(1,1);
        image-filters-inflate: true;
        polygon-clip: false;
        polygon-fill: @water;
        polygon-gamma: 0.6;
      }
    }
    [Shape_Area<17300000] {
      [zoom>10] {
     	polygon-clip: false;
        polygon-fill: @water_dark;
        ::blur {
          polygon-clip: false;
          polygon-fill: @water;
        }
      }
    }
  }
  // FCODE=46000 -> STREAM/RIVER: NO ATTRIBUTES
  // FCODE=46003 -> STREAM/RIVER: INTERMITTENT
  // FCODE=33600 -> CANAL/DITCH: NO ATTRIBUTES
  // FCODE=33601 -> CANAL/DITCH: AQUEDUCT
  // FCODE=33602 -> CANAL/DITCH: UNSPECIFIED
  [FCODE=46000],
  [FCODE=46003],
  [FCODE=33600],
  [FCODE=33601],
  [FCODE=33602] {
	[Shape_Area>17300000] {
      polygon-clip: false;
      polygon-fill: @water_dark;
      ::blur {
        image-filters: agg-stack-blur(1,1);
        image-filters-inflate: true;
        polygon-clip: false;
        polygon-fill: @water;
        polygon-gamma: 0.6;
      }
    }
    [Shape_Area<17300000] {
      [zoom>10] {
     	polygon-clip: false;
        polygon-fill: @water_dark;
        ::blur {
          polygon-clip: false;
          polygon-fill: @water;
        }
      }
    }
  }
  // FCODE=46100 -> SUBMERGED STREAM
  [FCODE=46100] {
    // 'An old river innundated or impounded by water;
    // NOT CURRENTLY STYLED
  }
  // FCODE=48400 -> WASH
  [FCODE=48400] {
    [zoom>10] {
      polygon-clip: false;
      polygon-fill: @water_dark;
      ::blur {
        polygon-clip: false;
        polygon-fill: @land;
        [zoom>=14] { 
          polygon-pattern-file: url(img/pattern/diagonal.png);
          polygon-pattern-opacity: 0.75;
        }
      }
    }
  }
}

.water_area {
  [FCODE=31200],
  [FCODE=46006],
  [FCODE=44500] {
    polygon-clip: false;
    polygon-fill: @water_dark;
    ::blur {
      image-filters: agg-stack-blur(1,1);
      image-filters-inflate: true;
      polygon-clip: false;
      polygon-fill: @water;
      polygon-gamma: 0.35;
      [FCODE=46006] { 
        polygon-gamma: 0.5; 
        [zoom>=12] { polygon-gamma: 0.75; }
      }
    }
  }
  [FCODE=53700] {
	[zoom>=10] {
      polygon-fill: @wetland;
      line-color: @wetland;
      [zoom>=16] { line-width: 4; }
      [zoom>=17] { line-width: 7; }
    }
  }
  [FCODE=34300],
  [FCODE=34305],
  [FCODE=34306] {
  	[zoom>=12] {
      polygon-fill: @water_infra;
      polygon-opacity: 0.5; 
    }
    [zoom>=15] {
      line-color: @water_infra;
      line-width: 1.5;
      line-opacity: 0.5; 
      polygon-opacity: 0.25;
    }
  }
  [FCODE=39800],
  [FCODE=45500],
  [FCODE=36200],
  [FCODE=48500] {
    [zoom>=12] {
      polygon-fill: mix(@water, @water_infra, 80);
      polygon-opacity: 1; 
    }
    [zoom>=15] {
      line-color: @water_infra;
      line-width: 1.5;
      line-opacity: 0.5; 
    }
  }
  [FCODE=56800] {
    [zoom>=12] {
      polygon-fill: @water_infra;
      polygon-opacity: 0.5; 
    }
    [zoom>=14] {
      line-color: @water_infra;
      line-width: 4;
      line-dasharray: 4, 2;
      line-opacity: 0.75;
      polygon-opacity: 0.25; 
    }
  }
  [FCODE=36400] {
    [zoom>=13] {
      polygon-fill: @water_dark;
      polygon-opacity: 0.025;
    }
    [zoom>=14] { polygon-opacity: 0.05; }
  }
  [FCODE=40300],
  [FCODE=40307],
  [FCODE=40308],
  [FCODE=40309] {
  	[zoom>=12] { 
      polygon-fill: @wetland; 
      polygon-opacity: 0.4;
    }
  }
  [FCODE=43100] {
    [zoom>=14] {
      polygon-pattern-file: url(img/pattern/wave.png);
      polygon-pattern-opacity: 0.35;
    }
    [zoom>=15] { polygon-pattern-opacity: 0.5; }
  }
  [FCODE=45400],
  [FCODE=45401],
  [FCODE=45402],
  [FCODE=45403],
  [FCODE=45404] {
    [Shape_Area>17300000] {
      polygon-clip: false;
      polygon-fill: @water_dark;
      ::blur {
        image-filters: agg-stack-blur(1,1);
        image-filters-inflate: true;
        polygon-clip: false;
        polygon-fill: @water;
        polygon-gamma: 0.6;
      }
    }
    [Shape_Area<17300000] {
      [zoom>10] {
     	polygon-clip: false;
        polygon-fill: @water_dark;
        ::blur {
          polygon-clip: false;
          polygon-fill: @water;
        }
      }
    }
  }
  [FCODE=46000],
  [FCODE=46003],
  [FCODE=33600],
  [FCODE=33601],
  [FCODE=33602] {
	[Shape_Area>17300000] {
      polygon-clip: false;
      polygon-fill: @water_dark;
      ::blur {
        image-filters: agg-stack-blur(1,1);
        image-filters-inflate: true;
        polygon-clip: false;
        polygon-fill: @water;
        polygon-gamma: 0.6;
      }
    }
    [Shape_Area<17300000] {
      [zoom>10] {
     	polygon-clip: false;
        polygon-fill: @water_dark;
        ::blur {
          polygon-clip: false;
          polygon-fill: @water;
        }
      }
    }
  }
  [FCODE=48400] {
    [zoom>10] {
      polygon-clip: false;
      polygon-fill: @water_dark;
      ::blur {
        polygon-clip: false;
        polygon-fill: @land;
        [zoom>=14] { 
          polygon-pattern-file: url(img/pattern/diagonal.png);
          polygon-pattern-opacity: 0.75;
        }
      }
    }
  }
}

// =============================================
// WATER_BODY: LEVEL 1
// =============================================

.water_body_L1 {
  [FCODE=37800] {
    polygon-fill: @snow; 
  }
  [FCODE=39000],
  [FCODE=39004],
  [FCODE=39009],
  [FCODE=39010],
  [FCODE=39011],
  [FCODE=39012] {
    [Shape_Area>17300000] {
      polygon-clip: false;
      polygon-fill: @water_dark;
      ::blur {
        image-filters: agg-stack-blur(1,1);
        image-filters-inflate: true;
        polygon-clip: false;
        polygon-fill: @water;
        polygon-gamma: 0.6;
      }
    }
    [Shape_Area<17300000] {
      [zoom>10] {
     	polygon-clip: false;
        polygon-fill: @water_dark;
        ::blur {
          polygon-clip: false;
          polygon-fill: @water;
        }
      }
    }
  }
  [FCODE=39001],
  [FCODE=39005],
  [FCODE=39006] {
    [zoom>10] {
      polygon-clip: false;
      polygon-fill: @water_dark;
      ::blur {
        polygon-clip: false;
        polygon-fill: @water;
        [zoom>=14] { 
          polygon-pattern-file: url(img/pattern/diagonal.png);
          polygon-pattern-opacity: 0.5;
        }
      }
    }
  }
  [FTYPE=436] {
    // -------- GENERAL --------
    [Shape_Area>17300000] {
      polygon-clip: false;
      polygon-fill: @water_dark;
      ::blur {
        image-filters: agg-stack-blur(1,1);
        image-filters-inflate: true;
        polygon-clip: false;
        polygon-fill: @water;
        polygon-gamma: 0.6;
        // -------- DISPOSAL --------
        [FCODE=43604],
        [FCODE=43605],
        [FCODE=43606],
        [FCODE=43625],
        [FCODE=43626] {
          [zoom>=14] {
            polygon-pattern-file: url(img/pattern/tailing.png);
            polygon-pattern-opacity: 0.75;
          }
        }
        // -------- TREATMENT --------
        [FCODE=43609],
        [FCODE=43610],
        [FCODE=43611],
        [FCODE=43612],
        [FCODE=43624] {
          [zoom>=14] {
            line-color: orange;
          }
        }
        // -------- COVERED --------
        [FCODE=43613] {
          [zoom>=14] {
            polygon-pattern-file: url(img/pattern/diagonal_black.png);
            polygon-pattern-opacity: 0.25;
            line-color: @water_infra;
            line-width: 0.5;
            [zoom>=15] { polygon-pattern-opacity: 0.5; }
          }
        }
      }
    }
    // -------- GENERAL --------
    [Shape_Area<17300000] {
      [zoom>10] {
     	polygon-clip: false;
        polygon-fill: @water_dark;
        ::blur {
          polygon-clip: false;
          polygon-fill: @water;
          // -------- DISPOSAL --------
          [FCODE=43604],
          [FCODE=43605],
          [FCODE=43606],
          [FCODE=43625],
          [FCODE=43626] {
            [zoom>=14] {
              polygon-pattern-file: url(img/pattern/tailing.png);
              polygon-pattern-opacity: 0.5;
              line-color: @water_infra;
              line-width: 0.25;
              [zoom>=15] { polygon-pattern-opacity: 0.75; }
            }
          }
          // -------- TREATMENT --------
          [FCODE=43609],
          [FCODE=43610],
          [FCODE=43611],
          [FCODE=43612],
          [FCODE=43624] {
            [zoom>=15] {
              line-color: orange;
            }
          }
          // -------- COVERED --------
          [FCODE=43613] {
            [zoom>=14] {
              polygon-pattern-file: url(img/pattern/diagonal_black.png);
              polygon-pattern-opacity: 0.25;
              line-color: @water_infra;
              line-width: 0.5;
              [zoom>=15] { polygon-pattern-opacity: 0.5; }
            }
          }
        }
      }
    }
  }
}

// =============================================
// WATER_BODY: LEVEL 2
// =============================================

.water_body_L2 {
  [FCODE=36100] {
    [zoom>10] {
      polygon-clip: false;
      polygon-fill: @water_dark;
      ::blur {
        polygon-clip: false;
        polygon-fill: @land;
        [zoom>=14] { 
          polygon-pattern-file: url(img/pattern/diagonal.png);
          polygon-pattern-opacity: 0.75;
        }
      }
    }
  }
  [FCODE=46600],
  [FCODE=46601],
  [FCODE=46602] {
    [Shape_Area>17300000] {
      polygon-fill: @wetland;
      [zoom>12] {
        polygon-pattern-file: url(img/pattern/wetland_64.png);
        polygon-pattern-opacity: 0.9;
      } 
    }
    [Shape_Area<17300000] {
      [zoom>=10] {
        polygon-fill: @wetland;
        polygon-opacity: 0.25;
        [zoom>=11] { polygon-opacity: 0.5; }
        [zoom>=12] { polygon-opacity: 0.75; }
        [zoom>=13] {
          polygon-opacity: 1;
          polygon-pattern-file: url(img/pattern/wetland_64.png);
          polygon-pattern-opacity: 0.9;
        } 
      }
    }
  } 
}

// =============================================
// WATER_WAY
// =============================================

.water_way {
  [FCODE=55800],
  [FCODE=33600],
  [FCODE=33601],
  [FCODE=33602],
  [FCODE=42801],
  [FCODE=42805],
  [FCODE=42809],
  [FCODE=42813],
  [FCODE=42814],
  [FCODE=42815],
  [FCODE=42816] {
	[zoom>=11] {
      line-color: mix(@water,@water_dark,45); 
      line-width: 0.25;
      line-opacity: 0.5;
    }
    [zoom>=12] { 
      line-width: 0.5;
	  line-opacity: 0.75;
    }
    [zoom>=13] { 
      line-width: 0.75; 
      line-opacity: 1;
    }
    [zoom>=14] { line-width: 1; }
    [zoom>=15] { line-width: 1.5; }
  }
  [FCODE=42802],
  [FCODE=42806],
  [FCODE=42810] {
	[zoom>=11] {
      line-color: mix(@water,@water_dark,45); 
      line-width: 0.25;
      line-opacity: 0.5;
    }
    [zoom>=12] { 
      line-width: 0.5;
	  line-opacity: 0.75;
    }
    [zoom>=13] { 
      line-width: 0.75; 
      line-opacity: 1;
    }
    [zoom>=14] { line-width: 1; }
    [zoom>=15] { line-width: 1.5; }
  }
  [FCODE=42803],
  [FCODE=42807],
  [FCODE=42811] {
  	[zoom>=11] {
      line-color: mix(@water,@water_dark,45);
      line-width: 0.25;
      line-dasharray: 0.25, 2;
      line-opacity: 0.5;
    }
    [zoom>=12] {
      line-width: 0.5;
      line-dasharray: 0.5, 2;
      line-opacity: 0.75;
    }
    [zoom>=13] {
      line-width: 0.75;
      line-dasharray: 0.75, 2;
      line-opacity: 1;
    }
    [zoom>=14] {
      line-width: 2;
      line-dasharray: 1, 2;
    }
    [zoom>=15] {
      line-width: 3;
      line-dasharray: 1.75, 2.5;
    }
  }
  [FCODE=42804],
  [FCODE=42808],
  [FCODE=42812] {
    [zoom>=13] {
      line-color: mix(@water,@water_dark,25);
      line-dasharray: 4,2;
      line-width: 0.5;
    }
    [zoom>=14] { line-dasharray: 6,3; line-width: 0.75; }
    [zoom>=15] { line-width: 1; }
    [zoom>=16] { line-width: 1.5; }
  }
  [FCODE=46000],
  [FCODE=46006] {
  	[zoom>=10] { 
      line-color: mix(@water, @water_dark, 70); 
      line-width: 0.25; 
    }
	[zoom>=12] { line-width: 0.5; }
    [zoom>=14] { line-width: 1; }
    [zoom>=16] { line-width: 1.75; }
    [zoom>=17] { line-width: 2; }
  }
  [FCODE=46003],
  [FCODE=46607] {
    [zoom>=12] { 
      line-color: mix(@water, @water_dark, 70);
      line-dasharray: 16,3,2,3,2,3;
      line-width: 0.5;
    }
    [zoom>=14] { line-width: 1; }
    [zoom>=16] { line-width: 1.75; }
    [zoom>=17] { line-width: 2; }
  }
  [FCODE=42000] {
    [zoom>=12] { 
      line-color: mix(@water, @water_dark, 70);
      line-dasharray: 2, 2;
      line-width: 0.5;
    }
    [zoom>=14] { line-width: 1; }
    [zoom>=16] { line-width: 1.75; }
    [zoom>=17] { line-width: 2; }
  }
}

// =============================================
// WATER_POINT
// =============================================

.water_point {
  [FCODE=34300],
  [FCODE=34305],
  [FCODE=34306] {
    [zoom>=15] {
      marker-file: url(img/ico/square-12.svg);
      marker-fill: @water_infra;
      marker-allow-overlap: true;
    }
  }
  [FCODE=36900],
  [FCODE=39800] {
    [zoom>=15] {
      marker-file: url(img/ico/square-12.svg);
      marker-transform:"scale(0.65)";
      marker-fill: @water_infra;
      marker-allow-overlap: true;
    }
  }
  [FCODE=36701] {
    [zoom>=17] {
      marker-file: url(img/ico/gauging-station.png);
      marker-allow-overlap: true;
    }
  }
  [FCODE=43100],
  [FCODE=48700] {
    [zoom>=15] {
      marker-file: url(img/ico/square-12.svg);
      marker-transform:"scale(0.65)";
      marker-fill: @water_dark;
      marker-allow-overlap: true;
    }
  }
  [FTYPE=436] {
    [zoom>=15] {
      marker-file: url(img/ico/square-12.svg);
      marker-transform: "scale(0.75)";
      marker-fill: mix(@water, @water_dark, 90);
      marker-line-color: @water_dark;
      marker-line-width: 4;
      marker-allow-overlap: true;
    }
    [zoom>=17] { marker-transform: "scale(1)"; }
  }
  [FCODE=44100],
  [FCODE=44101],
  [FCODE=44102] {
  	[zoom>=16] {
	  text-name: "'*'";
      text-face-name: @sans_bld;
      text-size: 16;
      text-allow-overlap: true;
    }
  }
  [FCODE=45000] {
    [zoom>=15] {
	  marker-file: url(img/ico/triangle-12.svg);
      marker-fill: mix(@water, @water_dark, 50);
      marker-line-color: mix(@water, @water_dark, 50);
      marker-allow-overlap: true;
    }
  }
  [FCODE=45800],
  [FCODE=48800] {
    [zoom>=15] {
      marker-file: url(img/ico/circle-stroked-12.svg);
      marker-fill: mix(@water, @water_dark, 50);
      marker-line-color: mix(@water, @water_dark, 50);
      marker-allow-overlap: true;
    }
  }  
  [zoom>=15] {
    marker-file: url(img/ico/square-12.svg);
    marker-transform:"scale(0.65)";
    marker-fill: @water_infra;
    marker-allow-overlap: true;
  }
}


// =============================================
// WATER_LINE
// =============================================

.water_line {
  [FCODE=34300],
  [FCODE=34305],
  [FCODE=34306],
  [FCODE=36900] {
    [zoom>=12] {
      line-color: @water_infra;
      line-opacity: 0.5;
    }
    [zoom>14] { line-opacity: 0.75; }
    [zoom>=15] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
  }
  [FCODE=36200],
  [FCODE=39800] {
    [zoom>=12] {
      line-color: mix(@water, @water_infra, 80);
      line-opacity: 0.5;
    }
    [zoom>14] { line-opacity: 0.75; }
    [zoom>=15] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
  }
  [FCODE=41100],
  [FCODE=48300] {
    [zoom>=12] {
      line-color: @water_infra;
      line-width: 0.5;
      line-opacity: 0.5;
    }
    [zoom>=14] {
      line-width: 0.75;
      line-opacity: 0.75;
    }
    [zoom>=16] { line-width: 1; }
  }
  [FCODE=43100],
  [FCODE=48700] {
    [zoom>=14] {
      line-color: @water_dark;
      line-opacity: 0.25;
      line-width: 6;
      line-join: round;
      line-dasharray: 1, 2;
    }
    [zoom>=16] { line-opacity: 0.5; }
    [zoom>=17] { line-width: 10; }
  }
  [FCODE=43400] {
    [zoom>=14] {
      line-color: @water_dark;
      line-opacity: 0.25;
      line-width: 1;
      line-join: round;
      line-cap: round;
    }
    [zoom>=15] {
      line-width: 2;
      line-dasharray: 1, 2;
    }
    [zoom>=16] { line-opacity: 0.5; }
    [zoom>=17] {
      ::border {
        line-color: @water_dark;
        line-opacity: 0.5;
        line-width: 6; 
        line-join: round;
        line-cap: round;
        line-dasharray: 1, 8;
      }
      ::case {
        line-color: @water;
        line-width: 3;
        line-join: round;
        line-cap: round;
        line-offset: -1.5;
      }
      ::fill {
        line-color: @water_dark;
        line-opacity: 0.5;
        line-width: 3;
        line-join: round;
        line-cap: round;
        line-offset: -1.5;
      }
    }
  }
}

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
        //text-halo-rasterizer: fast;
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
        //text-halo-rasterizer: fast;
        text-min-distance: 100;
      }
      [zoom>=16] { text-size: 12; }
    }
  } 
}

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
    text-name: [field_2] + ", "+ [field_5];
    text-face-name: @sans;
    text-size: 13;
    text-wrap-width: 120;
    text-line-spacing: -2;
    text-halo-radius: 2;
    text-halo-fill: @text_case;
    //text-halo-rasterizer: fast;
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
  [zoom>10][type=''] {
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
    [railway='halt'],
    [railway='station'],
    [railway='subway_entrance'],
    [railway='tram_stop'] {
      point-opacity: 1;
      point-allow-overlap: true;
      [zoom>=17] {
        text-name: [name] + ' Station';
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 45;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        //text-halo-rasterizer: fast; 
        text-avoid-edges: true;
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 8;
        text-dx: 8;
      }
    }
  }
}

#bridge_L1 {
  [highway="motorway"],
  [highway="trunk"],
  [highway="primary"] {
    ::case[zoom>8] {
      line-color: @case;
	  line-width: 0;
      [zoom>=14] { line-width: 4; }
      [zoom>=16] { line-width: 7; }
      [zoom>=17] { line-width: 9; }
      // [zoom>=18] { line-width: 11; }
    }
    ::fill[zoom>8] {
      line-color: @road;
      line-width: 0.5;
      line-opacity: 0.5;
      [zoom>=11] { line-opacity: 1; }
      [zoom>=12] { line-width: 1.5; }
      [zoom>=14] { line-width: 2; }
      [zoom>=15] { line-width: 2.5; }
      [zoom>=16] { line-width: 4; }
      [zoom>=17] { line-width: 6; }
      // [zoom>=18] { line-width: 8; }
    }
  }
}

#bridge_L2 {
  [highway="secondary"],
  [highway="tertiary"] {
    ::case[zoom>10] {
      line-color: @case;
      line-width: 0;
      [zoom>=14] { line-width: 3; }
      [zoom>=16] { line-width: 5; }
      [zoom>=18] { line-width: 6; }
    }
    ::fill[zoom>10] {
      line-color: @road;
      line-width: 0.5;
      line-opacity: 0.5;
      [zoom>=12] { line-width: 1.2; }
      [zoom>=14] { line-width: 2; line-opacity: 1; }
      [zoom>=16] { line-width: 3; }
      // [zoom>=18] { line-width: 4; }
    }
    ::middleline[zoom>=12] {
      line-color: @main;
      line-width: 0;
      line-dasharray: 10, 24;
      [zoom>=14] { line-width: 2; }
      [zoom>=16] { line-width: 3; }
      // [zoom>=18] { line-width: 4; }
    }
  }
}

#bridge_L3 {
  [highway='motorway_link'],
  [highway='trunk_link'],
  [highway='primary_link'],
  [highway="secondary_link"],
  [highway="tertiary_link"],
  [highway='residential_link'] {
    ::topline[zoom>=12][zoom<=15] {
      line-color: @link; 
    }
    ::case[zoom>=15] {
      line-color: @case;
      line-width: 0;
      [zoom>=15] { line-width: 2.5; }
      [zoom>=16] { line-width: 3.5; }
      [zoom>=17] { line-width: 6; }
      // [zoom>=18] { line-width: 7; }
    }
    ::fill[zoom>=15] {
      line-color: @main;
      [zoom>=15] { line-width: 1.5; }
      [zoom>=16] { line-width: 2; }
      [zoom>=17] { line-width: 4; }
      // [zoom>=18] { line-width: 5; }
    }
  }
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
    ::topline[zoom>=12][zoom<=14] {
      line-color: @res; 
    }
    ::case[zoom>=15] {
      line-color: @case;
      line-cap: round;
      [zoom>=15] { line-width: 2.5; }
      [zoom>=16] { line-width: 4; }
    }
    ::fill[zoom>=15] {
      line-color: @main;
      line-cap: round;
      [zoom>=15] { line-width: 1; }
      [zoom>=16] { line-width: 2; }
    }
  }
  [highway='track'],
  [highway='service'],
  [highway='ford'],
  [highway='construction'] {
    ::topline[zoom>=12] {
      [zoom<=14] { line-color: @res; }
      [zoom<=15] { line-color: @link; }
    }
    ::case[zoom>=16] {
      line-color: @case;
      line-cap: round;
      line-dasharray: 8, 4;
      [zoom>=16] { line-width: 3; }
    }
    ::fill[zoom>=16] {
      line-color: @main;
      line-cap: round;
      [zoom>=16] { line-width: 2; }
    }
  }
}

#path {
  ::case[zoom>=15] {
    line-color: fadeout(@land, 10%);
    line-cap: round;
    [zoom>=15] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
    [zoom>=17] { line-width: 4; }
  }
  ::fill[zoom>=15] {
    line-color: @path;
    [zoom<15] { line-opacity: 0.75; }
    [zoom>15] { line-opacity: 1; line-dasharray: 6,2; }
  }
}

#aerialway {
  [zoom>=15] {
    line-width: 2;
    line-color: @link;
    line-dasharray: 2,2;
    ::label[zoom>=16] {
       marker-file: url(img/ico/aerialway-18.svg); 
    }
  }
} 

#road_L1 {
  [type=''] {
    ::case[zoom>8] {
      line-color: @case;
	  line-width: 0;
      [zoom>=14] { line-width: 4; }
      [zoom>=16] { line-width: 7; }
      [zoom>=17] { line-width: 9; }
    }
    ::fill[zoom>8] {
      line-color: @road;
      line-width: 0.5;
      line-opacity: 0.5;
      [zoom>=11] { line-opacity: 1; }
      [zoom>=12] { line-width: 1.5; }
      [zoom>=14] { line-width: 2; }
      [zoom>=15] { line-width: 2.5; }
      [zoom>=16] { line-width: 4; }
      [zoom>=17] { line-width: 6; }
    }
  }
}

#road_L2 {
  [type=''] {
    ::case[zoom>10] {
      line-color: @case;
      line-width: 0;
      line-cap: round;
      [zoom>=14] { line-width: 3; }
      [zoom>=16] { line-width: 5; }
    }
    ::fill[zoom>10] {
      line-color: @road;
      line-width: 0.5;
      line-opacity: 0.5;
      line-cap: round;
      [zoom>=12] { line-width: 1.2; }
      [zoom>=14] { line-width: 2; line-opacity: 1; }
      [zoom>=16] { line-width: 3; }
    }
    ::middleline[zoom>=12] {
      line-color: @main;
      line-width: 0;
      line-dasharray: 10, 24;
      [zoom>=14] { line-width: 2; }
      [zoom>=16] { line-width: 3; }
    }
  }
}


#road_L3 {
  [type=''] {
  	[highway='motorway_link'],
    [highway='trunk_link'],
    [highway='primary_link'],
    [highway="secondary_link"],
    [highway="tertiary_link"],
    [highway='residential_link'] {
      ::topline[zoom>=12][zoom<=15] {
        line-color: @link; 
      }
      ::case[zoom>=15] {
        line-color: @case;
        line-width: 0;
        [zoom>=15] { line-width: 2.5; }
        [zoom>=16] { line-width: 3.5; }
        [zoom>=17] { line-width: 6; }
      }
	  ::fill[zoom>=15] {
        line-color: @main;
        [zoom>=15] { line-width: 1.5; }
        [zoom>=16] { line-width: 2; }
        [zoom>=17] { line-width: 4; }
      }
    }
    [highway='unclassified'],
    [highway='residential'],
    [highway='residential;serv'],
    [highway='pedestrian'],
    [highway='living_street'],
    [highway='road'],
    [highway='service'],
    [highway='access'],
    [highway='raceway'],
    [highway='bus_guideway'],
    [highway='service'] {
      ::topline[zoom>=12][zoom<=14] {
        line-color: @res; 
      }
      ::case[zoom>=15] {
        line-color: @case;
        line-cap: round;
        [zoom>=15] { line-width: 2.5; }
        [zoom>=16] { line-width: 4; }
      }
      ::fill[zoom>=15] {
        line-color: @main;
        line-cap: round;
        [zoom>=15] { line-width: 1; }
        [zoom>=16] { line-width: 2; }
      }
    }
    [highway='track'],
    [highway='ford'],
    [highway='construction'] {
      ::topline[zoom>=12] {
        [zoom<=14] { line-color: @res; }
        [zoom>=15] { line-color: @link; }
      }
      ::case[zoom>=16] {
        line-color: @case;
        line-cap: round;
        line-dasharray: 8, 4;
        [zoom>=16] { line-width: 3; }
      }
      ::fill[zoom>=16] {
        line-color: @main;
        line-cap: round;
        [zoom>=16] { line-width: 2; }
      }
    }
  }
}

#tunnel {
  [highway="motorway"],
  [highway="trunk"],
  [highway="primary"] {
    ::case[zoom>8] {
      line-color: @case;
	  line-width: 0;
      line-dasharray: 8, 4;
      [zoom>=16] { line-width: 6; }
      [zoom>=17] { line-width: 8.5; }
    }
    ::fill[zoom>8] {
      line-color: @road_tunnel;
      line-width: 0.5;
      line-opacity: 0.5;
      [zoom>=11] { line-opacity: 1; }
      [zoom>=12] { line-width: 1.5; }
      [zoom>=14] { line-width: 2; }
      [zoom>=15] { line-width: 4; }
      [zoom>=16] { line-width: 4; }
      [zoom>=17] { line-width: 6; }
    }   
  }
  [highway="secondary"],
  [highway="tertiary"] {
    ::case[zoom>10] {
      line-color: @case;
      line-width: 0;
      line-dasharray: 8, 4;
      [zoom>=16] { line-width: 5; }
    }
    ::fill[zoom>10] {
      line-color: @road_tunnel;
      line-width: 0.5;
      line-opacity: 1;
      [zoom>=12] { line-width: 1.2; }
      [zoom>=14] { line-width: 3; }
      [zoom>=16] { line-width: 3; }
    }
  }
  [highway='motorway_link'],
  [highway='trunk_link'],
  [highway='primary_link'],
  [highway="secondary_link"],
  [highway="tertiary_link"],
  [highway='residential_link'] {
    ::topline[zoom>=12][zoom<=15] {
      line-color: @link; 
    }
    ::case[zoom>=15] {
      line-color: @case;
      line-width: 0;
      [zoom>=15] { line-width: 2.5; }
      [zoom>=16] { line-width: 3.5; }
      [zoom>=17] { line-width: 6; }
    }
    ::fill[zoom>=15] {
      line-color: @main;
      [zoom>=15] { line-width: 1.5; }
      [zoom>=16] { line-width: 2; }
      [zoom>=17] { line-width: 4; }
    }
  }
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
	::topline[zoom>=12][zoom<=14] {
      line-color: @res; 
    }
    ::case[zoom>=15] {
      line-color: @case;
      line-dasharray: 8, 2;
      [zoom>=15] { line-width: 2.5; }
      [zoom>=16] { line-width: 4; }
    }
    ::fill[zoom>=15] {
      line-color: @res;
      [zoom>=15] { line-width: 1; }
      [zoom>=16] { line-width: 2; }
    }
  }
  [highway='track'],
  [highway='service'],
  [highway='ford'],
  [highway='construction'] {
    ::topline[zoom>=12] {
      [zoom<=14] { line-color: @res; }
      [zoom>=15] { line-color: @link; }
    }
    ::case[zoom>=16] {
      line-color: @case;
      line-dasharray: 8, 4;
      [zoom>=16] { line-width: 3; }
    }
    ::fill[zoom>=16] {
      line-color: @res;
      [zoom>=16] { line-width: 2; }
    }
  }
}

#barrier {
  [zoom>=16] {
    marker-file: url(img/ico/roadblock-11.svg);
    marker-transform:"scale(0.85)";
    marker-fill: #4c4c4c;
    [zoom>=17] { marker-transform:"scale(0.9)"; }
  }
}

// =====================================================================
//   BENCHMARKS
// =====================================================================

.benchmark {
  [zoom>=17] {
    marker-file: url(img/ico/cross-12.svg);
    marker-allow-overlap: true;
    marker-ignore-placement: true;
  	text-name: "BM "+ [ELEV_FT] + "'";
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
      text-name: [NAME];
      text-face-name: @sans;
      text-size: 10;
      text-transform: capitalize;
      text-opacity: 0.85;
      text-wrap-width: 45;
      text-line-spacing: -2;
      text-halo-radius: 2;
      text-halo-fill: @text_case;
      //text-halo-rasterizer: fast;
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
      text-name: [NAME];
      text-face-name: @sans;
      text-size: 10;
      text-opacity: 0.85;
      text-transform: capitalize;
      text-wrap-width: 45;
      text-line-spacing: -2;
      text-halo-radius: 2;
      text-halo-fill: @text_case;
      //text-halo-rasterizer: fast; 
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
      text-name: [SITE_NAME];
      text-face-name: @sans;
      text-size: 10;
      text-opacity: 0.85;
      text-transform: capitalize;
      text-wrap-width: 45;
      text-line-spacing: -2;
      text-halo-radius: 2;
      text-halo-fill: @text_case;
      //text-halo-rasterizer: fast;
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
        text-name: [name];
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        //text-halo-rasterizer: fast; 
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
		text-name: [name];
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        //text-halo-rasterizer: fast; 
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 12;
        text-dx: 12; 
      }
    }
    [amenity='police'] {
      marker-file: url(img/ico/police.16.svg);
      [zoom>=17] {
		text-name: [name];
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        //text-halo-rasterizer: fast; 
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
		text-name: [name];
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        //text-halo-rasterizer: fast; 
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 12;
        text-dx: 12; 
      }
    }
    [tourism='camp_site'] { 
      marker-file: url(img/ico/camp.png);
      [zoom>=17] {
		text-name: [name];
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        //text-halo-rasterizer: fast; 
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 12;
        text-dx: 12; 
      }
    }
    [amenity='bus_station'] {
      marker-file: url(img/ico/bus-11.svg);
      [zoom>=17] {
		text-name: [name];
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        //text-halo-rasterizer: fast; 
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
		text-name: [name];
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        //text-halo-rasterizer: fast; 
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
    text-name: [name];
    text-face-name: @sans;
    text-size: 12;
    text-wrap-width: 60;
    text-line-spacing: -2;
    text-halo-radius: 2;
    text-halo-fill: @text_case;
    //text-halo-rasterizer: fast; 
    text-dy: 12; 
    [zoom>=17] { text-size: 14; }
  }
}

// =====================================================================
//   GNIS
// =====================================================================

.gnis::main {
  [FEATURE_CL='Basin'],
  [FEATURE_CL='Beach'],
  [FEATURE_CL='Bend'],
  [FEATURE_CL='Cliff'],
  [FEATURE_CL='Crater'],
  [FEATURE_CL='Gap'],
  [FEATURE_CL='Flat'],
  [FEATURE_CL='Island'],
  [FEATURE_CL='Ridge'] {
    [zoom>=15] {
      text-name: [FEATURE_NA];
      text-face-name: @sans_lt_italic;
      text-size: 10;
      text-wrap-width: 50;
      text-line-spacing: -2;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@land, 30%);
      //text-halo-rasterizer: fast; 
      text-placement-type: simple;
      text-placements: "N,S,E,W,NE,SE,NW,SW";
      [zoom>=17] { text-size: 12; }
    }
  } 
}

.gnis::range {
  [zoom>=12] {
    [FEATURE_CL='Range'] {
      text-name: [FEATURE_NA] + ' Range';
      text-face-name: @sans_lt_italic;
      text-size: 12;
      text-wrap-width: 60;
      text-line-spacing: -2;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 60%);
      //text-halo-rasterizer: fast;
      text-placement-type: simple;
      text-placements: "N,S,E,W,NE,SE,NW,SW";
      text-opacity: 0.75;
      [zoom>=15] { text-size: 13; }
      [zoom>=17] { text-size: 14; }
    }
  }
}

.gnis::valley {
  [FEATURE_CL='Valley'] {
    [zoom>=14] {
      text-name: [FEATURE_NA];
      text-face-name: @sans_lt_italic;
      text-size: 11;
      text-wrap-width: 50;
      text-line-spacing: -2;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 60%);
      //text-halo-rasterizer: fast;
      text-placement-type: simple;
      text-placements: "N,S,E,W,NE,SE,NW,SW";
      text-opacity: 0.75;
      [zoom>=17] { text-size: 13; }
    }
  } 
}

.gnis::summit {
  [FEATURE_CL='Arch'],
  [FEATURE_CL='Pillar'],
  [FEATURE_CL='Summit'] {
    [zoom>=14] {
      marker-file: url(img/ico/triangle-stroked-12.svg);
      [zoom>=15] {
        text-name: [FEATURE_NA] + ', ' + [ELEV_IN_FT];
        text-face-name: @sans;
        text-size: 10;
        text-wrap-width: 60;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: fadeout(@land, 30%);
        //text-halo-rasterizer: fast; 
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 8;
        text-dx: 8;
      }
    }
  }
}

.gnis::glacier {
  [FEATURE_CL='Glacier'] {
    [zoom>=15] {
      text-name: [FEATURE_NA] + ', ' + [ELEV_IN_FT];
      text-face-name: @sans_lt_italic;
      text-fill: @water_dark;
      text-size: 10;
      text-wrap-width: 60;
      text-line-spacing: -2;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      //text-halo-rasterizer: fast; 
      text-placement-type: simple;
      text-placements: "N,S,E,W,NE,SE,NW,SW";
      [zoom>=17] { text-size: 12; }
    }
  } 
}

.gnis::cemetery {
  [FEATURE_CL='Cemetery'] { 
    [zoom>=15] {
      marker-file: url(img/ico/cemetery-12.svg);
      [zoom>=17] {
        text-name: [FEATURE_NA];
        text-face-name: @sans;
        text-size: 10;
        text-opacity: 0.85;
        text-wrap-width: 45;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @text_case;
        //text-halo-rasterizer: fast;
        text-placement-type: simple;
        text-placements: "N,S,E,W,NE,SE,NW,SW";
        text-dy: 12;
        text-dx: 12;
      }
    }
  } 
}

.gnis::tower {
  [FEATURE_CL='Tower'] {
    [zoom>=15] {
      marker-file: url(img/ico/tower.svg);
      marker-allow-overlap: true;
      marker-ignore-placement: true;
    }
  }
}

.gnis::post {
  [FEATURE_CL='Post Office'] {
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
  [FEATURE_CL='Crossing'][CROSS_TYPE='EXIT'] {
    [zoom>=14] {
      shield-name: [FEATURE_NA];
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
  [FEATURE_CL='Crossing'][CROSS_TYPE!='EXIT'] {
    [zoom>=15] {
      text-name: [FEATURE_NA];
      text-face-name: @sans_lt_italic;
      text-fill: @water_dark;
      text-size: 11;
      text-wrap-width: 50;
      text-line-spacing: -2;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 60%);
      //text-halo-rasterizer: fast;
      text-placement-type: simple;
      text-placements: "N,S,E,W,NE,SE,NW,SW";
    }
  }
}

// =====================================================================
//   ADMIN BOUNDARY LABELS
// =====================================================================

#admin_L1_label {
  [zoom=8] {
    text-avoid-edges: true; 
    text-name: [STATE_NAME];
    text-face-name: @sans;
    text-fill: @admin;
    text-size: 13;
  }
}

.admin_L2_label {
  line-opacity: 0;
  [zoom>=15] { 
    line-width: 1;
    text-name: [COUNTY_NAM];
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
  [FTYPE=673] {
    [Shape_Area>17300000][zoom>=12] {
      text-name: [NAME];
      text-face-name: @sans_bld;
      text-fill: @military;
      text-size: 14;
      text-wrap-width: 45;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 80%);
      //text-halo-rasterizer: fast;
      text-allow-overlap: true;
      [zoom>=15] { 
        text-size: 14;
        text-face-name: @sans_bld;
        text-fill: @military;
        text-halo-radius: 0;
        text-placement: line;
        text-dy: -10;
        //text-halo-rasterizer: fast;
      }
    }
    [Shape_Area<=17300000][Shape_Area>1730000][zoom>=14] {
      text-name: [NAME];
      text-face-name: @sans_bld;
      text-fill: @military;
      text-size: 14;
      text-wrap-width: 45;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 80%);
      //text-halo-rasterizer: fast;
      [zoom>=15] { 
        text-size: 14;
        text-face-name: @sans_bld;
        text-fill: @military;
        text-halo-radius: 0;
        text-placement: line;
        text-dy: -10;
        //text-halo-rasterizer: fast;
      }
    }
    [Shape_Area<=1730000][zoom>=15] {
      text-name: [NAME];
      text-face-name: @sans_bld;
      text-fill: @military;
      text-size: 14;
      text-wrap-width: 30;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 80%);
      //text-halo-rasterizer: fast;
      [zoom>=15] { 
        text-size: 14;
        text-face-name: @sans_bld;
        text-fill: @military;
        text-halo-radius: 0;
        text-placement: line;
        text-dy: -10;
        //text-halo-rasterizer: fast;
      }
    }
  }
  // PARKS
  [FTYPE=671],
  [FTYPE=674],  
  [FTYPE=676] {
    [Shape_Area>173000000][zoom>=10] {
      text-name: [NAME];
      text-face-name: @sans_bld;
      text-fill: @park_label;
      text-size: 12;
      text-wrap-width: 45;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 80%);
      //text-halo-rasterizer: fast;
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
        //text-halo-rasterizer: fast;
      }
    }
    [Shape_Area<=173000000][Shape_Area>17300000][zoom>=12] {
      text-name: [NAME];
      text-face-name: @sans_bld;
      text-fill: @park_label;
      text-size: 12;
      text-wrap-width: 45;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 80%);
      //text-halo-rasterizer: fast;
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
        //text-halo-rasterizer: fast;
      }
    }
    [Shape_Area<=17300000][Shape_Area>1730000][zoom>=13] {
      text-name: [NAME];
      text-face-name: @sans_bld;
      text-fill: @park_label;
      text-size: 14;
      text-wrap-width: 30;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 80%);
      //text-halo-rasterizer: fast;
      text-placement: interior;
      [zoom>=15] { 
        text-size: 14;
        text-face-name: @sans_bld;
        text-fill: @park_label;
        text-halo-radius: 0;
        text-placement: line;
        text-dy: -10;
        //text-halo-rasterizer: fast;
      }
    }
    [Shape_Area<=1730000][zoom>=14] {
      text-name: [NAME];
      text-face-name: @sans_bld;
      text-fill: @park_label;
      text-size: 14;
      text-wrap-width: 30;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 80%);
      //text-halo-rasterizer: fast;
      text-placement: interior;
      [zoom>=15] { 
        text-size: 14;
        text-face-name: @sans_bld;
        text-fill: @park_label;
        text-halo-radius: 0;
        text-placement: line;
        text-dy: -10;
        //text-halo-rasterizer: fast;
      }
    }
  }
}

// NATIVE RESERVATION
.admin_L4_label {
  [Shape_Area>17300000][zoom>=12] {
    text-name: [NAME];
    text-face-name: @sans_bld;
    text-fill: @native_label;
    text-size: 14;
    text-wrap-width: 45;
    text-halo-radius: 2.5;
    text-halo-fill: fadeout(@land, 80%);
    //text-halo-rasterizer: fast;
    [zoom>=15] { 
      text-size: 14;
      text-face-name: @sans_bld;
      text-fill: @native_label;
      text-halo-radius: 0;
      text-placement: line;
      text-dy: -10;
      //text-halo-rasterizer: fast;
    }
  }
  [Shape_Area<=17300000][Shape_Area>1730000][zoom>=14] {
    text-name: [NAME];
    text-face-name: @sans_bld;
    text-fill: @native_label;
    text-size: 14;
    text-wrap-width: 45;
    text-halo-radius: 2.5;
    text-halo-fill: fadeout(@land, 80%);
    //text-halo-rasterizer: fast;
    [zoom>=15] { 
      text-size: 14;
      text-face-name: @sans_bld;
      text-fill: @native_label;
      text-halo-radius: 0;
      text-placement: line;
      text-dy: -10;
      //text-halo-rasterizer: fast;
    }
  }
  [Shape_Area<=1730000][zoom>=15] {
    text-name: [NAME];
    text-face-name: @sans_bld;
    text-fill: @native_label;
    text-size: 14;
    text-wrap-width: 30;
    text-halo-radius: 2.5;
    text-halo-fill: fadeout(@land, 80%);
    //text-halo-rasterizer: fast;
    [zoom>=15] { 
      text-size: 14;
      text-face-name: @sans_bld;
      text-fill: @native_label;
      text-halo-radius: 0;
      text-placement: line;
      text-dy: -10;
      //text-halo-rasterizer: fast;
    }
  }
}

// PRISONS
#prison_label {
  [zoom>=17] {
    text-name: [NAME];
    text-face-name: @sans;
    text-fill: @military;
    text-size: 10;
    text-wrap-width: 45;
    text-line-spacing: -2;
    text-halo-radius: 2;
    text-halo-fill: @text_case;
    //text-halo-rasterizer: fast; 
  }
}

// USDA WILDERNESS AREAS
#wilderness_area_label {
  [zoom>=12] {
    text-name: [WILDERNE_1];
    text-face-name: @sans_bld;
    text-fill: @park_label;
    text-size: 12;
    text-wrap-width: 45;
    text-halo-radius: 2.5;
    text-halo-fill: fadeout(@land, 80%);
    //text-halo-rasterizer: fast;
    text-placement: interior;
    [zoom>=15] { 
      text-size: 12;
      text-face-name: @sans_bld;
      text-fill: @park_label;
      text-halo-radius: 0;
      text-placement: line;
      text-dy: -10;
      text-min-distance: 25;
      //text-halo-rasterizer: fast;
    }
  }
}

// LOCAL PARKS
#park_label {
  [zoom>=15] {
    [boundary!='national_park'] {
      [name!='Prince William Forest Park'] {
        text-name: [name];
        text-face-name: @sans;
        text-fill: @park_label;
        text-size: 10;
        text-wrap-width: 45;
        text-line-spacing: -2;
        text-halo-radius: 2;
        text-halo-fill: @park_halo;
        //text-halo-rasterizer: fast; 
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
      text-name: [name];
      text-face-name: @sans;
      text-size: 15;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 60%);
      //text-halo-rasterizer: fast;
      text-placement-type: simple;
      text-placements: "N,S,E,W,NE,SE,NW,SW";
    }
    [zoom>=11] { text-size: 16; }
    [zoom>=14] { text-size: 18; }
    [zoom>=17] { text-size: 24; }
  }
  [place="town"] {
    [zoom>=11] {
      text-name: [name];
      text-face-name: @sans;
      text-size: 12;
      text-opacity: 0.85;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 30%);
      //text-halo-rasterizer: fast;
    }
    [zoom>=12] { text-size: 14; }
    [zoom>=13] { text-size: 16; }
    [zoom>=14] { text-size: 18; }
  }
  [place="village"] {
    [zoom>=12] {
      text-name: [name];
      text-face-name: @sans;
      text-size: 12;
      text-opacity: 0.85;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 30%);
      //text-halo-rasterizer: fast;
    }
    [zoom>=13] { text-size: 12; }
    [zoom>=14] { text-size: 14; }
    [zoom>=15] { text-size: 15; }
  }
  [place="hamlet"] {
  	[zoom>=14] {
      text-name: [name];
      text-face-name: @sans;
      text-size: 12;
      text-opacity: 0.85;
      text-halo-radius: 2.5;
      text-halo-fill: fadeout(@land, 30%);
      //text-halo-rasterizer: fast;
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
      text-name: [name] + "  " + [ref];
      text-face-name: @sans;
      text-placement: line;
      text-size: 12;
      text-halo-radius: 2.5;
      text-halo-fill: @text_case;
      //text-halo-rasterizer: fast;
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
      text-name: [name] + "  " + [ref];
  	  text-face-name: @sans;
      text-placement: line;
      text-size: 11;
      text-halo-radius: 2.5;
      text-halo-fill: @text_case;
      //text-halo-rasterizer: fast;
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
      text-name: [name] + "  " + [ref];
      text-face-name: @sans;
      text-placement: line;
      text-size: 10;
      text-halo-radius: 2;
      text-halo-fill: @text_case;
      //text-halo-rasterizer: fast;
      text-dy: -10;
      text-min-distance: 25;
      text-character-spacing: 0.5;
    }
  }
  [highway='track'],
  [highway='construction'] {
    [zoom>=15] {
      text-name: [name] + "  " + [ref];
      text-face-name: @sans;
      text-placement: line;
      text-size: 10;
      text-halo-radius: 2;
      text-halo-fill: @text_case;
      //text-halo-rasterizer: fast;
      text-dy: -10;
      text-min-distance: 25;
      text-character-spacing: 0.5;
    }
  }
}

#path_label {
  [zoom>=15] {
    text-name: [name];
    text-face-name: @sans;
    text-fill: @path_label;
    text-placement: line;
    text-size: 10;
    text-halo-radius: 2;
    text-halo-fill: @text_case;
    //text-halo-rasterizer: fast;
    text-dy: -10;
    text-min-distance: 25;
    text-character-spacing: 0.5;
  }
}

#rail_label {
  [zoom>=15] {
    text-name: [operator] + ' ' + [name];
    text-face-name: @sans;
    text-placement: line;
    text-size: 10;
    text-halo-radius: 2;
    text-halo-fill: @text_case;
    //text-halo-rasterizer: fast;
    text-dy: -10;
    text-min-distance: 500;
    text-character-spacing: 0.5;
  }
}

// =====================================================================
//   WATER FEATURE LABELS
// =====================================================================

.water_way_label {
  [FCODE!=55800],
  [FCODE!=33400] {
    [zoom>=15] {
      text-name: [GNIS_NAME];
      text-face-name: @sans_italic;
      text-placement: line;
      text-fill: @water_dark;
      text-character-spacing: 1.5;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      //text-halo-rasterizer: fast;
      text-dy: -5;
      [zoom>=16] { text-size: 13; }
    }
  }
}

.water_area_label {
  [Shape_Area>17300000] {
    [zoom>=10] {
      text-name: [GNIS_NAME];
      text-face-name: @sans_italic;
      text-size: 12;
      text-fill: @water_dark;
      text-character-spacing: 1.5;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      //text-halo-rasterizer: fast;
      text-wrap-width: 50;
      [zoom>=15] { text-size: 16; }
    }
  }
  [Shape_Area<17300000][Shape_Area>1730000] {
    [zoom>=12] {
      text-name: [GNIS_NAME];
      text-face-name: @sans_italic;
      text-fill: @water_dark;
      text-placement: interior;
      text-size: 12;
      text-character-spacing: 1.5;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      //text-halo-rasterizer: fast;
      text-wrap-width: 50;
      [zoom>=15] { text-size: 16; }
    }
  }  
  [Shape_Area<1730000] {
    [zoom>=15] {
   	  text-name: [GNIS_NAME];
      text-face-name: @sans_italic;
      text-fill: @water_dark;
      text-placement: interior;
      text-size: 12;
      text-character-spacing: 1.5;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      //text-halo-rasterizer: fast;
      text-wrap-width: 50;
    }
  }
}

.water_body_label{
  [Shape_Area>17300000] {
    [zoom>=10] {
      text-name: [GNIS_NAME];
      text-face-name: @sans_italic;
      text-size: 12;
      text-fill: @water_dark;
      text-character-spacing: 1.5;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      //text-halo-rasterizer: fast;
      text-wrap-width: 50;
      [zoom>=15] { text-size: 16; }
    }
  }
  [Shape_Area<17300000][Shape_Area>1730000] {
    [zoom>=12] {
      text-name: [GNIS_NAME];
      text-face-name: @sans_italic;
      text-fill: @water_dark;
      text-placement: interior;
      text-size: 12;
      text-character-spacing: 1.5;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      //text-halo-rasterizer: fast;
      text-wrap-width: 50;
      [zoom>=15] { text-size: 16; }
    }
  }  
  [Shape_Area<1730000] {
    [zoom>=15] {
   	  text-name: [GNIS_NAME];
      text-face-name: @sans_italic;
      text-fill: @water_dark;
      text-placement: interior;
      text-size: 12;
      text-character-spacing: 1.5;
      text-halo-radius: 2;
      text-halo-fill: fadeout(@water, 80%);
      //text-halo-rasterizer: fast;
      text-wrap-width: 50;
    }
  }
}

// =====================================================================
//   National Forest Data
// =====================================================================
#usfs_road_anno {
  [zoom=15], [zoom=16] {
    //is horizontal
    [FCSUBTYPE=7401], [FCSUBTYPE=7402], [FCSUBTYPE=7403], [FCSUBTYPE=7404], [FCSUBTYPE=7405], [FCSUBTYPE=7406], [FCSUBTYPE=7407], [FCSUBTYPE=7408] {
      [len=1] {
        shield-file: url(img/shield/1x1.png);
        shield-name: [NAME];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
      [len=2] {
        shield-file: url(img/shield/1x2.png);
        shield-name: [NAME];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
      [len=3] {
        shield-file: url(img/shield/1x3.png);
        shield-name: [NAME];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
      [len=4] {
        shield-file: url(img/shield/1x4.png);
        shield-name: [NAME];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
      [len=5] {
        shield-file: url(img/shield/1x5.png);
        shield-name: [NAME];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
      [len=6] {
        shield-file: url(img/shield/1x6.png);
        shield-name: [NAME];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
      [len=7] {
        shield-file: url(img/shield/1x7.png);
        shield-name: [NAME];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
      [len=8] {
        shield-file: url(img/shield/1x8.png);
        shield-name: [NAME];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
      [len=9] {
        shield-file: url(img/shield/1x9.png);
        shield-name: [NAME];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
    } //is vertical
    [FCSUBTYPE=7412], [FCSUBTYPE=7413], [FCSUBTYPE=7414], [FCSUBTYPE=7415], [FCSUBTYPE=7416], [FCSUBTYPE=7417] {
      [len=1] {
        shield-file: url(img/shield/1x1.png);
        shield-wrap-character: ' ';
        shield-name: [NAME_VERT];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
      [len=2] {
        shield-file: url(img/shield/2x1.png);
        shield-wrap-character: ' ';
        shield-name: [NAME_VERT];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
      [len=3] {
        shield-file: url(img/shield/3x1.png);
        shield-wrap-character: ' ';
        shield-name: [NAME_VERT];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
      [len=4] {
        shield-file: url(img/shield/4x1.png);
        shield-wrap-character: ' ';
        shield-name: [NAME_VERT];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
      [len=5] {
        shield-file: url(img/shield/5x1.png);
        shield-wrap-character: ' ';
        shield-name: [NAME_VERT];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
      [len=8] {
        shield-file: url(img/shield/8x1.png);
        shield-wrap-character: ' ';
        shield-name: [NAME_VERT];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
      [len=9] {
        shield-file: url(img/shield/9x1.png);
        shield-wrap-character: ' ';
        shield-name: [NAME_VERT];
        shield-allow-overlap: false;
        shield-placement-type: simple;
        shield-face-name: @sans;
        shield-wrap-width: 1;
        shield-wrap-before: true;
        shield-character-spacing: 1;
        shield-fill: @nsfs_text;
        shield-avoid-edges: true;
        shield-min-padding: 1;
      }
    }
  }
}

