# terraform-gcp-vpc

![kitchen-tests](https://github.com/BrownUniversity/terraform-kitchen-template/workflows/kitchen-tests/badge.svg)


[Terraform](https://www.terraform.io/) module for creating a VPC in GCP. Basic features:

- Based in [Google's network module](https://github.com/terraform-google-modules/terraform-google-network)
- Configures 1 subnet
- IP CIDR defaults to `10.0.0.0/17`


# Contents:

- [Getting Started](#getting-started)
- [How to use this module](#how-to-use-this-module)
- [Requirements](#requirements)
- [Providers](#providers)
- [Inputs](#inputs)
- [Testing](#testing)
- [Development](#development)

## Getting Started

This module depends on you having GCP credentials of some kind. The module looks for a credential file in JSON format. You should export the following:

```
GOOGLE_APPLICATION_CREDENTIALS=/path/to/file.json
```
## How to use this module

This repository defines a [Terraform module](https://www.terraform.io/docs/modules/usage.html), which you can use in your
code by adding a `module` configuration and setting its `source` parameter to URL of this repository. See the [examples](/examples) folder for guidance

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| google | >= 3.0, <4.0.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | Subnet description | `string` | `"Deployed through Terraform."` | no |
| ip\_range\_pods | The secondary ip range to use for pods | `string` | `"192.168.0.0/18"` | no |
| ip\_range\_services | The secondary ip range to use for pods | `string` | `"192.168.64.0/18"` | no |
| network\_name | Name of the VPC. | `string` | n/a | yes |
| project\_id | The project ID to host the VPC in | `string` | n/a | yes |
| range\_name\_pods | The range name for pods | `string` | `"kubernetes-pods"` | no |
| range\_name\_services | The range name for services | `string` | `"kubernetes-services"` | no |
| routing\_mode | Routing mode. GLOBAL or REGIONAL | `string` | `"GLOBAL"` | no |
| subnet\_flow\_logs | Whether to enable flow logging for the subnetwork. | `string` | `"true"` | no |
| subnet\_ip | Subnet IP CIDR. | `string` | `"10.0.0.0/17"` | no |
| subnet\_name | Name of the subnet. | `string` | n/a | yes |
| subnet\_private\_access | Enable private Google access | `string` | `"true"` | no |
| subnet\_region | Region subnet lives in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| network\_name | Name of the VPC. |
| routing\_mode | Routing mode. GLOBAL or REGIONAL |
| subnet\_ip | Subnet IP |
| subnet\_name | Name of the subnetwok. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Testing

This repository uses Kitchen-Terraform to test the terraform modules. In the [examples](/examples)directory you can find examples of how each module can be used. Those examples are fed to [Test Kitchen][https://kitchen.ci/]. To install test kitchen, first make sure you have Ruby and bundler installed.

```
brew install ruby
gem install bundler
```

Then install the prerequisites for test kitchen.

```
bundle install
```

You'll need to add some common credentials and secret variables

And now you're ready to run test kitchen. Test kitchen has a couple main commands:

- `bundle exec kitchen create` initializes terraform.
- `bundle exec kitchen converge` runs our terraform examples.
- `bundle exec kitchen verify` runs our inspec scripts against a converged kitchen.
- `bundle exec kitchen test` does all the above.


## Development

### Merging Policy
Use [GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html#production-branch-with-gitlab-flow).

* Create feature branches for features and fixes from default branch
* Merge only from PR with review
* After merging to default branch a release is drafted using a github action. Check the draft and publish if you and tests are happy

### Pre-commit hooks
Install and configure terraform [pre-commit hooks](https://github.com/antonbabenko/pre-commit-terraform)
This repository has the following hooks, preonfigured. After intallation, you can run them using: `pre-commit run -a`
Please make sure you run them before pushing to remote.

| Hook name                                        | Description                                                                                                                |
| ------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------- |
| `terraform_fmt`                                  | Rewrites all Terraform configuration files to a canonical format.                                                          |
| `terraform_docs`                                 | Inserts input and output documentation into `README.md`.                                                       |
| `terraform_tflint`                               | Validates all Terraform configuration files with [TFLint](https://github.com/terraform-linters/tflint).                              |
| `terraform_tfsec`                                | [TFSec](https://github.com/liamg/tfsec) static analysis of terraform templates to spot potential security issues.     |


### CI
This project has three workflows enabled:

1. PR labeler: When openning a PR to defaukt branch, a label is given assigned automatically accourding to the name of your feature branch. The labeler follows the follows rules in [pr-labeler.yml](.github/pr-labeler.yml)

2. Realease Drafter: When merging to master, a release is drafted using the [Release-Drafter Action](https://github.com/marketplace/actions/release-drafter)

3. `Kitchen test` is run on every commit unless `[skip ci]` is added to commit message.
