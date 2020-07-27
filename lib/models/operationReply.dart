///represents what the API replys when performing operations on server.
///fill the type if you intend to return the reply with data
class OperationReply <ReturnType>
{
  OperationStatus status;
  String message;
  ReturnType returnData;
  OperationReply(this.status,{this.message="message not set",this.returnData});
  isSucess()
  {
    return status == OperationStatus.success;
  }
}
enum OperationStatus
{  
  success,
  failed,
  notSet
}