# Azure Spark Predictive Analysis

Predictive analysis (classification, regression, text analysis, and recommendation) on Azure using Azure HDInsight Spark.

## Getting Started

- Clone the repository

- In `./terraform`:
  - Change `prefix` in `variables.tf` because Azure HDInsight name has to be globally unique
    - For the remainder of the documentation, the prefix `azure-spark-pred` **WILL BE ASSUMED**
  - Run `terraform plan -out=out.tfplan`
  - Run `terraform apply out.tfplan`
  - Note the outputs of `terraform apply`

- In `./data`:
  - Unzip `data.zip`
    - This should result in 7 CSV files directly under `./data`

- In terminal,
  - Run `ssh [sshuser]@[cluster]-ssh.azurehdinsight.net`
    - If you did not change Terraform variables when provisioning, the command would be `ssh hdiadmin@azure-spark-pred-hdi-ssh.azurehdinsight.net`
  - `sudo -HE /usr/bin/anaconda/bin/conda install pandas`

- In Azure Portal,
  - Navigate to resource group `azure-spark-pred-rg` -> select storage account `azuresparkpredstorage` -> select `Storage Explorer (preview)`
  - Expand `BLOB CONTAINERS` -> select `azure-spark-pred-container`
  - Create new folder `data`
  - Upload all data from `./data` to Azure blob folder `data`
  - Select `azure-spark-pred-container` again to return to root directory
  - Upload all notebooks from `./notebooks/*` to folder `HdiNotebooks/SparkPredictiveAnalysis`
  - Navigate to resource group `azure-spark-pred-rg` -> select HDInsight `azure-spark-pred-hdi` -> select `Jupyter notebook` under "Cluster Dashboards"

- In Jupyter,
  - Create new folder `SparkPredictiveAnalysis`
    - This should allow you to see all ipynb uploaded to Azure Storage
    - **NOTE: I will report this behavior as bug for Azure HDInsight**
  - Run all notebooks from `01` to `11` to learn predictive analysis using Spark
    - Use kernel PySpark (Python 2) for running the notebooks

### PLEASE NOTE FOR THE ENTIRETY OF THIS REPOSITORY AND ALL ASSETS

1. No warranties or guarantees are made or implied.
2. All assets here are provided by me "as is". Use at your own risk. Validate before use.
3. I am not representing my employer with these assets, and my employer assumes no liability whatsoever, and will not provide support, for any use of these assets.
4. Use of the assets in this repo in your Azure environment may or will incur Azure usage and charges. You are completely responsible for monitoring and managing your Azure usage.

---

Unless otherwise noted, all assets here are authored by me. Feel free to examine, learn from, comment, and re-use (subject to the above) as needed and without intellectual property restrictions.

If anything here helps you, attribution and/or a quick note is much appreciated.