variable "gcp_id" {
    description = "GCP Project ID"
}

variable "gcp_credential" {
    description = "GCP json file path"
}

variable "region" {
    type = "map"
    default {
        "primary" = "us-central1"
        "secondary" = "us-east4"
    }
}

variable "zone" {
    type = "map"
    default {
        "us-central1" = "us-central1-c"
        "us-east4" = "us-east4-a"
    }
}
variable "gci" {
    type = "map"
    default = {
        "us-central1" = "f1-micro"
        "us-east4" = "f1-micro"
    }
}