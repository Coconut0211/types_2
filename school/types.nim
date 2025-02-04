type
  Subjects* = enum
    NONE, История, География, Математика, Биология
  Director* = ref object of RootObj
    firstname*: string
    lastname*: string
    birthDate*: int64
  Teacher* = ref object of RootObj
    firstname*: string
    lastname*: string
    birthDate*: int64
    subject*: Subjects
  Student* = ref object of RootObj
    firstname*: string
    lastname*: string
    birthDate*: int64
    classNum*: int
    classLet*: char
  School* = ref object of RootObj
    director*: Director
    students*: seq[Student]
    teachers*: seq[Teacher]