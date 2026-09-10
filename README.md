# Comfyui_Comfly（团队修改版）

基于 [ainewsto/Comfyui_Comfly](https://github.com/ainewsto/Comfyui_Comfly) 的修改分支。原项目采用 Apache License 2.0，本仓库保留原 LICENSE，并在原版基础上做了如下修改（原版完整说明见上游仓库或本仓库 git 历史）。

## 与原版的差异

### 1. 新增节点：Comfly_gpt_image_25_official
用于 gpt-image-2.5 系列模型（`gpt-image-2.5-flare` / `gpt-image-2.5-sunburst` 及其 `-2k` / `-4k` 变体）。
- 参数与 `Comfly_gpt_image_2_official` 对齐：13 种画幅比例、1k/2k/4k 分辨率档位、5 路参考图、mask、异步任务轮询，可作为该节点的直接替换
- quality 档位新增 `xhigh`、`max`
- background 档位新增 `transparent`（透明背景，需搭配 png/webp 输出格式）

### 2. 修复：透明背景输出丢失 alpha 通道
原版在解码 API 返回图片时将 RGBA 强制转为 RGB，导致 `background=transparent` 生成的透明 PNG 变成不透明图片。现新增 `pil2tensor_preserve_alpha`，出图解码保留 alpha 通道（覆盖同步 / 异步两条解码路径）。

### 3. 团队同步脚本
新增 `拉取更新.bat` / `推送更新.bat`，双击即完成与仓库的同步，团队成员保持同一版本。

## 兼容性与安装

- 原有节点名全部保持不变，基于原版搭建的工作流可直接使用。
- 本插件是原版的**替代品**，请勿与原版同时安装（两者节点注册名相同，会互相覆盖）。
- 安装：
  ```
  git clone https://github.com/polaris6668/Comfyui_Comfly.git
  ```
- 已安装的用户：更新前双击 `拉取更新.bat`；修改后双击 `推送更新.bat`（需协作者权限）。

## 协议

Apache License 2.0（同原项目），详见 [LICENSE](LICENSE)。
