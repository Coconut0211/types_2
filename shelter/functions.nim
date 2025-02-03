import re,strutils,times
import types

proc toUnix(date: string): int64 =
  try:
    return date.parse("dd'.'MM'.'YYYY").toTime.toUnix
  except TimeParseError:
    stderr.write(getCurrentExceptionMsg() & "\n")
    return result

proc toStr(date: int64): string =
  fromUnix(date).format("dd'.'MM'.'YYYY")

proc checkStr[T](data: T): bool = 
  match(data,re"^([A-Za-z]{2,})$")

proc checkDigit[T](data: T): bool =
  data > 0

template getAttrValue(obj,attr): auto = obj.attr

template setAttrValue*(obj,attr,value,checkFunc) =
  if checkFunc(value):
    obj.attr = value

proc setBirthdate*(self:Staff,value: string) =
  self.birthDate = value.toUnix()

proc setManagerPost*(self: Manager, data: string) =
  try:
    self.post = parseEnum[Post](data)
  except ValueError:
    stderr.write("Нет должности $1\n" % data)
    self.post = NONE


template initManager*(varName; firstnameval, lastnameval,postval: string) =
  let varName = Manager()
  varName.setAttrValue(firstname,firstnameval,checkStr)
  varName.setAttrValue(lastname,lastnameval,checkStr)
  varName.setManagerPost(postval)

template initStaff*(varName; firstnameval: string, lastnameval: string, birthDateval: string,uidval:int) =
  let varName = Staff()
  varName.setAttrValue(firstname,firstnameval,checkStr)
  varName.setAttrValue(lastname,lastnameval,checkStr)
  varName.setAttrValue(uid,uidval,checkDigit)
  varName.setBirthdate(birthDateval)

template initPet*(varName; nameval:string, ageval:int) =
  let varName = Pet()
  varName.setAttrValue(name,nameval,checkStr)
  varName.setAttrValue(age,ageval,checkDigit)

proc `$`*(self: Manager): string = 
  "$1: $2 $3" % [
  $self.getAttrValue(post),
  self.getAttrValue(firstname),
  self.getAttrValue(lastname)
  ]

proc `$`*(self: Staff): string = 
  "Сотрудник: $1 $2\nid: $3\nДата рождения: $4" % [
  self.getAttrValue(firstname),
  self.getAttrValue(lastname),
  $self.getAttrValue(uid),
  self.getAttrValue(birthDate).toStr
  ]

proc `$`*(self: Pet): string =
  var podp: string = "лет"
  if self.getAttrValue(age) == 1:
    podp = "год"
  elif self.getAttrValue(age) <= 4 and self.getAttrValue(age) >= 2:
    podp = "года"
  return "$1, $2 $3" % [
  self.getAttrValue(name),
  $self.getAttrValue(age),
  podp
  ]





