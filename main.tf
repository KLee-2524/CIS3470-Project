# Placeholder to see if committing from VS Code goes through to GitHub repo: https://github.com/KLee-2524/CIS3470-Project.git
# Windows Server 2022 Datacenter Base
#   Image ID: ami-0b91c4400195d38cc (Free Tier Eligible)
#   Instance type: t2.micro (Free Tier Eligible) 
# https://stackoverflow.com/questions/5964118/git-working-on-wrong-branch-how-to-copy-changes-to-existing-topic-branch

resource "aws_instance" "win_ser_22" {
  ami           = ami-0b91c4400195d38cc
  instance_type = "t2.micro"

  tags = {
    Name = "Test"
  }
}
