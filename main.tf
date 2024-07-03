resource "local_file" "single_pet" {
  filename = var.single_filename
  content  = "My favorite pet is ${random_pet.my-pet.id}, ${var.myvar}"
}

resource "random_pet" "my-pet" {
  prefix    = var.prefix
  separator = var.seperator
  length    = var.length
}

 resource "local_file" "pets" {
  for_each = toset(var.myfiles)
  filename = each.value
  content  = "This is the content of the file."
}

resource "local_file" "pet" {
  filename = each.value
  content  = "This is the content of the file."
  for_each = toset(var.filename)
}

output "pets" {
  value = { 
    for file in local_file.pet : file.filename => {
      directory_permission = "0777"
      file_permission      = "0777"
      filename             = file.filename
      id                   = file.id
    } 
  }
}