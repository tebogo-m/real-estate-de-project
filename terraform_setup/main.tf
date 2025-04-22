terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.30.0"
    }
  }
}

provider "google" {
  project = "<Your Project ID>"
  region  = "europe-west10"
}

resource "google_storage_bucket" "data-lake-bucket" {
  name                        = "redp_zillow_project_datalake"
  location                    = "EU"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}


resource "google_bigquery_dataset" "dataset" {
  dataset_id = "redp_zillow_project_dataset"
  project    = "<Your Project ID>"
  location   = "EU"
}