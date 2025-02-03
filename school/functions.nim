import re,strutils
import types

proc checkStr[T](data: T): bool = 
  match(data,re"^([A-Za-z]{2,})$")

proc checkDigit[T](data: T): bool =
  data >= 1 and data <= 11

proc checkChar[T](data: T): bool =
  match($data,re"^[A-Z]$")


template getAttrValue(obj,attr): auto = obj.attr

template setAttrValue*(obj,attr,value,checkFunc) =
  if checkFunc(value):
    obj.attr = value

proc setTeacherSubj*(self: Teacher, data: string) =
  try:
    self.subject = parseEnum[Subjects](data)
  except ValueError:
    stderr.write("Нет предмета $1\n" % data)
    self.subject = NONE


template initDirector*(varName; firstnameval, lastnameval: string) =
  let varName = Director()
  varName.setAttrValue(firstname,firstnameval,checkStr)
  varName.setAttrValue(lastname,lastnameval,checkStr)

template initTeacher*(varName; firstnameval, lastnameval,subjectval: string) =
  let varName = Teacher()
  varName.setAttrValue(firstname,firstnameval,checkStr)
  varName.setAttrValue(lastname,lastnameval,checkStr)
  varName.setTeacherSubj(subjectval)

template initStudent*(varName; firstnameval:string, lastnameval:string, class_letval: char, class_numval: int) =
  let varName = Student()
  varName.setAttrValue(firstname,firstnameval,checkStr)
  varName.setAttrValue(lastname,lastnameval,checkStr)
  varName.setAttrValue(class_let,class_letval,checkChar)
  varName.setAttrValue(class_num,class_numval,checkDigit)

proc `$`*(self: Director): string = 
  "Директор школы: $1 $2" % [
  self.getAttrValue(firstname),
  self.getAttrValue(lastname)
  ]

proc `$`*(self: Teacher): string = 
  "Учитель: $1 $2\nПредмет: $3" % [
  self.getAttrValue(firstname),
  self.getAttrValue(lastname),
  $self.getAttrValue(subject)
  ]

proc `$`*(self: Student): string = 
  "Ученик $1 $2, $3$4" % [
  self.getAttrValue(firstname),
  self.getAttrValue(lastname),
  $self.getAttrValue(class_num),
  $self.getAttrValue(class_let)
  ]





