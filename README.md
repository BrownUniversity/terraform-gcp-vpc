# terraform-gcp-vpc

[Terraform](https://www.terraform.io/) module for creating a project in GCP. The requiered and default input variables are consistent with oranizational needs at Brown University. Basic features:

- Based in Google's project factory
- Requires project to reside inside a folder
- Enables monitoring and logging

## Getting Started

This module depends on you having GCP credentials of some kind. The module looks for a credential file in JSON format. You should export the following:

```
GOOGLE_APPLICATION_CREDENTIALS=/path/to/file.json
```

## How do you use this module?

This folder defines a [Terraform module](https://www.terraform.io/docs/modules/usage.html), which you can use in your
code by adding a `module` configuration and setting its `source` parameter to URL of this folder. See See the [examples](/examples) folder for guidance

## Testing

This repository uses Kitchen-Terraform to test the terraform modules. In the `examples` directory you can find examples of how each module can be used. Those examples are fed to [Test Kitchen][https://kitchen.ci/]. To install test kitchen, first make sure you have Ruby and bundler installed.

```
brew install ruby
gem install bundler
```

Then install the prerequisites for test kitchen.

```
bundle install
```

You'll need to add some common credentials. Copy the `examples/shared/terraform.tfvars.example` to `examples/shared/terraform.tfvars` and run the commands in the file to find the billing account id and the organization id.

And now you're ready to run test kitchen. Test kitchen has a couple main commands:

- `bundle exec kitchen create` initializes terraform.
- `bundle exec kitchen converge` runs our terraform examples.
- `bundle exec kitchen verify` runs our inspec scripts against a converged kitchen.
- `bundle exec kitchen test` does all the above.

### Developer note:

For generating the Inspec profile, you can install Inspec and then run

`inspec init profile --platform gcp tests`
