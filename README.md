# Terraform Grafana Organization

![pipeline](https://github.com/ckoliber/terraform-grafana-organization/actions/workflows/cicd.yml/badge.svg)
![release](https://img.shields.io/github/v/release/ckoliber/terraform-grafana-organization?display_name=tag)
![license](https://img.shields.io/github/license/ckoliber/terraform-grafana-organization)

**Organization** is a Terraform module useful for creating multiple teams, folders, dashboards, and datasources in **Grafana**

## Installation

Add the required configurations to your terraform config file and install module using command bellow:

```bash
terraform init
```

## Usage

```hcl
module "grafana" {
  source = "ckoliber/organization/grafana"

  name   = "MyOrg"
  admin  = "devops@myorg.web"
  admins = ["admin@localhost"]

  teams = {
    backend = {
      name  = "Backend"
      email = "backend@myorg.web"
    }
    frontend = {
      name  = "Frontend"
      email = "frontend@myorg.web"
    }
  }

  folders = {
    backend = {
      title = "Backend"
      permissions = {
        backend = "team:backend:Admin"
      }
    }
    frontend = {
      title = "Frontend"
      permissions = {
        frontend = "team:frontend:Admin"
      }
    }
  }
}

```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

This project is licensed under the [MIT](LICENSE.md).  
Copyright (c) KoLiBer (koliberr136a1@gmail.com)
