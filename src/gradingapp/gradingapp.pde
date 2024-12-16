// Ryne Nguyen | Grading Apps | 13 Sept. 2024
float grade;
void setup() {
  size(400, 150);
  background(200);
}

void draw () {
  background(200);
  textSize(35);
  textAlign(CENTER);
  fill(0);
  text("Grade by Ryne Nguyen", width/2, 40);

  line(0, 100, width, 100);
  for (int i=0; i<width; i+=50) {
    line(i, 95, i, 105);
    textSize(8);
    text((float)i/width*4, i, 90);
  }

  ellipse(mouseX, 100, 5, 5);
  textSize(16);
  text((float)mouseX/width*4, mouseX, 120);
  assignGrade((float)mouseX/width*4);
  grade = random(0, 4.0001);
}

void assignGrade(float tgrade) {
  if (tgrade >= 3.51) {
    text("Assign letter grade A.", width/2, 125);
  } else if (tgrade >= 3.0) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text("Assign letter grade A-", width/2, 125);
  } else if (tgrade >= 2.84) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text("Assign letter grade B+.", width/2, 125);
  } else if (tgrade >= 2.67) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text("Assign letter grade B.", width/2, 125);
  } else if (tgrade >= 2.50) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text("Assign letter grade B-.", width/2, 125);
  } else if (tgrade >= 2.34) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text("Assign letter grade C+.", width/2, 125);
  } else if (tgrade >= 2.17) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text("Assign letter grade C.", width/2, 125);
  } else if (tgrade >= 2.0) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text("Assign letter grade C-.", width/2, 125);
  } else if (tgrade >= 1.66) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text("Assign letter grade D+.", width/2, 125);
  } else if (tgrade >= 1.33) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text("Assign letter grade D.", width/2, 125);
  } else if (tgrade >= 1.0) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text("Assign letter grade D-.", width/2, 125);
  } else {
    text("Assign letter grade F.", width/2, 125);
  }
}
