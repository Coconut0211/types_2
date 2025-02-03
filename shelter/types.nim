type
  Post* = enum
    NONE, Директор, Главный_бухгалтер, Главный_ветеринар
  Manager* = ref object of RootObj
    firstname*: string
    lastname*: string
    post*: Post
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