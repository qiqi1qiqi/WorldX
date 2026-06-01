# 使用 Node.js 18 作为基础镜像
FROM node:18-alpine

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json
COPY package*.json ./

# 安装依赖
RUN npm install

# 复制项目所有文件到工作目录
COPY . .

# 暴露服务端口（例如 WorldX 的服务器端口 3100 和客户端端口 3200）
EXPOSE 3100 3200

# 启动命令（根据你的 package.json 修改）
CMD ["npm", "run", "dev"]
