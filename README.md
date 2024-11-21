# OKD Single Node com Terraform e Ansible



## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.12.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.sg-olimpo](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.okd_single_node](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID do projeto no Google Cloud | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Região do Google Cloud | `string` | `"us-central1"` | no |
| <a name="input_security"></a> [security](#input\_security) | n/a | `string` | `"sg-olimpo"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Zona do Google Cloud | `string` | `"us-central1-a"` | no |

## Inicialização do ambiente

### Manualmente


**Terraform**:

```bash

terroform init

terraform plan

terraform apply -auto-approve

```
**Ansible**

```bash

ansible-playbook -i inventory.yml playbook.yml

```

### GitHub Actions

Crie uma Service Account e adione nas Secrets do GitHub com o nome ```GCP_SA_KEY```
Por ser um laborátório e não um ambiente produtivo, vamos utilizar o **Github Cache**

```yml

      - name: Cache Terraform state
        uses: actions/cache@v3
        with:
          path: |
            ~/.terraform.d
            terraform.tfstate
          key: terraform-state-${{ runner.os }}-${{ github.sha }}

```