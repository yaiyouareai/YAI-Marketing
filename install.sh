#!/usr/bin/env bash
# ============================================================
#  香港市場行銷技能套件 — 安裝腳本
#  https://github.com/yaiyouareai/YAI-Marketing
# ============================================================

set -e

REPO="https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main"
SKILLS_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

# ── 顏色輸出 ────────────────────────────────────────────────
RED='\033[0;31m'; GOLD='\033[0;33m'; GREEN='\033[0;32m'
CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

log()  { echo -e "${CYAN}▸${RESET} $1"; }
ok()   { echo -e "${GREEN}✓${RESET} $1"; }
warn() { echo -e "${GOLD}!${RESET} $1"; }
err()  { echo -e "${RED}✗${RESET} $1"; exit 1; }
header() { echo -e "\n${BOLD}$1${RESET}"; }

# ── 解析參數 ────────────────────────────────────────────────
SKILL=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --skill) SKILL="$2"; shift 2 ;;
    --dir)   SKILLS_DIR="$2"; shift 2 ;;
    --help)
      echo "用法: install.sh [選項]"
      echo ""
      echo "選項:"
      echo "  --skill <名稱>   只安裝指定技能"
      echo "                   可選: copywriting-hk"
      echo "                         product-marketing-context-hk"
      echo "  --dir <路徑>     指定安裝目錄 (預設: ~/.claude/skills)"
      echo "  --help           顯示此說明"
      echo ""
      echo "範例:"
      echo "  bash install.sh                          # 安裝全部"
      echo "  bash install.sh --skill copywriting-hk  # 只安裝文案技能"
      exit 0 ;;
    *) err "未知選項: $1。用 --help 查看說明。" ;;
  esac
done

# ── 前置檢查 ────────────────────────────────────────────────
header "🔍 檢查環境"
command -v curl >/dev/null 2>&1 || err "需要 curl，請先安裝：brew install curl 或 apt install curl"
ok "curl 已就緒"

# ── 建立目錄 ────────────────────────────────────────────────
header "📁 建立技能目錄"
mkdir -p "$SKILLS_DIR"
ok "目錄: $SKILLS_DIR"

# ── 下載函式 ────────────────────────────────────────────────
download() {
  local remote_path="$1"
  local local_path="$2"
  mkdir -p "$(dirname "$local_path")"
  if curl -fsSL "$REPO/$remote_path" -o "$local_path"; then
    ok "下載 $remote_path"
  else
    err "下載失敗: $REPO/$remote_path"
  fi
}

# ── 安裝 product-marketing-context-hk ───────────────────────
install_pmc() {
  header "📋 安裝 product-marketing-context-hk"
  local dest="$SKILLS_DIR/product-marketing-context-hk"
  mkdir -p "$dest"
  download "product-marketing-context-hk/SKILL.md"   "$dest/SKILL.md"
  download "product-marketing-context-hk/evals.json" "$dest/evals.json"
  ok "product-marketing-context-hk 安裝完成 → $dest"
}

# ── 安裝 copywriting-hk ──────────────────────────────────────
install_cw() {
  header "✍️  安裝 copywriting-hk"
  local dest="$SKILLS_DIR/copywriting-hk"
  mkdir -p "$dest/references"
  download "copywriting-hk/SKILL.md"                                  "$dest/SKILL.md"
  download "copywriting-hk/evals.json"                                "$dest/evals.json"
  download "copywriting-hk/references/copy-frameworks-hk.md"         "$dest/references/copy-frameworks-hk.md"
  download "copywriting-hk/references/natural-transitions-hk.md"     "$dest/references/natural-transitions-hk.md"
  ok "copywriting-hk 安裝完成 → $dest"
}

# ── 執行安裝 ────────────────────────────────────────────────
echo -e "\n${BOLD}香港市場行銷技能套件 安裝程式${RESET}"
echo -e "${GOLD}─────────────────────────────────────${RESET}"

case "$SKILL" in
  "copywriting-hk")              install_cw ;;
  "product-marketing-context-hk") install_pmc ;;
  "")
    install_pmc
    install_cw
    ;;
  *) err "未知技能: $SKILL" ;;
esac

# ── 完成 ─────────────────────────────────────────────────────
echo ""
echo -e "${GOLD}─────────────────────────────────────${RESET}"
echo -e "${GREEN}${BOLD}✓ 安裝完成！${RESET}"
echo ""
echo -e "技能已安裝至: ${CYAN}$SKILLS_DIR${RESET}"
echo ""
echo -e "${BOLD}開始使用：${RESET}"
echo -e "  1. 先說：${CYAN}「幫我設定產品行銷背景資料」${RESET}"
echo -e "  2. 再說：${CYAN}「幫我寫主頁文案」${RESET}"
echo ""
