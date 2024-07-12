# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_route_table" "test_rtb_public" {
  propagating_vgws = []
  route = [{
    carrier_gateway_id         = ""
    cidr_block                 = "0.0.0.0/0"
    core_network_arn           = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    gateway_id                 = "igw-0e9b178074eb5778b"
    ipv6_cidr_block            = ""
    local_gateway_id           = ""
    nat_gateway_id             = ""
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
  }]
  tags = {
    Name = "プロジェクト-rtb-public"
  }
  tags_all = {
    Name = "プロジェクト-rtb-public"
  }
  vpc_id = "vpc-0953dd015f4bafa3e"
}

# __generated__ by Terraform from "rtb-0c08496df22919263"
resource "aws_route_table" "test_rtb_private_1c" {
  propagating_vgws = []
  route            = []
  tags = {
    Name = "プロジェクト-rtb-private2-ap-northeast-1c"
  }
  tags_all = {
    Name = "プロジェクト-rtb-private2-ap-northeast-1c"
  }
  vpc_id = "vpc-0953dd015f4bafa3e"
}

# __generated__ by Terraform
resource "aws_lb_target_group" "test_alb_tg" {
  connection_termination             = null
  deregistration_delay               = jsonencode(300)
  ip_address_type                    = "ipv4"
  lambda_multi_value_headers_enabled = null
  load_balancing_algorithm_type      = "round_robin"
  load_balancing_anomaly_mitigation  = "off"
  load_balancing_cross_zone_enabled  = "use_load_balancer_configuration"
  name                               = "kokishin-ecs-service-tg-bb"
  name_prefix                        = null
  port                               = 80
  preserve_client_ip                 = null
  protocol                           = "HTTP"
  protocol_version                   = "HTTP1"
  proxy_protocol_v2                  = null
  slow_start                         = 0
  tags                               = {}
  tags_all                           = {}
  target_type                        = "ip"
  vpc_id                             = "vpc-0953dd015f4bafa3e"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = jsonencode(200)
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
  stickiness {
    cookie_duration = 86400
    cookie_name     = null
    enabled         = false
    type            = "lb_cookie"
  }
  target_failover {
    on_deregistration = null
    on_unhealthy      = null
  }
  target_health_state {
    enable_unhealthy_connection_termination = null
  }
}

# __generated__ by Terraform from "sg-0773df873c53b18b1"
resource "aws_security_group" "test_ecs_sg" {
  description = "default VPC security group"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["124.215.241.82/32"]
    description      = ""
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
    }, {
    cidr_blocks      = []
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = true
    to_port          = 0
  }]
  name                   = "default"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = "vpc-0953dd015f4bafa3e"
}

# __generated__ by Terraform
resource "aws_subnet" "test_subnet_public_1a" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "ap-northeast-1a"
  availability_zone_id                           = "apne1-az4"
  cidr_block                                     = "10.0.0.0/20"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_customer_owned_ip_on_launch                = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    Name = "プロジェクト-subnet-public1-ap-northeast-1a"
  }
  tags_all = {
    Name = "プロジェクト-subnet-public1-ap-northeast-1a"
  }
  vpc_id = "vpc-0953dd015f4bafa3e"
}

# __generated__ by Terraform
resource "aws_subnet" "test_subnet_private_1c" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "ap-northeast-1c"
  availability_zone_id                           = "apne1-az1"
  cidr_block                                     = "10.0.144.0/20"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_customer_owned_ip_on_launch                = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    Name = "プロジェクト-subnet-private2-ap-northeast-1c"
  }
  tags_all = {
    Name = "プロジェクト-subnet-private2-ap-northeast-1c"
  }
  vpc_id = "vpc-0953dd015f4bafa3e"
}

# __generated__ by Terraform
resource "aws_subnet" "test_subnet_private_1a" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "ap-northeast-1a"
  availability_zone_id                           = "apne1-az4"
  cidr_block                                     = "10.0.128.0/20"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_customer_owned_ip_on_launch                = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    Name = "プロジェクト-subnet-private1-ap-northeast-1a"
  }
  tags_all = {
    Name = "プロジェクト-subnet-private1-ap-northeast-1a"
  }
  vpc_id = "vpc-0953dd015f4bafa3e"
}

