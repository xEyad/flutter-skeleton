
///Responsible for all Domain-related actions and the only class interacting with the Routes
class Operations 
{
  Operations._default();
  factory Operations()
  {
    return _oi;
  }
  
  static final Operations _oi = Operations._default();
}
