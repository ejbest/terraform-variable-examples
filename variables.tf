variable "filename" {
  default = "./pets.txt"
}

variable "myvar" {
  default = "I love pets!"
}

variable "prefix" {
  default = "Mrs"
}

variable "seperator" {
  default = "."
}

variable "length" {
  default = "1"
}

variable "myfiles" {
  type        = list(string)
  description = "List of filenames to create"
  default = [
    "./mice.txt",
    "./dogs.txt",
    "./cats.txt",
    "./cows.txt",
    "./ducks.txt"
  ]
}