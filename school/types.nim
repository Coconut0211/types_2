type
  Subjects* = enum
    NONE, История, География, Математика, Биология
  Director* = ref object of RootObj
    firstname*: string
    lastname*: string
  Teacher* = ref object of RootObj
    firstname*: string
    lastname*: string
    subject*: Subjects
  Student* = ref object of RootObj
    firstname*: string
    lastname*: string
    class_num*: int
    class_let*: char
  School* = ref object of RootObj
    director*: Director
    student*: seq[Student]
    teacher*: seq[Teacher]