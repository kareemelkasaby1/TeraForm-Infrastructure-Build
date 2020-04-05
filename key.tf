resource "tls_private_key" "pubkicAndPrivateKeys" {
  algorithm   = "RSA"
  rsa_bits = "2048"
}

resource "aws_secretsmanager_secret" "secretManagerToStoreKeys" {
  name = "secretManagerToStoreGeneratedKeys"
}

resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = "${aws_secretsmanager_secret.secretManagerToStoreKeys.id}"
  secret_string = "${tls_private_key.pubkicAndPrivateKeys.private_key_pem}"
    
    provisioner "local-exec" {
        command = "aws secretsmanager get-secret-value --secret-id ${aws_secretsmanager_secret.secretManagerToStoreKeys.id} >> terraform.pem"
        interpreter = ["/bin/bash", "-c"]
    }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "${tls_private_key.pubkicAndPrivateKeys.public_key_openssh}"
}




