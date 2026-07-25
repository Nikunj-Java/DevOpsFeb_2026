provider "local" {
  
}

resource "local_file" "sample"{
    filename = "sample.txt"
    content  = "This is a sample file created using Terraform local provider."
}

# move to the directory where the Terraform configuration files are located
# terraform init
# terraform plan
# terraform apply