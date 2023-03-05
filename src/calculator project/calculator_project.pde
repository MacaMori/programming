Button[] numButtons = new Button[10];
Button[] opButtons = new Button [11];
String dVal= "0";
boolean left = true;
float l, r, result;
char op = ' ';

void setup() {
  size(280, 280);
  numButtons[0] = new Button(65, 240, 90, 40, '0', #ADC9BF, #C5E6DA);
  numButtons[1] = new Button(40, 190, 40, 40, '1', #ADC9BF, #C5E6DA);
  numButtons[2] = new Button(90, 190, 40, 40, '2', #ADC9BF, #C5E6DA);
  numButtons[3] = new Button(140, 190, 40, 40, '3', #ADC9BF, #C5E6DA);
  numButtons[4] = new Button(40, 140, 40, 40, '4', #ADC9BF, #C5E6DA);
  numButtons[5] = new Button(90, 140, 40, 40, '5', #ADC9BF, #C5E6DA);
  numButtons[6] = new Button(140, 140, 40, 40, '6', #ADC9BF, #C5E6DA);
  numButtons[7] = new Button(40, 90, 40, 40, '7', #ADC9BF, #C5E6DA);
  numButtons[8] = new Button(90, 90, 40, 40, '8', #ADC9BF, #C5E6DA);
  numButtons[9] = new Button(140, 90, 40, 40, '9', #ADC9BF, #C5E6DA);
  opButtons[0] = new Button(240, 232, 40, 57, '=', #8AB5E8, #B5D0FF);
  opButtons[1] = new Button(240, 166, 40, 57, 't', #8AB5E8, #B5D0FF);
  opButtons[2] = new Button(240, 99, 40, 57, 's', #8AB5E8, #B5D0FF);
  opButtons[3] = new Button(140, 240, 40, 40, 'j', #ADC9BF, #C5E6DA);
  opButtons[4] = new Button(190, 248, 40, 25, 'g', #CF5D55, #F75D55);
  opButtons[5] = new Button(240, 38, 40, 40, 'c', #8AB5E8, #B5D0FF);
  opButtons[6] = new Button(190, 83, 40, 25, '+', #CF5D55, #F75D55);
  opButtons[7] = new Button(190, 116, 40, 25, '-', #CF5D55, #F75D55);
  opButtons[8] = new Button(190, 150, 40, 25, '×', #CF5D55, #F75D55);
  opButtons[9] = new Button(190, 183, 40, 25, '÷', #CF5D55, #F75D55);
  opButtons[10] = new Button(190, 216, 40, 25, 'π', #CF5D55, #F75D55);
}

void draw() {
  background(#74998C);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      if (dVal.equals("0")) {
        dVal = str(numButtons[i].val);
      } else {
        dVal += str(numButtons[i].val);
      }
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  }

  for (int i=0; i<numButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'c') {
      dVal = "0";
      left = true;
      l = 0;
      r = 0;
      result = 0;
      op = ' ';
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      op = '+';
      dVal= "0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      op = '-';
      dVal= "0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '×') {
      op = '×';
      dVal= "0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      op = '÷';
      dVal= "0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      op = 'π';
      dVal= "0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      op = '.';
      dVal= "0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 's') {
      op = 's';
      dVal= "0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 't') {
      op = 't';
      dVal= "0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 'j') {
      op = 'j';
      dVal= "0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 'g') {
      op = 'g';
      dVal= "0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      op = '√';
      dVal= "0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    }
  }
  println("l:" + l + "r:" + r + "op:" + op + "result:" + result + "Left" + left);
}

void updateDisplay() {
  fill (#9CBAC5);
  rect(115, 38, 190, 40, 10);
  fill (0);
  textAlign(LEFT);
  text(dVal, 35, 42);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '×') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == 'π') {
    result = l * 3.14;
  } else if (op == 's') {
    result = l * l;
  } else if (op == 't') {
    result = l * l * l;
  } else if (op == 'j') {
    result = l * l * l * l;
  } else if (op == 'g') {
    result = l * l * l * l * l;
  }
  dVal = str(result);
}
