# ===============================================
# Outputs
# ===============================================
# 1. EC2
output ec2 {
  value       = aws_instance.jenkins.id
  # sensitive   = true
  description = "ec2-name"
  depends_on  = []
}
