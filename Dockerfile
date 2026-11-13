# 免费API雷达 — Cloady 部署用 Dockerfile（草稿，未推送）
# 用途：让 Cloady 从 GitHub 仓库直接拉取部署，绕开 Sai 下载文件到临时文件夹那一步
# （2026-11-13 迁站首次尝试即卡在 Sai 下载 index.html 触发的执行类审批上）。
# Cloady 文档：GitHub 仓库粘贴进 Deploy 后，用 Railpack 或 Dockerfile 构建；
# 本站是纯静态文件（index.html + llms.txt），无构建步骤，故用 Dockerfile 直接起静态服务。
# 注意：不要改 index.html / llms.txt；推到 GitHub 不影响 Pages（Pages 只读 index.html）。
FROM python:3.12-alpine
WORKDIR /app
COPY index.html llms.txt ./
# Cloady 注入 $PORT；未注入时默认 8080。python http.server 只做静态文件服务。
CMD ["sh", "-c", "python3 -m http.server ${PORT:-8080}"]
EXPOSE 8080
