# Azure Spark Predictive Analysis

Predictive analysis (classification, regression, text analysis, and recommendation) on Azure using Azure HDInsight Spark.

## Getting Started

- Provision HDInsight and note SSH username and HDI cluster name
- In terminal,
  - `ssh [sshuser]@[cluster]-ssh.azurehdinsight.net`
  - `sudo -HE /usr/bin/anaconda/bin/conda install pandas`
- create new folder `data` in root directory of storage account
- upload all data to folder `data`
- upload all notebooks to folder`HdiNotebooks/spark-pred-analysis` in storage account
- In Jupyter,
  - Create new folder `spark-pred-analysis` -> should see all ipynb uploaded to storage account
  - Use kernel PySpark (Python 2)

## Next Step

- [] Terraform

### PLEASE NOTE FOR THE ENTIRETY OF THIS REPOSITORY AND ALL ASSETS

1. No warranties or guarantees are made or implied.
2. All assets here are provided by me "as is". Use at your own risk. Validate before use.
3. I am not representing my employer with these assets, and my employer assumes no liability whatsoever, and will not provide support, for any use of these assets.
4. Use of the assets in this repo in your Azure environment may or will incur Azure usage and charges. You are completely responsible for monitoring and managing your Azure usage.

---

Unless otherwise noted, all assets here are authored by me. Feel free to examine, learn from, comment, and re-use (subject to the above) as needed and without intellectual property restrictions.

If anything here helps you, attribution and/or a quick note is much appreciated.