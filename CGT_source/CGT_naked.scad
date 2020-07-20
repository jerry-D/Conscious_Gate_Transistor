//Author:  Jerry D. Harthcock
//Version 1.2
//Copyright 2020. All rights reserved.


// For ssDNA or ssRNA aspect of this 
// Conscious Gate Transistor (CGT)
//.stl models of ssDNA and ssRNA, courtesy of
// Howell ME, van Dijk K and Roston RL
// "Flexible ssDNA and ssRNA models for
// classroom demonstration." 2018.
// University of Nebraska--Linclon
// michellepalmer288@gmail.com
// 3dprint.nih.gov/discover/3DPX-0088800

contDepth=3;

module wholePunch(){
translate ([25,-3.5,0])
rotate ([0,90,60])
color("blue")
cylinder(h=8,d=1.75,center=true,$fn=36);
}

module tubeArmChair100nm(){
union(){    
for (i=[0:1:9]) {
    if (i==2)
 import("CNT_6_6_10nmPunch.stl");
// translate ([(10*i),0,0])
else translate ([(10.2*i),0,0])
rotate([0,90,0])
  import("CNT_6_6_10nm.stl");   
}   
}
}

module tubeZigZag100nm(){
union(){
for (i=[0:1:9]) {
 translate ([(10.35*i),0,0])
rotate([0,90,0])
 import("CNT_6_0_10nm.stl");
}   
}
}
module ssDNA(){
import("ssDNA_0.stl");
translate([99,0,0]) import("ssDNA_0.stl");
translate([198,0,0]) import("ssDNA_0.stl");
translate([297,0,0]) import("ssDNA_0.stl");
}


module fieldImplant(){ 
    union(){
difference(){     
translate ([0,0,(-contDepth*2)])  //"L" field (Vgs)
color("green")     
rotate([0,0,-120])
translate([19,23.25,0])
cube([68,12,contDepth], center=true);  

translate ([-22,-78.5,(contDepth*-2)]) 
color("yellow")     
cube([50,48,contDepth*2], center=true);   
}
translate ([40,-50,(-contDepth*2)]) //"L" field (Vgs) pad angle
color("green") 
rotate([0,0,60])
cube([26,66,contDepth], center=true);

}
}

module substrate(){
difference(){ 


color("grey", .5)
//difference(){
translate ([42.5,-12.5,-25]) 
cube([185,175,50], center=true);  //main substrate

//scale ([1.01, 1.01, 1.01]) fieldImplant();    
//}
/*

union(){
translate ([110,0,(contDepth/-2)+.05]) //armchair supply (Vdd)
color("yellow")     
cube([35,10,contDepth], center=true);  
   
translate ([110,0,(contDepth/-2)+.05]) //armchair supply (Vdd)
color("yellow")     
cube([50,50,contDepth], center=true);    

     
translate ([0,0,(contDepth/-2)+.05])  //"L" supply
color("yellow")     
rotate([0,0,-120])
translate([75,23.25,0])
cube([44,10,contDepth], center=true);  
  
translate ([-25,-77.5,(contDepth/-2)+.05]) //"L" supply
color("yellow")     
cube([50,45,contDepth], center=true);     


translate ([50,-77.5,(contDepth/-2)+.05]) //"L" field (Vgs) pad
color("yellow")     
cube([50,45,contDepth], center=true);     

translate ([50,-67.5,(contDepth*-1.4)]) //"L" field (Vgs) pad
color("yellow")     
cube([50,25,contDepth], center=true);     


translate ([-12,0,(contDepth/-2)+.05]) //armchair supply (Vss)
color("yellow")     
cube([35,10,contDepth], center=true); 

translate ([-25,0,(contDepth/-2)+.05]) //armchair supply (Vss)
color("yellow")     
cube([50,50,contDepth], center=true); 

translate ([25.55,25,(contDepth/-2)+.05]) //hot-spot tap
color("yellow")     
cube([5.5,57,contDepth], center=true);

translate ([40,50,(contDepth/-2)+.05]) //hot-spot tap
color("yellow")     
cube([50,50,contDepth], center=true);
}     
*/ 
 
translate ([62.5,0,0])
//    cube([125,2.7,2.7], center=true); //armchair recess   
    cube([125,4,2.7], center=true); //armchair recess   

translate ([27,0,0])
rotate([0,0,-120])
    translate([62.5,0,0])
//    cube([125,1.7,1.7], center=true); //tap "L" recess
    cube([125,2,1.7], center=true); //tap "L" recess
 
//scale ([1.01, 1.01, 1.01]) fieldImplant(); 
}
//color("green") fieldImplant();
}

//color("White")
//substrate();
color("green",.4) import("field_only.stl");
color("yellow") import("pads_only.stl");
scale([1.0001,1.0001,1.0001])



translate ([27,0,0])
//translate ([26.3,-1.11,0])
rotate([0,0,-120])
color("gold")
tubeZigZag100nm();

tubeArmChair100nm();

color("gray",.7) import("substrate_only.stl");


color("pink")
translate ([38,-9,-.45])
scale([3.5,3.5,1])
rotate ([0,0,-90])
linear_extrude(1,2,center=true){
    text("A");
}    



translate([23,-5.5,2])
scale([.15,.15,.15])
rotate([0,0,-120])
rotate([-180,0,0])
color("red") ssDNA();




