########################
#--modules/ecs/main.tf--
########################

resource "aws_ecs_cluster" "this_cluster" {
  name = var.cluster_name != "" && var.create_ecs ? var.cluster_name : "example_cluster"
  tags = merge(var.additional_tags, {
    Environment = var.environment
    },
  )
}
resource "aws_iam_role" "ecsInstanceRole" {
  name               = "${var.prefix_name}-${var.environment}-ecsInstanceRole"
  assume_role_policy = var.ecsInstanceRoleAssumeRolePolicy
  tags = merge(var.additional_tags, {
    Environment = var.environment
    },
  )
}
resource "aws_iam_role" "ecsTaskRole" {
  name               = "${var.prefix_name}-${var.environment}-ecsTaskRole"
  assume_role_policy = var.ecsTaskExecutionRolePolicy
  tags = merge(var.additional_tags, {
    Environment = var.environment
    },
  )
}
resource "aws_iam_role_policy" "ecsInstanceRolePolicy" {
  name   = var.prefix_name != "" && var.environment != "" ? "${var.prefix_name}-${var.environment}-ecsInstanceRolePolicy" : "example_ecsInstanceRolePolicy"
  role   = aws_iam_role.ecsInstanceRole.id
  policy = var.ecsInstancerolePolicy
}
resource "aws_iam_instance_profile" "this_profile" {
  name = var.prefix_name != "" && var.environment != "" ? "${var.prefix_name}-${var.environment}-iam-instance-profile" : "example_iam-instance-profile"
  role = aws_iam_role.ecsInstanceRole.name
  tags = merge(var.additional_tags, {
    Environment = var.environment
    },
  )
}
resource "aws_ecs_service" "this_service" {
  name            = var.service_name != "" ? var.service_name : "default_service"
  cluster         = aws_ecs_cluster.this_cluster.arn
  launch_type     = var.launch_type
  task_definition = aws_ecs_task_definition.this_task.arn
  desired_count   = var.min_count
  tags = merge(var.additional_tags, {
    Environment = var.environment
    },
  )
}
resource "aws_ecs_task_definition" "this_task" {
  family                = var.family_name != "" ? var.family_name : "task5_default"
  task_role_arn         = aws_iam_role.ecsTaskRole.arn
  container_definitions = file("${path.module}/templates/task-definition.json")
  tags = merge(var.additional_tags, {
    Environment = var.environment
    },
  )
}
