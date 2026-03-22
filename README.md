# 香港市場行銷技能套件

兩個為香港市場設計的 [OpenClaw](https://openclaw.ai) 技能，幫你用 Claude 撰寫符合本地語境、有效轉化的推廣文案。

## 技能

| 技能 | 用途 | 先後順序 |
|------|------|---------|
| `product-marketing-context-hk` | 建立產品定位和受眾背景資料 | ① 先用 |
| `copywriting-hk` | 撰寫各類頁面的推廣文案 | ② 後用 |

> **建議順序**：先建立背景資料，再寫文案。背景資料建立後，`copywriting-hk` 會自動讀取，唔需要每次重複說明產品資訊。

---

## 安裝方法

### 前置要求

- 已安裝 [OpenClaw](https://openclaw.ai)
- 終端機（macOS：Terminal / iTerm；Windows：PowerShell 或 WSL）

---

### 方法一：一行指令安裝（推薦）

打開終端機，貼上以下指令：

```bash
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh | bash
```

腳本會自動下載所有檔案並安裝至 OpenClaw 的技能目錄。

**安裝成功後，終端機會顯示：**

```
✓ product-marketing-context-hk 安裝完成
✓ copywriting-hk 安裝完成

✓ 安裝完成！
  技能已安裝至: ~/.openclaw/skills
```

---

### 方法二：只安裝單一技能

```bash
# 只安裝文案技能
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh | bash -s -- --skill copywriting-hk

# 只安裝背景資料技能
curl -fsSL https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main/install.sh | bash -s -- --skill product-marketing-context-hk
```

---

### 方法三：Git Clone

```bash
git clone https://github.com/yaiyouareai/YAI-Marketing.git
cd YAI-Marketing
bash install.sh
```

---

### 方法四：手動安裝

如果你不想用指令，也可以手動複製檔案：

1. 下載或 Clone 此 repo
2. 將以下資料夾複製到 OpenClaw 的技能目錄（`~/.openclaw/skills/`）：
   - `copywriting-hk/`（含 `references/` 子資料夾）
   - `product-marketing-context-hk/`
3. 重啟 OpenClaw

---

## 安裝後的目錄結構

```
~/.openclaw/skills/
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

## 在 OpenClaw 確認安裝成功

1. 打開 OpenClaw
2. 前往左側欄 **Skills**
3. 確認以下兩個技能已列出並啟用：
   - ✅ `product-marketing-context-hk`
   - ✅ `copywriting-hk`

如技能未顯示，嘗試重啟 OpenClaw 或手動刷新 Skills 頁面。

---

## 開始使用

在 OpenClaw 開啟新對話，直接輸入觸發語句：

**第一步 — 建立背景資料**
```
幫我設定產品行銷背景資料
```

**第二步 — 撰寫文案**
```
幫我寫主頁文案
```

其他常用觸發語句：
```
改一改呢個標題
呢個 CTA 點改好？
幫我整理我們的品牌定位
呢段文案有咩問題？
```

---

## 疑難排解

**技能安裝後不顯示**
- 重啟 OpenClaw
- 確認檔案位於 `~/.openclaw/skills/` 目錄內
- 確認每個技能資料夾內有 `SKILL.md` 檔案

**curl 指令失敗**
- 確認網絡連線正常
- 嘗試方法三（Git Clone）

**需要更新技能**
- 重新執行安裝指令，腳本會覆蓋舊版本

---

## Repo 檔案結構

```
YAI-Marketing/
├── README.md
├── install.sh
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

| 技能 | 版本 | 
|------|------|
| `copywriting-hk` | 1.0.0 | 
| `product-marketing-context-hk` | 1.0.0 | 
