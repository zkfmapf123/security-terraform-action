variable "role_arn" {
  
}

provider "aws" {
  region = "ap-northeast-2"
  
  assume_role {
    role_arn = var.role_arn
    session_name = "leedonggyu-root" ## cloud trail에서 세션을 식별하는 용도
  }
}

