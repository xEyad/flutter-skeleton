///represents what the API replys when performing operations on server
class OperationReply
{
  Status status;
  String message;
  dynamic returnData;
  OperationReply({this.status=Status.notSet,this.message="status not set",this.returnData});
}
enum Status
{  
  success,
  failed,
  notSet
}