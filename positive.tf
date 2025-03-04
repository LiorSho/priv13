resource "aws_lb_listener" "app_listener_1" {
    load_balancer_arn = aws_lb.app_lb.arn
    port = "443"
    protocol = "HTTPS"
    ssl_policy = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
    certificate_arn = "arn:aws:acm:us-west-2:123456789012:certificate/EXAMPLE"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.app_tg.arn
    }
}