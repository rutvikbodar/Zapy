class determine{
  int? x1y1=5;
  int? x1y2=5;
  int? x1y3=5;
  int? x2y1=5;
  int? x2y2=5;
  int? x2y3=5;
  int? x3y1=5;
  int? x3y2 =5;
  int? x3y3 = 5;
  int? result;
  determine({this.x1y1,this.x1y2,this.x1y3,this.x2y1,this.x2y2,this.x2y3,this.x3y1,this.x3y2,this.x3y3}){
    populate();
  }

  void populate(){
    result = ans(x1y1!, x1y2!, x1y3!, x2y1!, x2y2!, x2y3!, x3y1!, x3y2!, x3y3!);
  }
  int ans(int x1y1,int x1y2,int x1y3,int x2y1,int x2y2, int x2y3, int x3y1, int x3y2,int x3y3) {
    if (x1y1 + x1y2 + x1y3 == 0) {
      return 0;
    }
    if (x1y1 + x1y2 + x1y3 == 3) {
      return 1;
    }

    if(x2y1+x2y2+x2y3==0){
      return 0;
    }
    if(x2y1+x2y2+x2y3 == 3){
      return 1;
    }
    if(x3y1+x3y2+x3y3==0){
      return 0;
    }
    if(x3y1+x3y2+x3y3==3){
      return 1;
    }
    if(x1y1+x2y1+x3y1==0){
      return 0;
    }
    if(x1y1+x2y1+x3y1==3){
      return 1;
    }
    if(x1y2+x2y2+x3y2==0){
      return 0;
    }
    if(x1y2+x2y2+x3y2==3){
      return 1;
    }
    if(x1y3+x2y3+x3y3==0){
      return 0;
    }
    if(x1y3+x2y3+x3y3==3){
      return 1;
    }
    if(x1y1+x2y2+x3y3==0){
      return 0;
    }
    if(x1y1+x2y2+x3y3==3){
      return 1;
    }
    if(x1y3+x2y2+x3y1==0){
      return 0;
    }
    if(x1y3+x2y2+x3y1==3){
      return 1;
    }
    else {
      return 5;
    }
  }

}