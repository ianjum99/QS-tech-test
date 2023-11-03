variable "bucket_name" {
  description = "The name of the S3 bucket where the application source will be stored."
  type        = string
}

variable "app_source_key" {
  description = "The S3 key for the uploaded application zip file."
  type        = string
}

variable "source_directory" {
  description = "The local directory where the application zip file is located."
  type        = string
  default     = "../.."  # Adjust the path according to your project structure
}
