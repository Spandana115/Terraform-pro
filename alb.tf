resource "aws_lb" "external_alb" {
name = "external-lb"
internal = false
load_balancer_type = "application"
security_groups = [aws_security_group.demosg.id]
subnets = [aws_subnet.public_subnet-1.id,aws_subnet.public_subnet-2.id]
}
resource "aws_lb_target_group" "target_elb" {
name="alb-tg"
port = 80
protocol = "HTTP"
vpc_id = aws_vpc.demovpc.id
}
resource "aws_lb_target_group_attachment" "attachment" {
target_group_arn = aws_lb_target_group.target_elb.arn
target_id = aws_instance.demoinstance[0].id
port= 80
depends_on = [aws_instance.demoinstance
]
}
resource "aws_lb_target_group_attachment" "attachment2" {
target_group_arn = aws_lb_target_group.target_elb.arn
target_id = aws_instance.demoinstance1[0].id
port = 80
depends_on = [aws_instance.demoinstance1
]
}
resource "aws_lb_listener" "external_elb"{
load_balancer_arn = aws_lb.external_alb.arn
port = 80
protocol = "HTTP"
default_action {
type = "forward"
target_group_arn = aws_lb_target_group.target_elb.arn
}
}
