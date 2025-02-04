type
  Dol* = enum
    NONE, Директор, Бухгалтер, Ветеринар
  Post* = object
    dol*: Dol
    glavn*: bool
  Manager* = ref object of RootObj
    firstname*: string
    lastname*: string
    post*: Post
    birthDate*: int64
  Staff* = ref object of RootObj
    firstname*: string
    lastname*: string
    birthDate*: int64
    uid*: int
  Pet* = ref object of RootObj
    name*: string
    age*: int 
  Shelter* = ref object of RootObj
    staff*: seq[Staff]
    pet*: seq[Pet]
    manager*: seq[Manager]