# __generated__ by Terraform from "igw-0e9b178074eb5778b"
resource "aws_internet_gateway" "test_igw" {
  tags = {
    Name = "プロジェクト-igw"
  }
  tags_all = {
    Name = "プロジェクト-igw"
  }
  vpc_id = "vpc-0953dd015f4bafa3e"
}

# __generated__ by Terraform
resource "aws_lb" "test_alb" {
  client_keep_alive                                            = 3600
  customer_owned_ipv4_pool                                     = null
  desync_mitigation_mode                                       = "defensive"
  dns_record_client_routing_policy                             = null
  drop_invalid_header_fields                                   = false
  enable_cross_zone_load_balancing                             = true
  enable_deletion_protection                                   = false
  enable_http2                                                 = true
  enable_tls_version_and_cipher_suite_headers                  = false
  enable_waf_fail_open                                         = false
  enable_xff_client_port                                       = false
  enforce_security_group_inbound_rules_on_private_link_traffic = null
  idle_timeout                                                 = 60
  internal                                                     = false
  ip_address_type                                              = "ipv4"
  load_balancer_type                                           = "application"
  name                                                         = "kokishin-alb-bb"
  name_prefix                                                  = null
  preserve_host_header                                         = false
  security_groups                                              = ["sg-0773df873c53b18b1"]
  subnets                                                      = ["subnet-045684f59f82c53db", "subnet-06e1cb840aefb76c5"]
  tags                                                         = {}
  tags_all                                                     = {}
  xff_header_processing_mode                                   = "append"
  access_logs {
    bucket  = ""
    enabled = false
    prefix  = null
  }
  connection_logs {
    bucket  = ""
    enabled = false
    prefix  = null
  }
  subnet_mapping {
    allocation_id        = null
    ipv6_address         = null
    private_ipv4_address = null
    subnet_id            = "subnet-045684f59f82c53db"
  }
  subnet_mapping {
    allocation_id        = null
    ipv6_address         = null
    private_ipv4_address = null
    subnet_id            = "subnet-06e1cb840aefb76c5"
  }
}

# __generated__ by Terraform from "rtb-069bd252a9719cec3"
resource "aws_route_table" "test_rtb_private_1a" {
  propagating_vgws = []
  route            = []
  tags = {
    Name = "プロジェクト-rtb-private1-ap-northeast-1a"
  }
  tags_all = {
    Name = "プロジェクト-rtb-private1-ap-northeast-1a"
  }
  vpc_id = "vpc-0953dd015f4bafa3e"
}

# __generated__ by Terraform
resource "aws_subnet" "test_subnet_public_1c" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "ap-northeast-1c"
  availability_zone_id                           = "apne1-az1"
  cidr_block                                     = "10.0.16.0/20"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_customer_owned_ip_on_launch                = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    Name = "プロジェクト-subnet-public2-ap-northeast-1c"
  }
  tags_all = {
    Name = "プロジェクト-subnet-public2-ap-northeast-1c"
  }
  vpc_id = "vpc-0953dd015f4bafa3e"
}

# __generated__ by Terraform from "kokishin-cluster-ba"
resource "aws_ecs_cluster" "test_ecs_cluster" {
  name     = "kokishin-cluster-ba"
  tags     = {}
  tags_all = {}
  configuration {
    execute_command_configuration {
      kms_key_id = null
      logging    = "DEFAULT"
    }
  }
  service_connect_defaults {
    namespace = "arn:aws:servicediscovery:ap-northeast-1:590183790791:namespace/ns-bghfsx3s7vq6ko7r"
  }
  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}

# __generated__ by Terraform from "arn:aws:ecs:ap-northeast-1:590183790791:task-definition/kokishin-ecs-task:1"
resource "aws_ecs_task_definition" "test_ecs_task_definition" {
  container_definitions = jsonencode([{
    cpu              = 0
    environment      = []
    environmentFiles = []
    essential        = true
    image            = "590183790791.dkr.ecr.ap-northeast-1.amazonaws.com/kokishin-fast-api:latest"
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-create-group  = "true"
        awslogs-group         = "/ecs/kokishin-ecs-task"
        awslogs-region        = "ap-northeast-1"
        awslogs-stream-prefix = "ecs"
      }
      secretOptions = []
    }
    mountPoints = []
    name        = "kokishin-ecs-container"
    portMappings = [{
      appProtocol   = "http"
      containerPort = 80
      hostPort      = 80
      name          = "kokishin-ecs-container-80-tcp"
      protocol      = "tcp"
    }]
    systemControls = []
    ulimits        = []
    volumesFrom    = []
  }])
  cpu                      = jsonencode(1024)
  execution_role_arn       = "arn:aws:iam::590183790791:role/ecsTaskExecutionRole"
  family                   = "kokishin-ecs-task"
  ipc_mode                 = null
  memory                   = jsonencode(3072)
  network_mode             = "awsvpc"
  pid_mode                 = null
  requires_compatibilities = ["FARGATE"]
  skip_destroy             = null
  tags                     = {}
  tags_all                 = {}
  task_role_arn            = null
  track_latest             = false
  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }
}

