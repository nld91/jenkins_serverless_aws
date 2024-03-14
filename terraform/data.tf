resource "aws_efs_file_system" "jenkins_data" {
  creation_token   = "jenkins_data"
  performance_mode = "generalPurpose"
}

resource "aws_efs_mount_target" "efs_mt" {
  file_system_id  = aws_efs_file_system.jenkins_data.id
  subnet_id       = aws_subnet.jenkins_subnet.id
  security_groups = [aws_security_group.jenkins_sg.id]
}