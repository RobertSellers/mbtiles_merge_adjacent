// =====================================================================
//   WATER STYLE SHEET
// =====================================================================

@water_dark: #185869;
@wetland: #c0d5cc;
@water_infra: #585151;
@levee: #6f5842;

// =============================================
// WATER_AREA_SHORE
// =============================================

.water_area_shore {
  // fcode=31200 -> BAY/INLET
  // fcode=44500 -> SEA/OCEAN
  // fcode=46006 -> STREAM/RIVER: PERENNIAL
  // fcode=49300 -> ESTUARY
  [fcode=31200],
  [fcode=46006],
  [fcode=44500],
  [fcode_2=49300] {
    polygon-clip: false;
    polygon-fill: @water_dark;
    ::blur {
      image-filters: agg-stack-blur(1,1);
      image-filters-inflate: true;
      polygon-clip: false;
      polygon-fill: @water;
      polygon-gamma: 0.35;
      [fcode=46006] { 
        polygon-gamma: 0.5; 
        [zoom>=12] { polygon-gamma: 0.75; }
      }
    }
  }
  // fcode=53700 -> AREA OF COMPLEX CHANNELS
  [fcode=53700] {
	[zoom>=10] {
      polygon-fill: @wetland;
      line-color: @wetland;
      [zoom>=16] { line-width: 4; }
      [zoom>=17] { line-width: 7; }
    }
  }
  // fcode=34300 -> DAM/WEIR: NO ATTRIBUTES
  // fcode=34305 -> DAM/WEIR: EARTHEN
  // fcode=34306 -> DAM/WEIR: NON-EARTHEN
  [fcode=34300],
  [fcode=34305],
  [fcode=34306] {
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
  // fcode=39800 -> LOCK CHAMBER
  // fcode=45500 -> SPILLWAY
  // fcode=36200 -> FLUME
  // fcode=48500 -> WATER INTAKE/OUTFLOW
  [fcode=39800],
  [fcode=45500],
  [fcode=36200],
  [fcode=48500] {
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
  // fcode=56800 -> LEVEE
  [fcode=56800] {
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
  // fcode=36400 -> FORESHORE
  [fcode=36400] {
    [zoom>=13] {
      polygon-fill: @water_dark;
      polygon-opacity: 0.025;
    }
    [zoom>=14] { polygon-opacity: 0.05; }
  }
  // fcode=40300 -> INUNDATION AREA: NO ATTRIBUTES
  // fcode=40307 -> INUNDATION AREA: NOT CONTROLLED
  // fcode=40308 -> INUNDATION AREA: CONTROLLED
  // fcode=40309 -> INUNDATION AREA: CONTROLLED: FLOOD ELEV.
  [fcode=40300],
  [fcode=40307],
  [fcode=40308],
  [fcode=40309] {
  	[zoom>=12] { 
      polygon-fill: @wetland; 
      polygon-opacity: 0.4;
    }
  }
  // fcode=43100 -> RAPIDS
  [fcode=43100] {
    [zoom>=14] {
      polygon-pattern-file: url(img/pattern/wave.png);
      polygon-pattern-opacity: 0.35;
    }
    [zoom>=15] { polygon-pattern-opacity: 0.5; }
  }
  // fcode=45400 -> SPECIAL USE ZONE: NO ATTRIBUTES
  // fcode=45401 -> SPECIAL USE ZONE: DUMP SITE: OPERATIONAL
  // fcode=45402 -> SPECIAL USE ZONE: DUMP SITE: ABANDONED
  // fcode=45403 -> SPECIAL USE ZONE: SPOIL AREA: OPERATIONAL
  // fcode=45404 -> SPECIAL USE ZONE: SPOIL AREA: ABANDONED
  [fcode=45400],
  [fcode=45401],
  [fcode=45402],
  [fcode=45403],
  [fcode=45404] {
    [shape_area>0.001] {
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
    [shape_area<0.001] {
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
  // fcode=46000 -> STREAM/RIVER: NO ATTRIBUTES
  // fcode=46003 -> STREAM/RIVER: INTERMITTENT
  // fcode=33600 -> CANAL/DITCH: NO ATTRIBUTES
  // fcode=33601 -> CANAL/DITCH: AQUEDUCT
  // fcode=33602 -> CANAL/DITCH: UNSPECIFIED
  [fcode=46000],
  [fcode=46003],
  [fcode=33600],
  [fcode=33601],
  [fcode=33602] {
	[shape_area>0.001] {
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
    [shape_area<0.001] {
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
  // fcode=46100 -> SUBMERGED STREAM
  [fcode=46100] {
    // 'An old river innundated or impounded by water;
    // NOT CURRENTLY STYLED
  }
  // fcode=48400 -> WASH
  [fcode=48400] {
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

.water_area {
  // fcode=31200 -> BAY/INLET
  // fcode=44500 -> SEA/OCEAN
  // fcode=46006 -> STREAM/RIVER: PERENNIAL
  // fcode=49300 -> ESTUARY
  [fcode=31200],
  [fcode=46006],
  [fcode=44500] {
    polygon-clip: false;
    polygon-fill: @water_dark;
    ::blur {
      image-filters: agg-stack-blur(1,1);
      image-filters-inflate: true;
      polygon-clip: false;
      polygon-fill: @water;
      polygon-gamma: 0.35;
      [fcode=46006] { 
        polygon-gamma: 0.5; 
        [zoom>=12] { polygon-gamma: 0.75; }
      }
    }
  }
  // fcode=53700 -> AREA OF COMPLEX CHANNELS
  [fcode=53700] {
	[zoom>=10] {
      polygon-fill: @wetland;
      line-color: @wetland;
      [zoom>=16] { line-width: 4; }
      [zoom>=17] { line-width: 7; }
    }
  }
  // fcode=34300 -> DAM/WEIR: NO ATTRIBUTES
  // fcode=34305 -> DAM/WEIR: EARTHEN
  // fcode=34306 -> DAM/WEIR: NON-EARTHEN
  [fcode=34300],
  [fcode=34305],
  [fcode=34306] {
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
  // fcode=39800 -> LOCK CHAMBER
  // fcode=45500 -> SPILLWAY
  // fcode=36200 -> FLUME
  // fcode=48500 -> WATER INTAKE/OUTFLOW
  [fcode=39800],
  [fcode=45500],
  [fcode=36200],
  [fcode=48500] {
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
  // fcode=56800 -> LEVEE
  [fcode=56800] {
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
  // fcode=36400 -> FORESHORE
  [fcode=36400] {
    [zoom>=13] {
      polygon-fill: @water_dark;
      polygon-opacity: 0.025;
    }
    [zoom>=14] { polygon-opacity: 0.05; }
  }
  // fcode=40300 -> INUNDATION AREA: NO ATTRIBUTES
  // fcode=40307 -> INUNDATION AREA: NOT CONTROLLED
  // fcode=40308 -> INUNDATION AREA: CONTROLLED
  // fcode=40309 -> INUNDATION AREA: CONTROLLED: FLOOD ELEV.
  [fcode=40300],
  [fcode=40307],
  [fcode=40308],
  [fcode=40309] {
  	[zoom>=12] { 
      polygon-fill: @wetland; 
      polygon-opacity: 0.4;
    }
  }
  // fcode=43100 -> RAPIDS
  [fcode=43100] {
    [zoom>=14] {
      polygon-pattern-file: url(img/pattern/wave.png);
      polygon-pattern-opacity: 0.35;
    }
    [zoom>=15] { polygon-pattern-opacity: 0.5; }
  }
  // fcode=45400 -> SPECIAL USE ZONE: NO ATTRIBUTES
  // fcode=45401 -> SPECIAL USE ZONE: DUMP SITE: OPERATIONAL
  // fcode=45402 -> SPECIAL USE ZONE: DUMP SITE: ABANDONED
  // fcode=45403 -> SPECIAL USE ZONE: SPOIL AREA: OPERATIONAL
  // fcode=45404 -> SPECIAL USE ZONE: SPOIL AREA: ABANDONED
  [fcode=45400],
  [fcode=45401],
  [fcode=45402],
  [fcode=45403],
  [fcode=45404] {
    [shape_area>0.001] {
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
    [shape_area<0.001] {
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
  // fcode=46000 -> STREAM/RIVER: NO ATTRIBUTES
  // fcode=46003 -> STREAM/RIVER: INTERMITTENT
  // fcode=33600 -> CANAL/DITCH: NO ATTRIBUTES
  // fcode=33601 -> CANAL/DITCH: AQUEDUCT
  // fcode=33602 -> CANAL/DITCH: UNSPECIFIED
  [fcode=46000],
  [fcode=46003],
  [fcode=33600],
  [fcode=33601],
  [fcode=33602] {
	[shape_area>0.001] {
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
    [shape_area<0.001] {
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
  // fcode=46100 -> SUBMERGED STREAM
  [fcode=46100] {
    // 'An old river innundated or impounded by water;
    // NOT CURRENTLY STYLED
  }
  // fcode=48400 -> WASH
  [fcode=48400] {
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
  // FCODE=37800 -> ICE MASS
  [FCODE=37800] {
    polygon-fill: @snow; 
  }
  // FCODE=39000 -> LAKE/POND: NO ATTRIBUTES
  // FCODE=39004 -> LAKE/POND: PERENNIAL: UNSPECIFIED
  // FCODE=39009 -> LAKE/POND: PERENNIAL: AVERAGE WATER
  // FCODE=39010 -> LAKE/POND: PERENNIAL: NORMAL
  // FCODE=39011 -> LAKE/POND: PERENNIAL: DATE OF PHOTO
  // FCODE=39012 -> LAKE/POND: PERENNIAL: SPILLWAY
  [FCODE=39000],
  [FCODE=39004],
  [FCODE=39009],
  [FCODE=39010],
  [FCODE=39011],
  [FCODE=39012] {
    [Shape_Area>0.001] {
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
    [Shape_Area<0.001] {
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
  // FCODE=39001 -> LAKE/POND: INTERMITTENT: SALT
  // FCODE=39005 -> LAKE/POND: IMTERMITTENT: HIGH WATER
  // FCODE=39006 -> LAKE/POND: INTERMITTENT: DATE OF PHOTO
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
  // FTYPE=436 -> RESEVOIR
  // -------- GENERAL --------
  // FCODE=43600 -> RESERVOIR: NO ATTRIBUTES
  // FCODE=43618 -> RESERVOIR: EARTHEN
  // FCODE=43619 -> RESERVOIR: NON-EARTHEN
  // FCODE=43601 -> RESERVOIR: AQUACULTURE
  // FCODE=43603 -> RESERVOIR: DECORATIVE POOL
  // FCODE=43608 -> RESERVOIR: SWIMMING POOL
  // FCODE=43616 -> RESERVOIR: STORAGE: NON-EARTHEN: NOT COVERED
  // FCODE=43614 -> RESERVOIR: STORAGE: EARTHEN: NOT COVERED: INTERMITTENT
  // FCODE=43615 -> RESERVOIR: STORAGE: EARTHEN: NOT COVERED: PERENNIAL
  // FCODE=43621 -> RESERVOIR: STORAGE: UNSPECIFIED: PERENNIAL
  // FCODE=43617 -> RESERVOIR: STORAGE: UNSPECIFIED
  // ------- EVAPORATOR -------
  // FCODE=43607 -> RESERVOIR: EVAPORATOR: UNSPECIFIED
  // FCODE=43623 -> RESERVOIR: EVAPORATOR: EARTHEN
  // -------- DISPOSAL --------
  // FCODE=43604 -> RESERVOIR: DISPOSAL: TAILINGS POND: EARTHEN
  // FCODE=43605 -> RESERVOIR: DISPOSAL: TAILINGS POND: UNSPECIFIED
  // FCODE=43606 -> RESERVOIR: DISPOSAL: UNSPECIFIED
  // FCODE=43625 -> RESERVOIR: DISPOSAL: EARTHEN
  // FCODE=43626 -> RESERVOIR: DISPOSAL: NON-EARTHEN
  // -------- TREATMENT --------
  // FCODE=43609 -> RESERVOIR: TREATMENT: COOLING POND
  // FCODE=43610 -> RESERVOIR: TREATMENT: FILTRATION POND
  // FCODE=43611 -> RESERVOIR: TREATMENT: SETTLING POND
  // FCODE=43612 -> RESERVOIR: TREATMENT: SEWAGE TREATMENT
  // FCODE=43624 -> RESERVOIR: TREATMENT: UNSPECIFIED
  // -------- COVERED --------
  // FCODE=43613 -> RESERVOIR: STORAGE: NON-EARTHEN: COVERED
  [FTYPE=436] {
    // -------- GENERAL --------
    [Shape_Area>0.001] {
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
    [Shape_Area<0.001] {
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
  // FCODE=36100 -> PLAYA (DRY LAKE)
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
  // FCODE=46600 -> SWAMP/MARSH
  // FCODE=46601 -> SWAMP/MARSH: INTERMITTENT
  // FCODE=46602 -> SWAMP/MARSH: PERENNIAL
  [FCODE=46600],
  [FCODE=46601],
  [FCODE=46602] {
    [Shape_Area>0.001] {
      polygon-fill: @wetland;
      [zoom>12] {
        polygon-pattern-file: url(img/pattern/wetland_64.png);
        polygon-pattern-opacity: 0.9;
      } 
    }
    [Shape_Area<0.001] {
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
  // FCODE=55800 -> ARTIFICIAL PATH
  // FCODE=33400 -> CONNECTOR
  [FCODE=55800],
  [FCODE=33400] {
    //line-color: red; 
  }
  // FCODE=33600 -> CANAL/DITCH: NO ATTRIBUTES
  // FCODE=33601 -> CANAL/DITCH: AQUEDUCT
  // FCODE=33602 -> CANAL/DITCH: UNSPECIFIED
  // FCODE=42801 -> PIPELINE: AQUEDUCT: SURFACE
  // FCODE=42805 -> PIPELINE: GENERAL: SURFACE
  // FCODE=42809 -> PIPELINE: PENSTOCK: SURFACE
  // FCODE=42813 -> PIPELINE: SIPHON: UNSPECIFIED
  // FCODE=42814 -> PIPELINE: GENERAL: UNSPECIFIED
  // FCODE=42815 -> PIPELINE: PENSTOCK: UNSPECIFIED
  // FCODE-42816 -> PIPELINE: AQUEDUCT: UNSPECIFIED
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
  // FCODE=42802 -> PIPELINE: AQUEDUCT: ELEVATED
  // FCODE=42806 -> PIPELINE: GENERAL: ELEVATED
  // FCODE=42810 -> PIPELINE: PENSTOCK: ELEVATED
  [FCODE=42802],
  [FCODE=42806],
  [FCODE=42810] {
    // CONSIDER OPTIONS FOR UNIQUE STYLING
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
  // FCODE=42803 -> PIPELINE: AQUEDUCT: UNDERGROUND
  // FCODE=42807 -> PIPELINE: GENERAL: UNDERGROUND
  // FCODE=42811 -> PIPELINE: PENSTOCK: UNDERGROUND
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
  // FCODE=42804 -> PIPELINE: AQUEDUCT: UNDERWATER
  // FCODE=42808 -> PIPELINE: GENERAL: UNDERWATER
  // FCODE=42812 -> PIPELINE: PENSTOCK: UNDERWATER
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
  // FCODE=46000 -> STREAM/RIVER: NO ATTRIBUTES
  // FCODE=46006 -> STREAM/RIVER: PERENNIAL
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
  // FCODE=46003 -> STREAM/RIVER: INTERMITTENT
  // FCIDE=46007 -> STREAM/RIVER: EPHEMERAL
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
  // FCODE=42000 -> UNDERGROUND CONDUIT (KARST)
  [FCODE=42000] {
    // CHECK STYLING WHEN EXAMPLE FOUND
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
  // fcode=34300 -> DAM/WEIR: NO ATTRIBUTES
  // fcode=34305 -> DAM/WEIR: EARTHEN
  // fcode=34306 -> DAM/WEIR: NON-EARTHEN
  [fcode=34300],
  [fcode=34305],
  [fcode=34306] {
    [zoom>=15] {
      marker-file: url(img/ico/square-12.svg);
      marker-fill: @water_infra;
      marker-allow-overlap: true;
    }
  }
  // fcode=36900 -> GATE
  // fcode=39800 -> LOCK CHAMBER
  [fcode=36900],
  [fcode=39800] {
    [zoom>=15] {
      marker-file: url(img/ico/square-12.svg);
      marker-transform:"scale(0.65)";
      marker-fill: @water_infra;
      marker-allow-overlap: true;
    }
  }
  // fcode=36701 -> GAUGING STATION
  [fcode=36701] {
    [zoom>=17] {
      marker-file: url(img/ico/gauging-station.png);
      marker-allow-overlap: true;
    }
  }
  // fcode=43100 -> RAPIDS
  // fcode=48700 -> WATERFALL
  [fcode=43100],
  [fcode=48700] {
    [zoom>=15] {
      marker-file: url(img/ico/square-12.svg);
      marker-transform:"scale(0.65)";
      marker-fill: @water_dark;
      marker-allow-overlap: true;
    }
  }
  // ftype=436 -> RESEVOIR
  // -------- GENERAL --------
  // fcode=43600 -> RESERVOIR: NO ATTRIBUTES
  // fcode=43618 -> RESERVOIR: EARTHEN
  // fcode=43619 -> RESERVOIR: NON-EARTHEN
  // fcode=43601 -> RESERVOIR: AQUACULTURE
  // fcode=43603 -> RESERVOIR: DECORATIVE POOL
  // fcode=43608 -> RESERVOIR: SWIMMING POOL
  // fcode=43616 -> RESERVOIR: STORAGE: NON-EARTHEN: NOT COVERED
  // fcode=43614 -> RESERVOIR: STORAGE: EARTHEN: NOT COVERED: INTERMITTENT
  // fcode=43615 -> RESERVOIR: STORAGE: EARTHEN: NOT COVERED: PERENNIAL
  // fcode=43621 -> RESERVOIR: STORAGE: UNSPECIFIED: PERENNIAL
  // fcode=43617 -> RESERVOIR: STORAGE: UNSPECIFIED
  // fcode=43607 -> RESERVOIR: EVAPORATOR: UNSPECIFIED
  // fcode=43623 -> RESERVOIR: EVAPORATOR: EARTHEN
  // -------- DISPOSAL --------
  // fcode=43604 -> RESERVOIR: DISPOSAL: TAILINGS POND: EARTHEN
  // fcode=43605 -> RESERVOIR: DISPOSAL: TAILINGS POND: UNSPECIFIED
  // fcode=43606 -> RESERVOIR: DISPOSAL: UNSPECIFIED
  // fcode=43625 -> RESERVOIR: DISPOSAL: EARTHEN
  // fcode=43626 -> RESERVOIR: DISPOSAL: NON-EARTHEN
  // -------- TREATMENT --------
  // fcode=43609 -> RESERVOIR: TREATMENT: COOLING POND
  // fcode=43610 -> RESERVOIR: TREATMENT: FILTRATION POND
  // fcode=43611 -> RESERVOIR: TREATMENT: SETTLING POND
  // fcode=43612 -> RESERVOIR: TREATMENT: SEWAGE TREATMENT
  // fcode=43624 -> RESERVOIR: TREATMENT: UNSPECIFIED
  // -------- COVERED --------
  // fcode=43613 -> RESERVOIR: STORAGE: NON-EARTHEN: COVERED
  [ftype=436] {
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
  // fcode=44100 -> ROCK: NO ATTRIBUTES
  // fcode=44101 -> ROCK: ABOVE-WATER
  // fcode=44102 -> ROCK: UNDER-WATER
  [fcode=44100],
  [fcode=44101],
  [fcode=44102] {
  	[zoom>=16] {
	  text-name: "'*'";
      text-face-name: @sans_bld;
      text-size: 16;
      text-allow-overlap: true;
    }
  }
  // fcode=45000 -> SINK/RISE
  [fcode=45000] {
    [zoom>=15] {
	  marker-file: url(img/ico/triangle-12.svg);
      marker-fill: mix(@water, @water_dark, 50);
      marker-line-color: mix(@water, @water_dark, 50);
      marker-allow-overlap: true;
    }
  }
  // fcode=45800 -> SPRING/SEEP
  // fcode=48800 -> WELL
  [fcode=45800],
  [fcode=48800] {
    [zoom>=15] {
      marker-file: url(img/ico/circle-stroked-12.svg);
      marker-fill: mix(@water, @water_dark, 50);
      marker-line-color: mix(@water, @water_dark, 50);
      marker-allow-overlap: true;
    }
  }  
  // fcode=48500 -> WATER INTAKE/OUTFLOW
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
  // FCODE=31800 -> BRIDGE
  [FCODE=31800] {
    // NOT NEEDED, COVERED BY OSM ROADS
  }
  // FCODE=34300 -> DAM/WEIR: NO ATTRIBUTES
  // FCODE=34305 -> DAM/WEIR: EARTHEN
  // FCODE=34306 -> DAM/WEIR: NON-EARTHEN
  // FCODE=36900 -> GATE
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
  // FCODE=36200 -> FLUME
  // FCODE=39800 -> LOCK CHAMBER
  [FCODE=36200],
  [FCODE=39800] {
    // CHECK STYLING WHEN EXAMPLE FOUND
    [zoom>=12] {
      line-color: mix(@water, @water_infra, 80);
      line-opacity: 0.5;
    }
    [zoom>14] { line-opacity: 0.75; }
    [zoom>=15] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
  }
  // FCODE=41100 -> NONEARTHEN SHORE
  // FCODE=48300 -> WALL
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
  // FCODE=56800 -> LEVEE
  [FCODE=56800] {
    // CHECK STYLING WHEN EXAMPLE FOUND
  }
  // FCODE=43100 -> RAPIDS
  // FCODE=48700 -> WATERFALL
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
  // FCODE=43400 -> REEF
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
  // FCODE=45000 -> SINK/RISE
  [FCODE=45000] {
    // CHECK STYLING WHEN EXAMPLE FOUND
  }
}