# __generated__ by Terraform from "kokishin-cluster-ba/kokishin-ecs-service-bb"
resource "aws_ecs_service" "test_ecs" {
  cluster                            = "arn:aws:ecs:ap-northeast-1:590183790791:cluster/kokishin-cluster-ba"
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 2
  enable_ecs_managed_tags            = true
  enable_execute_command             = false
  force_new_deployment               = null
  health_check_grace_period_seconds  = 0
  iam_role                           = "/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
  launch_type                        = null
  name                               = "kokishin-ecs-service-bb"
  platform_version                   = "LATEST"
  propagate_tags                     = "NONE"
  scheduling_strategy                = "REPLICA"
  tags                               = {}
  tags_all                           = {}
  task_definition                    = "kokishin-ecs-task:1"
  triggers                           = {}
  wait_for_steady_state              = null
  alarms {
    alarm_names = []
    enable      = false
    rollback    = false
  }
  capacity_provider_strategy {
    base              = 0
    capacity_provider = "FARGATE"
    weight            = 1
  }
  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }
  deployment_controller {
    type = "ECS"
  }
  load_balancer {
    container_name   = "kokishin-ecs-container"
    container_port   = 80
    elb_name         = null
    target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-1:590183790791:targetgroup/kokishin-ecs-service-tg-bb/c42df4bc10c653ee"
  }
  network_configuration {
    assign_public_ip = true
    security_groups  = ["sg-0773df873c53b18b1"]
    subnets          = ["subnet-045684f59f82c53db", "subnet-06e1cb840aefb76c5"]
  }
}

# __generated__ by Terraform
resource "aws_vpc" "test_vpc" {
  assign_generated_ipv6_cidr_block     = false
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  ipv4_ipam_pool_id                    = null
  ipv4_netmask_length                  = null
  ipv6_cidr_block                      = null
  ipv6_cidr_block_network_border_group = null
  ipv6_ipam_pool_id                    = null
  ipv6_netmask_length                  = 0
  tags = {
    Name = "プロジェクト-vpc"
  }
  tags_all = {
    Name = "プロジェクト-vpc"
  }
}

