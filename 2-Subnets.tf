#These are   for  public

resource "aws_subnet" "public-me-south-1a" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.74.1.0/24"
  availability_zone       = "me-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-me-south-1a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "public-me-south-1b" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.74.2.0/24"
  availability_zone       = "me-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-me-south-1b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "public-me-south-1c" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.74.3.0/24"
  availability_zone       = "me-south-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-me-south-1c"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}


#these are for private
resource "aws_subnet" "private-me-south-1a" {
  vpc_id            = aws_vpc.app1.id
  cidr_block        = "10.74.11.0/24"
  availability_zone = "me-south-1a"

  tags = {
    Name    = "private-me-south-1a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "private-me-south-1b" {
  vpc_id            = aws_vpc.app1.id
  cidr_block        = "10.74.12.0/24"
  availability_zone = "me-south-1b"

  tags = {
    Name    = "private-me-south-1b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "private-me-south-1c" {
  vpc_id            = aws_vpc.app1.id
  cidr_block        = "10.74.13.0/24"
  availability_zone = "me-south-1c"

  tags = {
    Name    = "private-me-south-1c"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}