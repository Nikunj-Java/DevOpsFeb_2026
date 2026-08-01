# Terraform Module
- instead of writting full code in main.tf file, we will modularise the code in small files and reuse it anywhere without code duplication

## Project Structure
- Create a Project Structure like This
```

|-- main.tf
|-- output.tf
|-- variable.tf
|-- provider.tf
|-- terraform.tfvars
|-- modules
|     |--ec2
|       |-- main.tf
|       |-- output.tf
|       |-- variable.tf

```

Project: [Terraform Module Project](terraform-modules-demo)

## Project Flow
```
terraform.tfvars
        |
    variable.tf
        |
    main.tf
        |
      Module
        |
  Module Variables
        |
  Resource(main)
        |
      Outputs
        |
    Root Outputs
```
