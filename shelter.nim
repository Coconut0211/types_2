import shelter/[functions]

when isMainModule:
  initManager(manager,"Sergey","Petrov","Директор")
  echo manager
  initStaff(staff,"Sergey","Petrov","04.10.2005",3131233)
  echo staff
  initPet(pet,"Sharik",5)
  echo pet