//cette version du normographe vise à générer une trame qui est fonction du niveau de gris des pixels.

import processing.pdf.*;

PImage source;
PImage destination;
PShape trame;

void setup(){
	source = loadImage("devoitine520.jpg");
	destination = createImage(source.width, source.height, RGB);
	trame = loadShape("cercle.svg");
	size(source.width,source.height, PDF, "devoitinetrame.pdf");
	println("width:"+source.width+"px"+"height:"+source.height+"px");

}

void draw(){

	background(255);
	source.loadPixels();
	destination.loadPixels();
	int tx=8;
	int ty=8;

	for(int x=0; x<source.width; x+=tx){
		for (int y=0; y<source.height; y+=ty){
			int loc = x+y*source.width;

			float gros=brightness(source.pixels[loc])/50;
			shape(trame,x,y,gros, gros);
			noLoop();


		}
	}

exit();

}