# Configure the AWS provider
provider "aws" {
  region = "ap-south-1"  # AWS region to deploy resources in
}

# Create an ECS cluster
resource "aws_ecs_cluster" "helloWorld" {
  name = "helloWorld-cluster"  # Name of the ECS cluster
}

# Define the ECS task definition
resource "aws_ecs_task_definition" "helloWorld" {
  family                   = "hello-world"  # Name of the task family
  network_mode             = "awsvpc"  # Use AWS VPC networking mode
  requires_compatibilities = ["FARGATE"]  # Specify Fargate as the launch type
  cpu                      = "256"  # CPU units to allocate to the task
  memory                   = "512"  # Memory in MiB to allocate to the task

  container_definitions = jsonencode([
    {
      name      = "hello-world"  # Container name
      image     = "tusharkshahi/hello-world-nodejs:latest"  # Docker image to use
      essential = true  # Indicates if the container is essential to the task

      portMappings = [
        {
          containerPort = 3000  # Port on the container to expose
          hostPort      = 3000  # Port on the host to bind to
        }
      ]
    }
  ])
}

# Define the ECS service
resource "aws_ecs_service" "helloWorld" {
  name            = "helloWorld-service"  # Name of the ECS service
  cluster         = aws_ecs_cluster.helloWorld.id  # Reference to the ECS cluster
  task_definition = aws_ecs_task_definition.helloWorld.arn  # Reference to the task definition
  desired_count   = 1  # Number of tasks to run

  network_configuration {
    subnets         = ["subnet-0736db02bfae94ac8"]  # Subnets for the service
    security_groups = ["sg-02f158d7bc5f2eb49"]  # Security groups for the service
  }
}
