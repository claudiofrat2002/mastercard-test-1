resource "aws_s3_bucket" "default" {
  bucket = "${var.project}-dev-test"
}

resource "aws_s3_bucket_object" "default" {
  bucket = "${aws_s3_bucket.default.id}"
  key    = "${var.project}/${var.project}-v1.zip"
  source = "remote-docker/Dockerrun.zip"
}