# __generated__ by Terraform from "arn:aws:iam::aws:policy/aws-service-role/AmazonECSServiceRolePolicy"
resource "aws_iam_policy" "test_ecs_task" {
  description = "Policy to enable Amazon ECS to manage your cluster."
  name        = "AmazonECSServiceRolePolicy"
  name_prefix = null
  path        = "/aws-service-role/"
  policy = jsonencode({
    Statement = [{
      Action   = ["ec2:AttachNetworkInterface", "ec2:CreateNetworkInterface", "ec2:CreateNetworkInterfacePermission", "ec2:DeleteNetworkInterface", "ec2:DeleteNetworkInterfacePermission", "ec2:Describe*", "ec2:DetachNetworkInterface", "elasticloadbalancing:DeregisterInstancesFromLoadBalancer", "elasticloadbalancing:DeregisterTargets", "elasticloadbalancing:Describe*", "elasticloadbalancing:RegisterInstancesWithLoadBalancer", "elasticloadbalancing:RegisterTargets", "route53:ChangeResourceRecordSets", "route53:CreateHealthCheck", "route53:DeleteHealthCheck", "route53:Get*", "route53:List*", "route53:UpdateHealthCheck", "servicediscovery:DeregisterInstance", "servicediscovery:Get*", "servicediscovery:List*", "servicediscovery:RegisterInstance", "servicediscovery:UpdateInstanceCustomHealthStatus"]
      Effect   = "Allow"
      Resource = "*"
      Sid      = "ECSTaskManagement"
      }, {
      Action   = ["autoscaling:Describe*"]
      Effect   = "Allow"
      Resource = "*"
      Sid      = "AutoScaling"
      }, {
      Action = ["autoscaling:DeletePolicy", "autoscaling:PutScalingPolicy", "autoscaling:SetInstanceProtection", "autoscaling:UpdateAutoScalingGroup", "autoscaling:PutLifecycleHook", "autoscaling:DeleteLifecycleHook", "autoscaling:CompleteLifecycleAction", "autoscaling:RecordLifecycleActionHeartbeat"]
      Condition = {
        Null = {
          "autoscaling:ResourceTag/AmazonECSManaged" = "false"
        }
      }
      Effect   = "Allow"
      Resource = "*"
      Sid      = "AutoScalingManagement"
      }, {
      Action   = ["autoscaling-plans:CreateScalingPlan", "autoscaling-plans:DeleteScalingPlan", "autoscaling-plans:DescribeScalingPlans", "autoscaling-plans:DescribeScalingPlanResources"]
      Effect   = "Allow"
      Resource = "*"
      Sid      = "AutoScalingPlanManagement"
      }, {
      Action   = ["events:DescribeRule", "events:ListTargetsByRule"]
      Effect   = "Allow"
      Resource = "arn:aws:events:*:*:rule/ecs-managed-*"
      Sid      = "EventBridge"
      }, {
      Action = ["events:PutRule", "events:PutTargets"]
      Condition = {
        StringEquals = {
          "events:ManagedBy" = "ecs.amazonaws.com"
        }
      }
      Effect   = "Allow"
      Resource = "*"
      Sid      = "EventBridgeRuleManagement"
      }, {
      Action   = ["cloudwatch:DeleteAlarms", "cloudwatch:DescribeAlarms", "cloudwatch:PutMetricAlarm"]
      Effect   = "Allow"
      Resource = "arn:aws:cloudwatch:*:*:alarm:*"
      Sid      = "CWAlarmManagement"
      }, {
      Action   = ["ec2:CreateTags"]
      Effect   = "Allow"
      Resource = "arn:aws:ec2:*:*:network-interface/*"
      Sid      = "ECSTagging"
      }, {
      Action   = ["logs:CreateLogGroup", "logs:DescribeLogGroups", "logs:PutRetentionPolicy"]
      Effect   = "Allow"
      Resource = "arn:aws:logs:*:*:log-group:/aws/ecs/*"
      Sid      = "CWLogGroupManagement"
      }, {
      Action   = ["logs:CreateLogStream", "logs:DescribeLogStreams", "logs:PutLogEvents"]
      Effect   = "Allow"
      Resource = "arn:aws:logs:*:*:log-group:/aws/ecs/*:log-stream:*"
      Sid      = "CWLogStreamManagement"
      }, {
      Action   = ["ssm:DescribeSessions"]
      Effect   = "Allow"
      Resource = "*"
      Sid      = "ExecuteCommandSessionManagement"
      }, {
      Action   = ["ssm:StartSession"]
      Effect   = "Allow"
      Resource = ["arn:aws:ecs:*:*:task/*", "arn:aws:ssm:*:*:document/AmazonECS-ExecuteInteractiveCommand"]
      Sid      = "ExecuteCommand"
      }, {
      Action = ["servicediscovery:CreateHttpNamespace", "servicediscovery:CreateService"]
      Condition = {
        "ForAllValues:StringEquals" = {
          "aws:TagKeys" = ["AmazonECSManaged"]
        }
      }
      Effect   = "Allow"
      Resource = "*"
      Sid      = "CloudMapResourceCreation"
      }, {
      Action = "servicediscovery:TagResource"
      Condition = {
        StringLike = {
          "aws:RequestTag/AmazonECSManaged" = "*"
        }
      }
      Effect   = "Allow"
      Resource = "*"
      Sid      = "CloudMapResourceTagging"
      }, {
      Action = ["servicediscovery:DeleteService"]
      Condition = {
        Null = {
          "aws:ResourceTag/AmazonECSManaged" = "false"
        }
      }
      Effect   = "Allow"
      Resource = "*"
      Sid      = "CloudMapResourceDeletion"
      }, {
      Action   = ["servicediscovery:DiscoverInstances", "servicediscovery:DiscoverInstancesRevision"]
      Effect   = "Allow"
      Resource = "*"
      Sid      = "CloudMapResourceDiscovery"
    }]
    Version = "2012-10-17"
  })
  tags     = {}
  tags_all = {}
}
