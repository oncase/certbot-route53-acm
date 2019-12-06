# Certbot for AWS Cert Manager

This image enables you to create/renew Let's Encrypt SSL certificates using dns challenge for AWS Route53 and then automatically create or update them on AWS Certificate Manager.

The following environment variables should be provided:

* DRYRUN - Runs only certbot in `--dry-run` mode; useful for not exceedng rate limits when debugging;
* DOMAIN_NAME - The domain you want the certificate for;
* CONTACT_EMAIL - the contact-email you'll want to associate to the certificate;
* AWS_DEFAULT_REGION - the aws region you want to deploy your certificate;
* AWS_ACCESS_KEY_ID - your AWS Key - used to deploy DNS Challenges on Route 53 as well as to send certificates to Cert Manager;
* AWS_SECRET_ACCESS_KEY - Your AWS access key;
* CERT_ARN - When updating an existing certificate, you must provide the arn for the existing resource on AWS Certificate Manager.
* AWS_CONTAINER_CREDENTIALS_RELATIVE_URI can be passed to the container to avoid having to use key/secret - it works for AWS Environments ECS/CodeBuild.

# Use cases

Even though we're showing `docker-compose` commands, the image can be handled with the `docker` command as well.

## Dry run - testing certbot

```bash
DRYRUN=true \
  DOMAIN_NAME=sub.example.com \
  CONTACT_EMAIL=john@doe.com \
  AWS_DEFAULT_REGION=us-east-2 \
  AWS_ACCESS_KEY_ID=34TG5YH56J5 \
  AWS_SECRET_ACCESS_KEY=I3RF92MRCIUENV0WUER0UWEV0WEBVW \
    docker-compose run certbot && \
    docker-compose rm -f
```

## New certificate

```bash
DOMAIN_NAME=sub.example.com \
  CONTACT_EMAIL=john@doe.com \
  AWS_DEFAULT_REGION=us-east-2 \
  AWS_ACCESS_KEY_ID=34TG5YH56J5 \
  AWS_SECRET_ACCESS_KEY=I3RF92MRCIUENV0WUER0UWEV0WEBVW \
    docker-compose run certbot && \
    docker-compose rm -f
```

## Renew existing certificate

```bash
DOMAIN_NAME=sub.example.com \
  CONTACT_EMAIL=john@doe.com \
  AWS_DEFAULT_REGION=us-east-2 \
  AWS_ACCESS_KEY_ID=34TG5YH56J5 \
  AWS_SECRET_ACCESS_KEY=I3RF92MRCIUENV0WUER0UWEV0WEBVW \
  CERT_ARN=arn:aws:acm:us-east-2:123123:certificate/123-cccc-3333-1111-3a3a3a3a \
    docker-compose run certbot && \
    docker-compose rm -f
```
