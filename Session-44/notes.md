# AWS VPC Route Table --- Manual Setup Notes

## Scenario

We are manually building the AWS infrastructure first and later
converting the same architecture to Terraform.

The current step is configuring a **Public Route Table** so that
resources in a public subnet can communicate with the Internet through
an **Internet Gateway (IGW)**.

------------------------------------------------------------------------

# 1. Architecture

``` text
                         Internet
                            |
                            |
                    Internet Gateway
                            |
                            |
                    Public Route Table
                       /          \
                      /            \
                 Subnet-1        Subnet-2
                    |               |
                  EC2-1           EC2-2
```

The route table controls where network traffic should go.

------------------------------------------------------------------------

# 2. VPC

Create a VPC such as:

``` text
Name: devops-vpc
CIDR: 10.0.0.0/16
```

The VPC provides the main private network.

### Important

`10.0.0.0/16` represents the network range of the VPC.

AWS automatically creates a local route:

``` text
Destination: 10.0.0.0/16
Target: local
```

This route allows communication between resources inside the VPC.

------------------------------------------------------------------------

# 3. Internet Gateway

Create an Internet Gateway:

``` text
Name: DevOps-IGW
```

Then attach it to:

``` text
devops-vpc
```

After attachment, the IGW will have an ID similar to:

``` text
igw-0123456789abcdef
```

### Important

The Internet Gateway must be **attached to the same VPC** used by the
route table.

Check:

``` text
VPC → Internet Gateways
```

The state should show:

``` text
Attached
```

------------------------------------------------------------------------

# 4. Public Route Table

Create a route table:

``` text
Name: Public-route-table
VPC: devops-vpc
```

AWS automatically creates:

``` text
Destination: 10.0.0.0/16
Target: local
```

Do not remove this route.

------------------------------------------------------------------------

# 5. Add Internet Route

Edit the routes of `Public-route-table`.

Add:

``` text
Destination: 0.0.0.0/0
Target: Internet Gateway
```

Then select the **actual Internet Gateway ID**.

Example:

``` text
0.0.0.0/0 → igw-0123456789abcdef
```

Save the changes.

The final route table should look like:

  Destination     Target           Meaning
  --------------- ---------------- ------------------------
  `10.0.0.0/16`   `local`          Traffic inside the VPC
  `0.0.0.0/0`     `igw-xxxxxxxx`   Internet traffic

------------------------------------------------------------------------

# 6. Understanding `0.0.0.0/0`

`0.0.0.0/0` means:

> Any IPv4 destination that does not match a more specific route.

Therefore:

``` text
0.0.0.0/0 → Internet Gateway
```

means:

> Send Internet-bound IPv4 traffic through the Internet Gateway.

------------------------------------------------------------------------