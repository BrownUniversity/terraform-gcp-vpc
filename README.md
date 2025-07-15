# terraform-gcp-vpc

![kitchen-tests](https://github.com/BrownUniversity/terraform-kitchen-template/workflows/terraform-tests/badge.svg)


[Terraform](https://www.terraform.io/) module for creating a VPC in GCP. Basic features:

- Based in [Google's network module](https://github.com/terraform-google-modules/terraform-google-network)
- Configures 1 subnet
- IP CIDR defaults to `10.0.0.0/17`


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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12.2 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.42.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-google-modules/network/google | 11.1.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Subnet description | `string` | `"Deployed through Terraform."` | no |
| <a name="input_ip_range_pods"></a> [ip\_range\_pods](#input\_ip\_range\_pods) | The secondary ip range to use for pods | `string` | `"192.168.0.0/18"` | no |
| <a name="input_ip_range_services"></a> [ip\_range\_services](#input\_ip\_range\_services) | The secondary ip range to use for pods | `string` | `"192.168.64.0/18"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the VPC. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to host the VPC in | `string` | n/a | yes |
| <a name="input_range_name_pods"></a> [range\_name\_pods](#input\_range\_name\_pods) | The range name for pods | `string` | `"kubernetes-pods"` | no |
| <a name="input_range_name_services"></a> [range\_name\_services](#input\_range\_name\_services) | The range name for services | `string` | `"kubernetes-services"` | no |
| <a name="input_routing_mode"></a> [routing\_mode](#input\_routing\_mode) | Routing mode. GLOBAL or REGIONAL | `string` | `"GLOBAL"` | no |
| <a name="input_subnet_flow_logs"></a> [subnet\_flow\_logs](#input\_subnet\_flow\_logs) | Whether to enable flow logging for the subnetwork. | `string` | `"true"` | no |
| <a name="input_subnet_ip"></a> [subnet\_ip](#input\_subnet\_ip) | Subnet IP CIDR. | `string` | `"10.0.0.0/17"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of the subnet. | `string` | n/a | yes |
| <a name="input_subnet_private_access"></a> [subnet\_private\_access](#input\_subnet\_private\_access) | Enable private Google access | `string` | `"true"` | no |
| <a name="input_subnet_region"></a> [subnet\_region](#input\_subnet\_region) | Region subnet lives in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | Name of the VPC. |
| <a name="output_routing_mode"></a> [routing\_mode](#output\_routing\_mode) | Routing mode. GLOBAL or REGIONAL |
| <a name="output_subnet_ip"></a> [subnet\_ip](#output\_subnet\_ip) | Subnet IP |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | Name of the subnetwok. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Local Development

### Merging Policy
Use [GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html#production-branch-with-gitlab-flow).

* Create feature branches for features and fixes from default branch
* Merge only from PR with review
* After merging to default branch a release is drafted using a github action. Check the draft and publish if you and tests are happy

### Version managers

We recommend using [asdf](https://asdf-vm.com) to manage your versions of Terrafom and Ruby.

```
brew install asdf
```

### Terraform

You can also install the latest version of terraform version via brew.

```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

#### Pre-commit hooks
You should make sure that pre-commit hooks are installed to run the formater, linter, etc. Install and configure terraform [pre-commit hooks](https://github.com/antonbabenko/pre-commit-terraform) as follows:

Install rependencies

```
brew bundle install
```

Install the pre-commit hook globally
```
DIR=~/.git-template
git config --global init.templateDir ${DIR}
pre-commit init-templatedir -t pre-commit ${DIR}
```

To run the hooks specified in `.pre-commit-config.yaml`: 

```
pre-commit run -a
```

### GCloud

This is only needed if running tests locally. The google-cloud-sdk is included in the Brewfile so it should now be installed
This repo includes a `env.sh` file that where you set the path to the google credentials file, then use

```
source env.sh
```

and

```
deactivate
```

to set and uset the `GOOGLE_APPLICATION_CREDENTIALS` variable.


### Testing

The tests can be run locally with `terraform test` after running `terraform init`. You will need to supply `org_id`, `folder_id`, and `billing_account` variables through `terraform.tfvars` file. Please see `terraform.tfvars.example` file for an example.


### CI
This project has three workflows enabled:

1. PR labeler: When opening a PR to default branch, a label is given assigned automatically according to the name of your feature branch. The labeler follows the follows rules in [pr-labeler.yml](.github/pr-labeler.yml)

2. Release Drafter: When merging to master, a release is drafted using the [Release-Drafter Action](https://github.com/marketplace/actions/release-drafter)

3. `terraform test` runs on PR, merge to main and releases.
