/* (c) 2018 Sergio Visinoni - piffio
 *
 * Measures for the PCB size and headers were taken from @saarbastler library.scad repository, available here
 *
 * https://github.com/saarbastler/library.scad
 *
 */

$fn=100;

// Constants
hat_offset=[0,0,13.4];
pcb_thickness=1.4;

module digiamp()
{
        module capacitor() {
                d=7.5;
                h=12;

                color("darkblue") cylinder(d=d, h=h);
        }

        module coil() {
                x=11.5;
                y=10;
                z=10;

                color("darkgrey") cube([x,y,z]);
        }

        module whitebox() {
                x=7;
                y=4;
                z=9.5;

                color("white") cube([x,y,z]);
        }

        translate(hat_offset)
        {
                // PCB
                color("limegreen") difference()
                {
                        translate([(65-85)/2,0,0]) hull()
                        {
                                translate([-(65-6)/2,-(56-6)/2,0]) cylinder(r=3, h=1.4 );
                                translate([-(65-6)/2, (56-6)/2,0]) cylinder(r=3, h=1.4 );
                                translate([ (65-6)/2,-(56-6)/2,0]) cylinder(r=3, h=1.4 );
                                translate([ (65-6)/2, (56-6)/2,0]) cylinder(r=3, h=1.4 );
                        }

                        translate([-85/2+3.5,-49/2,-1]) cylinder(d=2.75, h=3);
                        translate([-85/2+3.5, 49/2,-1]) cylinder(d=2.75, h=3);
                        translate([58-85/2+3.5,-49/2,-1]) cylinder(d=2.75, h=3);
                        translate([58-85/2+3.5, 49/2,-1]) cylinder(d=2.75, h=3);
                }

                // Header down
                translate([3.5-85/2+29-10*2.54,49/2-2.54,-8])
                        color("black") cube([2.54*20,5.08,8]);

                // Ports
                translate([-85/2,-56/2,pcb_thickness])
                {
                        // Power Plug
                        translate([10,0,0])
                        {
                                difference()
                                {
                                        color("black") cube([8.5, 12, 11]);
                                        translate([8.5/2, -0.5, 6]) rotate([-90,0,0]) cylinder(d=6, h=10);
                                }
                        }
                        // Speaker out
                        translate([25,0,0])
                        {
                                color("green") cube([10, 10, 7]);
                        }
                        translate([44,0,0])
                        {
                                color("green") cube([10, 10, 7]);
                        }
                }

                // Extruding elements
                translate([-85/2,-56/2,pcb_thickness])
                {
                        translate([21.5, 32])
                                capacitor();
                        translate([56, 24.5])
                                capacitor();
                        translate([26, 17])
                                coil();
                        translate([40, 17])
                                coil();
                        translate([22.5,12])
                                whitebox();
                        translate([30.5,12])
                                whitebox();
                        translate([40.5, 12])
                                whitebox();
                        translate([49,12])
                                whitebox();
                }
        }
}
