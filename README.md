# Helm action

This action uses helm to fetch a template and an optional values file to render a yaml file ready to be applied on Kubernetes.  

## Inputs

### `helm-url`

**Required** The URL where the Helm template can be downloaded from.

### `helm-template`

**Required** The name of the Helm template you wish to install.

### `helm-user`

**Optional** The username to use to access the Helm template.

### `helm-password`

**Optional** The password to use to access the Helm template.

### `values-file`

**Optional** Path to the optional values file to use in addition to `values.yaml`

## Outputs

There are no output variables, but a `template.yaml` file is generated at root.  

## Example usage

uses: epitech-ops/helm-action@v1
with:
  helm-url: 'https://raw.githubusercontent.com/Epitech-ops/helm-template/gh-pages/'
  helm-template: 'helm-template'
  helm-user: ${{ vars.GHCR_USER }}
  helm-password: ${{ secrets.HELM_TEMPLATE_PAT }}
  values-file: 'values-github.yaml'
