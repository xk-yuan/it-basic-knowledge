# go build

> go 编译

## 编译构建

### 交叉编译 - 跨平台编译

> GOOS：目标平台的操作系统（darwin、freebsd、linux、windows） GOARCH：目标平台的体系架构（386、amd64、arm） 交叉编译不支持 CGO 所以要禁用它

#### windows 环境下编译各平台

> macos

SET CGO_ENABLED=0
SET GOOS=darwin
SET GOARCH=amd64
go build main.go
​
> linux

SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=amd64
go build main.go

go env

#### linux 环境下编译各平台

> macos

CGO_ENABLED=0 
GOOS=darwin 
GOARCH=amd64 
go build main.go

> windows​

CGO_ENABLED=0 
GOOS=windows 
GOARCH=amd64 
go build main.go

#### macos 环境下编译各平台

CGO_ENABLED=0 
GOOS=linux 
GOARCH=amd64 
go build main.go
​
CGO_ENABLED=0 
GOOS=windows 
GOARCH=amd64 
go build main.go