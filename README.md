# Security Terraform + Github Actions

## Terraform (Security)

### 기존 방식 (AccessKey, SecretKey)

![1](./public/1.png)

### AssumeRole을 활용해서 접근하는 방식

![2](./public/2.png)

- 기존 Credentials Key 방식보다 Role 사용한 방식이 더 안전...
- Role을 사용해서 대신 접근하는 방식

### 구성 방법

1. User 생성

- Create TerraformManagingUser

2. Role 생성

- Create <b>TerraformManageingRole</b>

- Setting Trust Relationship

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Statement1",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::<account-id>:user/terraformManagingUser"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
```

3. 정책

- Create <b>TerraformManagingPolicy</b>

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Statement1",
      "Effect": "Allow",
      "Action": ["iam:PassRole"],
      "Resource": ["arn:aws:iam::<account-id>:role/TerraformManageingRole"]
    }
  ]
}
```

## Github Action (Security)
