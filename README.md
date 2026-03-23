# YAI 香港市場行銷技能套件

六個為香港市場設計的 [OpenClaw](https://openclaw.ai) 行銷技能，幫你用 Claude 規劃策略、撰寫文案、管理社交媒體，全面符合香港本地語境。

## 技能一覽

| 技能 | 用途 | 建議順序 |
|------|------|---------|
| `product-marketing-context-hk` | 建立產品定位和受眾背景資料 | ① 最先 |
| `strategy-content-hk` | 規劃整體內容策略、話題群組、關鍵詞 | ② |
| `strategy-launch-hk` | 規劃產品發布策略、KOL、媒體 | ③ |
| `copywriting-hk` | 撰寫各類頁面的推廣文案 | ④ |
| `editing-content-hk` | 編輯和改善現有文案 | ⑤ |
| `social-content-hk` | 建立社交媒體內容計劃 | ⑥ |

> **建議先安裝 `product-marketing-context-hk`**，建立背景資料後，其他五個技能會自動讀取，唔需要每次重複說明產品資訊。

---

## 快速安裝

### 方法一：一行指令安裝全部（推薦）

```bash
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh | bash
```

### 方法二：只安裝指定技能

```bash
# 只安裝產品背景資料技能
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh | bash -s -- --skill product-marketing-context-hk

# 只安裝文案技能
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh | bash -s -- --skill copywriting-hk

# 只安裝文案編輯技能
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh | bash -s -- --skill editing-content-hk

# 只安裝社交媒體技能
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh | bash -s -- --skill social-content-hk

# 只安裝內容策略技能
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh | bash -s -- --skill strategy-content-hk

# 只安裝發布策略技能
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh | bash -s -- --skill strategy-launch-hk
```

### 方法三：指定安裝目錄

```bash
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh | bash -s -- --dir /path/to/your/skills
```

預設安裝至 `~/.openclaw/skills/`

### 方法四：Git Clone

```bash
git clone https://github.com/yaiyouareai/YAI-Marketing.git
cd YAI-Marketing
bash install.sh
```

### 方法五：手動安裝（OpenClaw）

1. 下載或 Clone 此 repo
2. 將想要的技能資料夾複製到 `~/.openclaw/skills/`
3. 重啟 OpenClaw

---

## 在 OpenClaw 確認安裝成功

1. 打開 OpenClaw
2. 前往左側欄 **Skills**
3. 確認以下技能已列出並啟用：
   - ✅ `product-marketing-context-hk`
   - ✅ `strategy-content-hk`
   - ✅ `strategy-launch-hk`
   - ✅ `copywriting-hk`
   - ✅ `editing-content-hk`
   - ✅ `social-content-hk`

如技能未顯示，嘗試重啟 OpenClaw 或手動刷新 Skills 頁面。

---

## 在 Claude.ai 安裝（Project 方式）

如果你使用 Claude.ai（Pro / Team），可以透過 Project 功能手動使用技能：

### 步驟一：建立 Project

在 Claude.ai 左側欄點擊 **Projects** → **+ New Project**，命名為「YAI 香港行銷技能」。

### 步驟二：上傳技能檔案至 Project Knowledge

在 Project 設定頁面找到 **Project Knowledge**，點擊 **Add content**，上傳以下檔案：

**必須上傳（核心技能）：**
- `product-marketing-context-hk/SKILL.md`
- `copywriting-hk/SKILL.md`
- `editing-content-hk/SKILL.md`
- `social-content-hk/SKILL.md`
- `strategy-content-hk/SKILL.md`
- `strategy-launch-hk/SKILL.md`

**建議一併上傳（Reference Files）：**
- `copywriting-hk/references/copy-frameworks-hk.md`
- `copywriting-hk/references/natural-transitions-hk.md`
- `editing-content-hk/references/plain-english-alternatives-hk.md`
- `social-content-hk/references/platforms-hk.md`
- `social-content-hk/references/post-templates-hk.md`
- `social-content-hk/references/reverse-engineering-hk.md`
- `strategy-content-hk/references/headless-cms-hk.md`

### 步驟三：設定 Project Instructions

在 Project 設定中找到 **Custom Instructions**，加入以下說明：

```
你有六個香港市場行銷技能，已上傳至 Project Knowledge：

1. product-marketing-context-hk — 建立和管理產品行銷背景資料
2. strategy-content-hk — 規劃內容策略和話題群組
3. strategy-launch-hk — 規劃產品發布策略
4. copywriting-hk — 撰寫香港市場推廣文案
5. editing-content-hk — 編輯和改善現有文案
6. social-content-hk — 建立社交媒體內容計劃

處理行銷任務時，先讀取對應的 SKILL.md 並按照其中的指引執行。
背景資料儲存於 .agents/product-marketing-context.md。
```

### 步驟四：在 Project 內開始對話

**必須在你建立的 Project 內開啟新對話**（唔係普通的 New Chat），然後直接輸入觸發語句。

---

## 開始使用

安裝後在 OpenClaw 或 Claude.ai Project 內直接輸入：

```
幫我設定產品行銷背景資料
```

其他常用觸發語句：

```
幫我規劃內容策略
幫我寫主頁文案
改一改呢段文案
幫我建立社交媒體策略
我們快要推出新產品，幫我規劃發布計劃
```

---

## 安裝後的目錄結構

```
~/.openclaw/skills/
├── product-marketing-context-hk/
│   ├── SKILL.md
│   └── evals.json
├── copywriting-hk/
│   ├── SKILL.md
│   ├── evals.json
│   └── references/
│       ├── copy-frameworks-hk.md
│       └── natural-transitions-hk.md
├── editing-content-hk/
│   ├── SKILL.md
│   ├── evals.json
│   └── references/
│       └── plain-english-alternatives-hk.md
├── social-content-hk/
│   ├── SKILL.md
│   ├── evals.json
│   └── references/
│       ├── platforms-hk.md
│       ├── post-templates-hk.md
│       └── reverse-engineering-hk.md
├── strategy-content-hk/
│   ├── SKILL.md
│   ├── evals.json
│   └── references/
│       └── headless-cms-hk.md
└── strategy-launch-hk/
    ├── SKILL.md
    └── evals.json
```

---

## Repo 檔案結構

```
YAI-Marketing/
├── README.md
├── README.html
├── install.sh
├── product-marketing-context-hk/
├── copywriting-hk/
├── editing-content-hk/
├── social-content-hk/
├── strategy-content-hk/
└── strategy-launch-hk/
```

---

## 疑難排解

**技能安裝後不顯示**
- 重啟 OpenClaw
- 確認檔案位於 `~/.openclaw/skills/` 目錄內
- 確認每個技能資料夾內有 `SKILL.md` 檔案

**curl 指令失敗（404 錯誤）**
- 確認 repo 為公開（Public）狀態
- 確認所有技能資料夾和檔案已上傳至 GitHub
- 嘗試方法四（Git Clone）

**Claude.ai Project 技能不生效**
- 確認在 Project 內對話（唔係普通 New Chat）
- 確認 SKILL.md 已上傳至 Project Knowledge
- 確認 Project Instructions 已設置

**需要更新技能**
- 重新執行安裝指令，腳本會覆蓋舊版本

---

## 版本

| 技能 | 版本 | 基於原版 |
|------|------|---------|
| `product-marketing-context-hk` | 1.0.0 | `product-marketing-context` v1.1.0 |
| `strategy-content-hk` | 1.0.0 | `content-strategy` v1.1.0 |
| `strategy-launch-hk` | 1.0.0 | `launch-strategy` v1.1.0 |
| `copywriting-hk` | 1.0.0 | `copywriting` v1.1.0 |
| `editing-content-hk` | 1.0.0 | `copy-editing` v1.1.0 |
| `social-content-hk` | 1.1.0 | `social-content` v1.1.0 |
