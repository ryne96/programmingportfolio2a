// Ryne Nguyen | TimeLineProject | 09-30-24
void setup() {
  size(900, 400);
  background(127);
}

void draw() {
  background(127);
  drawRef();
  histEvent(100, 200, "1941", "In 1941, One of the earliest computers built by German engineer Konrad Zuse.\n The computer was able to perform floating point binary arithmetic that uses 2,300 relays and had a 22-bit word length.\n This computer was the Z3 and it was used for aerodynamic calculations but was destroyed in a bombing raid on Berlin late 1943. ", true);
  histEvent(200, 300, "1943", "In 1943, the US Army requested that Bell Laboratories design a machine that assisted the M-9 gun director, an analog computer that calculates and automatically aims weapons.\n Mathematician George Stibitz invented the Relay Interpolator also called the Bell Labs Model II.\n The computer used 440 relays and was programmable on paper tape so the uses for it grew following the war.", false);
  histEvent(300, 200, "1946", "In 1945, John von Neumann wrote a draft of a report on the EDVAC in Princeton New Jersey.\n Mathematician John von Neumann talks about the development of stored program computers like electronic storage of computer programming information and data.\n This makes the need for storage like plugboards, punched cards, and paper unneeded. After the war, the focused on developing the Princeton’s Institute for Advanced Studies Computer", true);
  histEvent(400, 300, "1948", "In 1948, The first computer program to run on a computer. The University of Manchester researched the Small Scale Experimental  Machines or called the Baby.\n The Baby was built to test new memory technology developed by Frederic Williams and Tom Kilburn.\n The Williams Tube was the first high speed electronic random access memory for computers.", false);
  histEvent(500, 200, "1950", "In 1950 The ERA 1101 was invented. The ERA 1101 was one of the first computers to be produced commercially in Minnesota.\n The ERA 1101 was built by Remington-Rand and was intended for high speed processing and stored 1 million bits on its magnetic drum,\n one of the earliest magnetic storages. ", true);
  histEvent(600, 300, "1954", "In 1954, the IBM 650 magnetic drum calculator was introduced.\n The IBM 650 magnetic drum calculator stored data in its magnetic data storage drums and were much faster at accessing information compared to other drum machines.\n The IBM 650 was created in a New York laboratory by the principal designer Frank Hamelton", false);
  histEvent(700, 200, "1956", "In 1956, computers were able to receive direct keyboard inputs. At MIT, researchers were experimenting with keyboard inputs to a computer.\n Usually computer users at that time inserted their program into computers using punched cards or paper tapes.\n Doug Ross said that a Flexowriter was an electrically controlled typewriter that was connected to MIT computer which would act as a keyboard.", true);
  histEvent(800, 300, "1958", "In 1958, RCA introduced its Model 501 transistorized computer made by John Vassos in New Jersey, America.\n The 501 was built on a building block concept which could control up to 63 tape drives because of the concept's flexibility.\n Although it had slow processing speeds, it's easy access to great storage benefited more towards customers and businesses.", false);
}

void drawRef() {
  //timelineformat
  strokeWeight(3);
  stroke(0);
  line(100, 250, 840, 250);
  textSize(18);
  text("1940", 80, 270);
  text("1960", 860, 270);
  //Title text
  textSize(35);
  textAlign(CENTER);
  fill(50);
  text("Historic Computer Systems", width/2, 60);
  textSize(30);
  text("by Ryne Nguyen", width/2, 85);
}

void histEvent(int x, int y, String val, String detail, boolean top) {
  if (top) {
    line(x, y, x+20, y+50);
  } else {
    line(x, y, x+20, y-50);
  }
  fill(200);
  rectMode(CENTER);
  rect(x, y, 80, 20);
  fill(0);
  textSize(12);
  text(val, x, y+5);

  if (mouseX>x-40 && mouseX<x+40 && mouseY>y-10 && mouseY<y+10) {
    text(detail, width/2, 350);
  }
}
