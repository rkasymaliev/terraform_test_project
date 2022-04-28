#############################
#------root/outputs.tf-------
#############################

# output "ecs_ami_id" {
#   description = "The ECS optimized EC2 image ID."
#   value       = data.aws_ami.amazon_linux_ecs.image_id
# }
# output "ecs_cluster_name" {
#   description = "The ECS cluster name."
#   value       = module.ecs.cluster_name
# }
# output "ecs_service_arn" {
#   description = "The ECS Service ARN."
#   value       = module.ecs.service_name
# }
# output "task_def_arn" {
#   description = "The Task Definition ARN."
#   value       = module.ecs.task_def_arn
# }
# output "ecs_instance_role_arn" {
#   description = "The ECS Instance role ARN."
#   value       = module.ecs.ecsInstanceRole_arn
# }
# output "asg_id" {
#   description = "The Auto-Scaling Group ID."
#   value       = module.asg.asg_id
# }
# output "launch_config_name" {
#   description = "The Launch Configuration name."
#   value       = module.asg.asg_name
# }
output "module_ecs" {
  value = module.ecs
}
output "module_asg" {
  value = module.asg
}
