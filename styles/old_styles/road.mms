// =====================================================================
//   ROAD STYLE SHEET
// =====================================================================

@case: #2F2626;
@road: #DD4747;
@road_tunnel: #e98888;
@main: #FFFFFF;
@link: #7a7a7a;
@res: #cccccc;
@path: #6d534a;
@text_case: #f9f7ef;

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
      // [zoom>=18] { line-width: 5; }
    }
    ::fill[zoom>=15] {
      line-color: @main;
      line-cap: round;
      [zoom>=15] { line-width: 1; }
      [zoom>=16] { line-width: 2; }
      // [zoom>=18] { line-width: 3; }
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
      // [zoom>=18] { line-width: 4; }
    }
    ::fill[zoom>=16] {
      line-color: @main;
      line-cap: round;
      [zoom>=16] { line-width: 2; }
      // [zoom>=18] { line-width: 3; }
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
    // [zoom>=18] { line-width: 5; }
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
  [type=null] {
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

#road_L2 {
  [type=null] {
    ::case[zoom>10] {
      line-color: @case;
      line-width: 0;
      line-cap: round;
      [zoom>=14] { line-width: 3; }
      [zoom>=16] { line-width: 5; }
      // [zoom>=18] { line-width: 6; }
    }
    ::fill[zoom>10] {
      line-color: @road;
      line-width: 0.5;
      line-opacity: 0.5;
      line-cap: round;
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


#road_L3 {
  [type=null] {
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
        // [zoom>=18] { line-width: 5; }
      }
      ::fill[zoom>=15] {
        line-color: @main;
        line-cap: round;
        [zoom>=15] { line-width: 1; }
        [zoom>=16] { line-width: 2; }
        // [zoom>=18] { line-width: 3; }
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
        // [zoom>=18] { line-width: 4; }
      }
      ::fill[zoom>=16] {
        line-color: @main;
        line-cap: round;
        [zoom>=16] { line-width: 2; }
        // [zoom>=18] { line-width: 3; }
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
      // [zoom>=18] { line-width: 10.5; }
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
      // [zoom>=18] { line-width: 8; }
    }   
  }
  [highway="secondary"],
  [highway="tertiary"] {
    ::case[zoom>10] {
      line-color: @case;
      line-width: 0;
      line-dasharray: 8, 4;
      [zoom>=16] { line-width: 5; }
      // [zoom>=18] { line-width: 6; }
    }
    ::fill[zoom>10] {
      line-color: @road_tunnel;
      line-width: 0.5;
      line-opacity: 1;
      [zoom>=12] { line-width: 1.2; }
      [zoom>=14] { line-width: 3; }
      [zoom>=16] { line-width: 3; }
      // [zoom>=18] { line-width: 4; }
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
      line-dasharray: 8, 2;
      [zoom>=15] { line-width: 2.5; }
      [zoom>=16] { line-width: 4; }
      // [zoom>=18] { line-width: 5; }
    }
    ::fill[zoom>=15] {
      line-color: @res;
      [zoom>=15] { line-width: 1; }
      [zoom>=16] { line-width: 2; }
      // [zoom>=18] { line-width: 3; }
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
      // [zoom>=18] { line-width: 4; }
    }
    ::fill[zoom>=16] {
      line-color: @res;
      [zoom>=16] { line-width: 2; }
      // [zoom>=18] { line-width: 3; }
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