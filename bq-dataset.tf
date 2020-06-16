resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "example_dataset2"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "asia-northeast1"
  default_table_expiration_ms = 3600000

  access {
    role   = "OWNER"
    user_by_email = "miyajima-zigan@miyajima-zigan.iam.gserviceaccount.com"
  }
}

resource "google_bigquery_table" "default" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = "test"

  schema = <<EOF
[
  {
    "name": "permalink",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "The Permalink"
  },
  {
    "name": "state",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "State where the head office is located"
  }
]
EOF

}


