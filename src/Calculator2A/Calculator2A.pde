// Ryne Nguyen | Calc Project | 2 Oct. 2024
//Button b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18,b19,b20,b21,b22,b23,b24;
Button[] buttons = new Button[25];
String dVal = "0";
String op;
float r, l, result;
boolean left;


void setup() {
  left = true;
  r =0.0;
  l = 0.0;
  result = 0.0;
  size(170, 240);
  background(50);
  buttons[0] = new Button(20, 220, 20, 20, "0", true);
  buttons[1] = new Button(20, 190, 20, 20, "1", true);
  buttons[2] = new Button(20, 160, 20, 20, "4", true);
  buttons[3] = new Button(20, 130, 20, 20, "7", true);
  buttons[4] = new Button(25, 100, 30, 20, "AC/on", false);

  buttons[5] = new Button(50, 220, 20, 20, ".", false);
  buttons[6] = new Button(50, 190, 20, 20, "2", true);
  buttons[7] = new Button(50, 160, 20, 20, "5", true);
  buttons[8] = new Button(50, 130, 20, 20, "8", true);
  buttons[9] = new Button(60, 100, 20, 20, "sin", false);

  buttons[10] = new Button(80, 220, 20, 20, "±", false);
  buttons[11] = new Button(80, 190, 20, 20, "3", true);
  buttons[12] = new Button(80, 160, 20, 20, "6", true);
  buttons[13] = new Button(80, 130, 20, 20, "9", true);
  buttons[14] = new Button(90, 100, 20, 20, "cos", false);

  buttons[15] = new Button(110, 220, 20, 20, "C", false);
  buttons[16] = new Button(110, 190, 20, 20, "+", false);
  buttons[17] = new Button(110, 160, 20, 20, "x", false);
  buttons[18] = new Button(110, 130, 20, 20, "√", false);
  buttons[19] = new Button(120, 100, 20, 20, "π", false);

  buttons[20] = new Button(145, 220, 30, 20, "=", false);
  buttons[21] = new Button(145, 190, 30, 20, "-", false);
  buttons[22] = new Button(145, 160, 30, 20, "÷", false);
  buttons[23] = new Button(145, 130, 30, 20, "Del", false);
  buttons[24] = new Button(150, 100, 20, 20, "^", false);
}

void draw() {
  background(173, 216, 230);
  println("Left:" + 1 + "Right" + r + " Result:" + result + "op" + op);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
    fill(255, 192, 203);
  }
  updateDisplay();
}

void updateDisplay() {
  rectMode(CENTER);
  fill(255, 255, 78);
  rect(width/2, 45, 150, 70);
  fill(0);
  if (dVal.length()<13) {
    textSize(21);
  } else if (dVal.length()<20) {
    textSize(15);
  }
  textAlign(RIGHT);
  text(dVal, width-15, 27);
  textSize(11);
}

void mousePressed() {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal == "0") {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
        l = float(dVal);
      } else {
        dVal += buttons[i].val;
        l = float(dVal);
      }
      dVal = buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && left && dVal.length() < 25) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
        r = float(dVal);
      } else {
        dVal += buttons[i].val;
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("+")) {
      dVal = "0";
      op = "+";
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("-")) {
      dVal = "0";
      op = "-";
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("x")) {
      dVal = "0";
      op = "x";
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("÷")) {
      dVal = "0";
      op = "÷";
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals(".")) {
      if (!dVal.contains(".")) {
        dVal += buttons[i].val;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("±")) {
      if (left) {
        l = l * -1;
        dVal = str(l);
      } else {
        r = r * -1;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("√")) {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("^")) {
      dVal = "0";
      op = "^";
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("π")) {
      if (left) {
        dVal = str(PI);
        l = PI;
      } else {
        dVal = str(PI);
        r = PI;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("sin")) {
      if (left) {
        dVal = str(sin(l));
        l = float(dVal);
      } else {
        dVal = str(sin(l));
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("cos")) {
      if (left) {
        dVal = str(cos(l));
        l = float(dVal);
      } else {
        dVal = str(cos(l));
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("Del") && dVal.length() > 0) {
      if (left) {
        dVal = dVal.substring(0, dVal.length() -1);
        l = float(dVal);
      } else {
        dVal = dVal.substring(0, dVal.length() -1);
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("C")) {
      left = true;
      r =0.0;
      l = 0.0;
      result = 0.0;
      dVal = "0";
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("AC/on")) {
      left = true;
      r =0.0;
      l = 0.0;
      result = 0.0;
      dVal = "0";
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("=")) {
      performCalc();
    }
  }
}


//    if (buttons[i].on == true) {
//      if (buttons[i].val.equals("C")) {
//        dVal = "0.0";
//        op = ' ';
//        l = 0.0;
//        r = 0.0;
//      } else if (dVal.equals("0.0")) {
//        dVal = buttons[i].val;
//      } else {
//        if(left == true) {
//        dVal += buttons[i].val;
//        l = float(dVal);
//        }
//      }
//    }
//  }
//}

void performCalc() {
  if (op == "+") {
    result = l + r;
  } else if (op == "-") {
    result = l - r;
  } else if (op == "x") {
    result = l * r;
  } else if (op == "÷") {
    result = l / r;
  } else if (op == "^") {
    result = pow(l, r);
  }
  dVal = str(result);
}

void handleEvent(String keyVal, boolean isNum) {
  //handle numbers left of op
  if (dVal.length() < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal += keyVal;
    } else {
      dVal += keyVal;
    }
    if (left);
    l = float(dVal);
    
  } else if (!left && dVal.length() < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal += keyVal;
    } else {
      dVal += keyVal;
    }
  } else if (keyVal.equals("+")) {
    if (!dVal.contains("+") && left) {
      dVal = "0";
      op = "+";
      left = false;
    }
  } else if (keyVal.equals("/")) {
    if (!dVal.contains("/") && left) {
      dVal = "0";
      op = "/";
      left = false;
    }
  } else if (keyVal.equals("*")) {
    if (!dVal.contains("*") && left) {
      dVal = "0";
      op = "*";
      left = false;
    }
    l = float(dVal);
  } else if (keyVal.equals("=")) {
    if (!dVal.contains("=") && !left)
    {
      performCalc();
    }
  }
}

void keyPressed () {
  println("key:" + key);
  println("keycode:" + keyCode);
  if (key == 0) {
    handleEvent("0", true);
  } else if (key == '0' || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (key == '1' || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else if (key == '2' || keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
  } else if (key == '3' || keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
  } else if (key == '4' || keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
  } else if (key == '5' || keyCode == 101 || keyCode == 53) {
    handleEvent("5", true);
  } else if (key == '6' || keyCode == 102 || keyCode == 54) {
    handleEvent("6", true);
  } else if (key == '7' || keyCode == 103 || keyCode == 55) {
    handleEvent("7", true);
  } else if (key == '8' || keyCode == 104 || keyCode == 56) {
    handleEvent("8", true);
  } else if (key == '9' || keyCode == 105 || keyCode == 57) {
    handleEvent("9", true);
  } else if (key == '=' || keyCode == 61) {
    handleEvent("=", false);
  } else if (key == '=' || keyCode == 10) {
    handleEvent("=", false);
  } else if (key == '+' || keyCode == 107) {
    handleEvent("+", false);
  } else if (key == '-' || keyCode == 109) {
    handleEvent("-", false);
  } else if (key == '*' || keyCode == 106) {
    handleEvent("*", false);
  } else if (key == '/' || keyCode == 111) {
    handleEvent("/", false);
  }
}
