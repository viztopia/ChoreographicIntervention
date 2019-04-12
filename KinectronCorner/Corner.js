class Corner {
    constructor(x, y, initialAngle, color) {
      this.location = createVector(x, y);
      this.velocity = createVector(10, 10);
      this.angle = initialAngle;
      this.angleChange = 0.2;
      this.side1Length = 100;
      this.side2Length = 100;
      this.currentRotationAngle = 0;
      this.rotationSpeed = 0;
      this.color = color;
    }
  
    move() {
      this.location.add(this.velocity);
    }
    
    rotate() {
      this.currentRotationAngle += this.rotationSpeed;
      rotate(this.currentRotationAngle);
    }
    
    resizeAngle(){
        this.angle += this.angleChange;
    }
    
    display() {
      fill(this.color);
      //rect(0, 0, width, width);
      triangle(0, 0, 0, width * 2, (width - cos(this.angle) * width) * 2, (width - sin(this.angle) * width)*2);
    }
    
    update(){
      push();
      this.move();
      translate(this.location.x, this.location.y);
      this.rotate();
      this.resizeAngle();
      this.display();
      pop();
    }
  
  }