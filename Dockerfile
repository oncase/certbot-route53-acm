FROM certbot/dns-route53:latest
RUN apk add bash
RUN pip install awscli boto3 s3transfer botocore --upgrade
WORKDIR /certbot-route53
ADD run.sh .
ENTRYPOINT ["/certbot-route53/run.sh"]
