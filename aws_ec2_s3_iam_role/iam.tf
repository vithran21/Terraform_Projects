#AWS IAM Role - For ec2 service - Granting AmazonS3FullAccess
resource "aws_iam_role" "ec2s3tfrole" {
  name = "ec2s3tfrole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2s3tfrole_s3_full_access" {
  role       = aws_iam_role.ec2s3tfrole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

output "iam_role_name" {
  value = aws_iam_role.ec2s3tfrole.name
}