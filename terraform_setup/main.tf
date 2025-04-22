
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.30.0"
    }
  }
}

provider "google" {
   project = "your gcp project id"
   region  = "africa-south1"
}

resource "google_storage_bucket" "data-lake-bucket"{
    name = "your own unique name for your storage bucket"
    location = "AFR"
    storage_class = "STANDARD"
    uniform_bucket_level_access = true

 versioning {
    enabled = true
}

 lifecycle_rule {
    action{
        type = "Delete"
    }
    condition{
        age = 30 // days
    }
}
force_destroy = true
}

resource "google_bigquery_dataset" "datset" {
    dataset_id = "your own unique name for your bigquery dataset"
    project = "your gcp project id"
    location = "AFR"
}