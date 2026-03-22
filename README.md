# 香港市場行銷技能套件

兩個為香港市場設計的 Claude 技能，幫你撰寫符合本地語境、有效轉化的推廣文案。

## 技能

| 技能 | 用途 | 先後順序 |
|------|------|---------|
| `product-marketing-context-hk` | 建立產品定位和受眾背景資料 | ① 先用 |
| `copywriting-hk` | 撰寫各類頁面的推廣文案 | ② 後用 |

---

## 快速安裝

### 方法一：一行指令（推薦）

```bash
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh | bash
```

### 方法二：下載腳本後執行

```bash
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh -o install.sh
bash install.sh
```

### 方法三：只安裝單一技能

```bash
# 只安裝文案技能
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh | bash -s -- --skill copywriting-hk

# 只安裝背景資料技能
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh | bash -s -- --skill product-marketing-context-hk
```

### 方法四：指定安裝目錄

```bash
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh | bash -s -- --dir /path/to/your/skills
```

預設安裝至 `~/.claude/skills/`

### 方法五：Git Clone

```bash
git clone https://github.com/yaiyouareai/YAI-Marketing.git
cd marketing-skills-hk
bash install.sh
```

---

## 安裝後的目錄結構

```
~/.claude/skills/
├── copywriting-hk/
│   ├── SKILL.md
│   ├── evals.json
│   └── references/
│       ├── copy-frameworks-hk.md
│       └── natural-transitions-hk.md
└── product-marketing-context-hk/
    ├── SKILL.md
    └── evals.json
```

---

## 開始使用

安裝後在 Claude 對話中直接輸入：

**第一步 — 建立背景資料**
```
幫我設定產品行銷背景資料
```

**第二步 — 撰寫文案**
```
幫我寫主頁文案
```

---

## 檔案結構

```
marketing-skills-hk/
├── README.md
├── install.sh                              ← 安裝腳本
├── copywriting-hk/
│   ├── SKILL.md
│   ├── evals.json
│   └── references/
│       ├── copy-frameworks-hk.md
│       └── natural-transitions-hk.md
└── product-marketing-context-hk/
    ├── SKILL.md
    └── evals.json
```

---

## 版本

| 技能 | 版本 | 基於原版 |
|------|------|---------|
| `copywriting-hk` | 1.0.0 | `copywriting` v1.1.0 |
| `product-marketing-context-hk` | 1.0.0 | `product-marketing-context` v1.1.0 |
