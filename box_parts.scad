module TopShelf(){
//translate([70,176,6])
//rotate([0,-90,-90])
translate([20,60,0])
rotate([0,0,-90])    {
color("purple")
     difference(){
            cube([42,270,6]);
            for(ypos=[21:33:260]){
                translate([22, ypos,-1])cylinder(h=8, r1=6,r2=6);
            }
        }
color("purple")translate([10,270,0])cube([12,6,6]);
color("purple")translate([10,-6,0])cube([12,6,6]);
}
}


module BottomShelf(){
    //translate([70,282,6])
    //rotate([0,-90,-90])
translate([20,106,0])
rotate([0,0,-90]){
        color("orange")
        difference(){
            cube([42,270,6]);
            for(ypos=[21:33:260]){
                translate([22, ypos,-1])cylinder(h=8, r1=12.5,r2=12.5);
                translate([28, ypos-11,-1])cube([20,22,8]);
            }
        }
        color("orange")translate([10,270,0])cube([12,6,6]);
        color("orange")translate([10,-6,0])cube([12,6,6]);
    }
}

module Bottom(){
    length = 318;
    width = 270;
for(ypos=[70:12:386]){
    translate([64,ypos,0])
    cube([6,6,6]);
    translate([340,ypos,0])
    cube([6,6,6]);
}

for(xpos=[70:12:340]){
    translate([xpos,64,0])
    cube([6,6,6]);
    translate([xpos,388,0])
    cube([6,6,6]);
}

translate([70,70,0])
  difference(){
      cube([270,318,6.0]);
      {
                translate([width/3,length/3,-1])
                cube([12,6,8]);
                translate([2 * width /3,length/3,-1])
                cube([12,6,8]);
                translate([width/3,2*length/3,-1])
                cube([12,6,8]);
                translate([2 * width /3,2*length/3,-1])
                cube([12,6,8]);
      }
  } 
}


  

module edge(width=50, length=210, slot1=0, slot2=0){
    translate([70,8,0])
    
    if (slot1  == 0){
        cube([length,42,6.0]);
    }else{
        difference(){
            cube([length,42,6.0]);{
                translate([slot1,20,-3])
                cube([6,12,14]);
                translate([slot2,20,-3])
                cube([6,12,14]);
            }
        }
    }
    for(xpos=[64:12:length+66]){
        translate([xpos,width,0])
        cube([6,6,6]);
    }

    for(ypos=[8:12:width]){
        translate([width+14,ypos,0])
        cube([6,6,6]);
    }

    for(ypos=[14:12:width-4]){
        translate([length+70,ypos,0])
        cube([6,6,6]);
    }
    
};


module short_sides(){

//Top Edge

color("blue")
//translate([0,64,56])
//rotate([-90,0,0])
translate([-50,100,0])
{
edge(50,270,0);
}
//Bottom Edge
color("green")
//translate([410,394,56])
//rotate([90,180,0])
translate([-50,150,0])
{
edge(50,270,0);
}

}
module long_sides(){

//left edge
color("white")
translate([-50,200,0])

//translate([64,458,56])
//rotate([-90,0,270])
{
    edge(50,318,100,206);
}
//right edge
color("grey")
//translate([346,0,56])
//rotate([90,180,270])
translate([-50,250,0])
{
    edge(50,318,212,106);
}
}

//projection()
rotate([0,0,90])
{
translate([-350,-320,0])    
TopShelf();
translate([-350,-320,0])    
BottomShelf();
translate([-350,-320,0])    
    long_sides();
translate([-350,-320,0])    
    short_sides();
}

//projection(){
//Bottom();
//}



