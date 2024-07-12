## network周り

import {
 id = "vpc-0953dd015f4bafa3e"
 to = aws_vpc.test_vpc
}

import {
  id = "subnet-05817c1c66e858906"
  to = aws_subnet.test_subnet_private_1a
}

import {
  id = "subnet-036c91f48c9bfd174"
  to = aws_subnet.test_subnet_private_1c
}

import {
  id = "subnet-06e1cb840aefb76c5"
  to = aws_subnet.test_subnet_public_1a
}

import {
  id = "subnet-045684f59f82c53db"
  to = aws_subnet.test_subnet_public_1c
}

import {
  id = "rtb-0c08496df22919263"
  to = aws_route_table.test_rtb_private_1c
}

import {
  id = "rtb-069bd252a9719cec3"
  to = aws_route_table.test_rtb_private_1a
}

import {
  id = "rtb-064be43fa6c8b457c"
  to = aws_route_table.test_rtb_public
}

import {
  id = "igw-0e9b178074eb5778b"
  to = aws_internet_gateway.test_igw
}

import {
  id = "sg-0773df873c53b18b1"
  to = aws_security_group.test_ecs_sg
}

## ecs clusterからタスク定義関連

import {
  id = "kokishin-cluster-ba"
  to = aws_ecs_cluster.test_ecs_cluster
}

import {
  id = "arn:aws:ecs:ap-northeast-1:590183790791:task-definition/kokishin-ecs-task:1"
  to = aws_ecs_task_definition.test_ecs_task_definition
}

import {
  id = "arn:aws:iam::590183790791:role/ecsTaskExecutionRole"
  to = aws_iam_role.test_ecs_execution
}
#
#import {
#  id = ""
#  to = aws_iam_role_policy_attachment.ecs_execution
#}

import {
  id = "arn:aws:iam::590183790791:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
  to = aws_iam_role.test_ecs_task
}

import {
  id = "arn:aws:iam::aws:policy/aws-service-role/AmazonECSServiceRolePolicy"
  to = aws_iam_policy.test_ecs_task
}
#
#import {
#  id = ""
#  to = aws_iam_role_policy_attachment.test_ecs_task
#}

## ecs周り

import {
  id = "kokishin-cluster-ba/kokishin-ecs-service-bb"
  to = aws_ecs_service.test_ecs
}

import {
  id = "arn:aws:elasticloadbalancing:ap-northeast-1:590183790791:loadbalancer/app/kokishin-alb-bb/5c2e09c787897012"
  to = aws_lb.test_alb
}

import {
  id = "arn:aws:elasticloadbalancing:ap-northeast-1:590183790791:targetgroup/kokishin-ecs-service-tg-bb/c42df4bc10c653ee"
  to = aws_lb_target_group.test_alb_tg
}

import {
  id = ""
  to = aws_ecr_repository.test_ecr
}
