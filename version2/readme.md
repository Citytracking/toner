==Option 1:
Normally we want to show the labels with the basemap. 

    The MML file would then read:
     
    <Stylesheet src="naturalearth-lowzooms.mss"/>
    <Stylesheet src="stylesheet.mss"/> 
    <Stylesheet src="labels.mss"/>
    <!-- 
          <Stylesheet src="labels_only.mss"/>  
    -->
     
==Option 2: 
For map-only (no label) render
    
    The MML file would then read:
     
    <Stylesheet src="naturalearth-lowzooms.mss"/>
    <Stylesheet src="stylesheet.mss"/> 
    <!-- 
          <Stylesheet src="labels.mss"/>
          <Stylesheet src="labels_only.mss"/>  
    -->
     
==Option 3:
For labels-only render, we want the map background to be transparent, not black.

    The MML file would then read:
         
    <!--  <Stylesheet src="naturalearth-lowzooms.mss"/>
          <Stylesheet src="stylesheet.mss"/> 
    -->
    <Stylesheet src="labels.mss"/>
    <Stylesheet src="labels_only.mss"/>