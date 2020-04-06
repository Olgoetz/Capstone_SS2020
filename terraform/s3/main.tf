##### S3 Bucket
resource "aws_s3_bucket" "s3_bucket" {
    bucket="my-users-app-capstone-2020"
    acl = "private"

    tags = var.tags
  
    # define static hosting
    website {
        index_document = "index.html"
    }


    force_destroy = true
    
    # create a new file with exposes api endpoint wh
    provisioner "local-exec" {
        command= "echo 'export const getUsers = \"${var.apiUrl}\"'> ../app/client/src/constants/apiUrl.js"
    }

    # get a production optimized build of the app
    provisioner "local-exec" {
        command ="npm run build --prefix ../app/client"
    }

  
  
}

resource "null_resource" "upload_to_s3" {

    triggers = {
        "uuid" = uuid()
    }
    provisioner "local-exec" {
        command = "aws s3 sync ../app/client/build/ s3://${aws_s3_bucket.s3_bucket.bucket} --acl public-read"
    }

}
