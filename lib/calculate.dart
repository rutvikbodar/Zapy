class calculate{
  int level=0;
  int remxp=0;
  int needxp=0;
  double percentage=0;
  int? todaysxp=0;
  int? totalxp = 0;
  int? streak = 0;
  double todayper = 0;
  String? sslevel = "Base form";
  bool isdaychanged = false;
  calculate(this.totalxp ,this.todaysxp,this.streak){
    sslevel = determine(streak!);
    if((totalxp!)<40000){
      needxp=2000;
      level = (totalxp!)~/needxp;
      remxp = totalxp!%needxp;
      percentage=((remxp)/needxp);
      if(todaysxp!<=400){
        todayper = todaysxp!*100/400;
      }
      else if(todaysxp!<0){
        todayper = 0;
      }
      else{
        todayper = 100;
      }
    }
    else{
      int newtotalxp = (totalxp!)-40000;
      needxp=4000;
      level = ((newtotalxp/needxp)+20).toInt();
      remxp = newtotalxp%needxp;
      percentage=((remxp)/needxp);
    }
  }
  String determine(int streak){
    if(streak>=2 && streak<4){
      return "SSJ";
    }
    if(streak>=4 && streak<6){
      return "SSJ2";
    }
    if(streak>=6 && streak<8){
      return "SSJ3";
    }
    if(streak>=8 && streak<10){
      return "SSj4";
    }
    if(streak>=10 && streak<15){
      return "SSG";
    }
    if(streak>=15 && streak<20){
      return "SSB";
    }
    if(streak>=20 && streak<25){
      return "SSBE";
    }
    if(streak>=25 && streak<45){
      return "UI";
    }
    if(streak>=45 && streak<90){
      return "MUI";
    }
    if(streak>=90){
      return "Ultra Ego";
    }
    return "Base Form";
  }
}