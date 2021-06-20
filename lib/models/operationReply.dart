///represents what the API replys when performing operations on server.
///fill the type if you intend to return the reply with data
class OperationReply <ReturnType>
{
  Status status;
  String message;
  ReturnType returnData;
  OperationReply(this.status,{this.message="message not set",this.returnData});
  isSuccess()
  {
    return status == Status.success;
  }
  ///casts the object to another type ONLY IF it holds no data
  as<NewType>()
  {
    assert(this.returnData == null);
    return OperationReply<NewType>(status,message: message);
  }

  factory OperationReply.failed({String message="message not set",returnData})
  {
    return OperationReply(Status.failed,message:message,returnData: returnData);
  }

  factory OperationReply.success({String message="message not set",returnData})
  {
    return OperationReply(Status.success,message:message,returnData: returnData);
  }
}
enum Status
{  
  success,
  failed,
  notSet,
  error,
  connectionDown,
  noMobileNumberFound,
  userNotVerified,
}