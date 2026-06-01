# 使用 node:18-alpine 作为基础镜像
FROM node:18-alpine

# 设置工作目录
WORKDIR /app

# 1. 复制依赖描述文件
COPY package.json package-lock.json ./

# 2. 关键步骤：在安装依赖之前，先把所有代码复制进去
# 因为 package.json 的 postinstall 脚本需要访问 client/server 等目录
COPY . .

# 3. 安装所有依赖
# 由于之前执行了 COPY . .，现在 npm install 会触发 postinstall 脚本
# 脚本能够找到 client 等目录，安装过程将顺利进行
RUN npm install

# 4. 暴露端口并启动应用 (根据你的项目需求调整)
EXPOSE 3200
CMD ["npm", "start"]
