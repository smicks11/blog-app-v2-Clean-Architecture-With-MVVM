const EMPTY = "";
const ZERO = 0;

extension NonNullString on String{
  String orEmpty(){
    if(this == null){
      return EMPTY;
    } else {
      return this;
    }
  }
}


extension NonNullInt on int{
  int orEmpty(){
    if(this == null){
      return ZERO;
    } else {
      return this;
    }
  }
}