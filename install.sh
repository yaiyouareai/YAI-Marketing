#!/usr/bin/env bash
# ============================================================
#  YAI 香港市場行銷技能套件 — 安裝腳本
#  https://github.com/yaiyouareai/YAI-Marketing
# ============================================================

set -e

REPO="https://raw.githubusercontent.com/yaiyouareai/YAI-Marketing/main"
SKILLS_DIR="${OPENCLAW_SKILLS_DIR:-$HOME/.openclaw/skills}"

# ── 顏色輸出 ────────────────────────────────────────────────
RED='\033[0;31m'; GOLD='\033[0;33m'; GREEN='\033[0;32m'
CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

log()    { echo -e "${CYAN}▸${RESET} $1"; }
ok()     { echo -e "${GREEN}✓${RESET} $1"; }
warn()   { echo -e "${GOLD}!${RESET} $1"; }
err()    { echo -e "${RED}✗${RESET} $1"; exit 1; }
header() { echo -e "\n${BOLD}$1${RESET}"; }

# ── 所有可用技能 ─────────────────────────────────────────────
ALL_SKILLS=(
  "product-marketing-context-hk"
  "copywriting-hk"
  "editing-content-hk"
  "social-content-hk"
  "strategy-content-hk"
  "strategy-launch-hk"
)

# ── 解析參數 ────────────────────────────────────────────────
SKILL=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --skill) SKILL="$2"; shift 2 ;;
    --dir)   SKILLS_DIR="$2"; shift 2 ;;
    --help)
      echo ""
      echo "用法: install.sh [選項]"
      echo ""
      echo "選項:"
      echo "  --skill <名稱>   只安裝指定技能（見下方列表）"
      echo "  --dir <路徑>     指定安裝目錄 (預設: ~/.openclaw/skills)"
      echo "  --help           顯示此說明"
      echo ""
      echo "可用技能:"
      echo "  product-marketing-context-hk   產品行銷背景資料（建議先安裝）"
      echo "  copywriting-hk                 文案撰寫"
      echo "  editing-content-hk             文案編輯"
      echo "  social-content-hk              社交媒體內容"
      echo "  strategy-content-hk            內容策略"
      echo "  strategy-launch-hk             產品發布策略"
      echo ""
      echo "範例:"
      echo "  bash install.sh                                    # 安裝全部"
      echo "  bash install.sh --skill copywriting-hk             # 只安裝文案技能"
      echo "  bash install.sh --dir ~/my-skills                  # 指定安裝目錄"
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

# ── 各技能安裝函式 ───────────────────────────────────────────

install_product_marketing_context_hk() {
  header "📋 安裝 product-marketing-context-hk"
  local dest="$SKILLS_DIR/product-marketing-context-hk"
  mkdir -p "$dest"
  download "product-marketing-context-hk/SKILL.md"   "$dest/SKILL.md"
  download "product-marketing-context-hk/evals.json" "$dest/evals.json"
  ok "product-marketing-context-hk 安裝完成 → $dest"
}

install_copywriting_hk() {
  header "✍️  安裝 copywriting-hk"
  local dest="$SKILLS_DIR/copywriting-hk"
  mkdir -p "$dest/references"
  download "copywriting-hk/SKILL.md"                              "$dest/SKILL.md"
  download "copywriting-hk/evals.json"                            "$dest/evals.json"
  download "copywriting-hk/references/copy-frameworks-hk.md"     "$dest/references/copy-frameworks-hk.md"
  download "copywriting-hk/references/natural-transitions-hk.md" "$dest/references/natural-transitions-hk.md"
  ok "copywriting-hk 安裝完成 → $dest"
}

install_editing_content_hk() {
  header "✏️  安裝 editing-content-hk"
  local dest="$SKILLS_DIR/editing-content-hk"
  mkdir -p "$dest/references"
  download "editing-content-hk/SKILL.md"                                        "$dest/SKILL.md"
  download "editing-content-hk/evals.json"                                      "$dest/evals.json"
  download "editing-content-hk/references/plain-english-alternatives-hk.md"    "$dest/references/plain-english-alternatives-hk.md"
  ok "editing-content-hk 安裝完成 → $dest"
}

install_social_content_hk() {
  header "📱 安裝 social-content-hk"
  local dest="$SKILLS_DIR/social-content-hk"
  mkdir -p "$dest/references"
  download "social-content-hk/SKILL.md"                                  "$dest/SKILL.md"
  download "social-content-hk/evals.json"                                "$dest/evals.json"
  download "social-content-hk/references/platforms-hk.md"               "$dest/references/platforms-hk.md"
  download "social-content-hk/references/post-templates-hk.md"          "$dest/references/post-templates-hk.md"
  download "social-content-hk/references/reverse-engineering-hk.md"     "$dest/references/reverse-engineering-hk.md"
  ok "social-content-hk 安裝完成 → $dest"
}

install_strategy_content_hk() {
  header "🗺️  安裝 strategy-content-hk"
  local dest="$SKILLS_DIR/strategy-content-hk"
  mkdir -p "$dest/references"
  download "strategy-content-hk/SKILL.md"                              "$dest/SKILL.md"
  download "strategy-content-hk/evals.json"                            "$dest/evals.json"
  download "strategy-content-hk/references/headless-cms-hk.md"        "$dest/references/headless-cms-hk.md"
  ok "strategy-content-hk 安裝完成 → $dest"
}

install_strategy_launch_hk() {
  header "🚀 安裝 strategy-launch-hk"
  local dest="$SKILLS_DIR/strategy-launch-hk"
  mkdir -p "$dest"
  download "strategy-launch-hk/SKILL.md"   "$dest/SKILL.md"
  download "strategy-launch-hk/evals.json" "$dest/evals.json"
  ok "strategy-launch-hk 安裝完成 → $dest"
}

# ── 執行安裝 ────────────────────────────────────────────────
echo -e "\n${BOLD}YAI 香港市場行銷技能套件 安裝程式${RESET}"
echo -e "${GOLD}─────────────────────────────────────${RESET}"

case "$SKILL" in
  "product-marketing-context-hk") install_product_marketing_context_hk ;;
  "copywriting-hk")                install_copywriting_hk ;;
  "editing-content-hk")            install_editing_content_hk ;;
  "social-content-hk")             install_social_content_hk ;;
  "strategy-content-hk")           install_strategy_content_hk ;;
  "strategy-launch-hk")            install_strategy_launch_hk ;;
  "")
    # 安裝全部（按推薦順序）
    install_product_marketing_context_hk
    install_copywriting_hk
    install_editing_content_hk
    install_social_content_hk
    install_strategy_content_hk
    install_strategy_launch_hk
    ;;
  *) err "未知技能: $SKILL。用 --help 查看可用技能列表。" ;;
esac

# ── 完成 ─────────────────────────────────────────────────────
echo ""
echo -e "${GOLD}─────────────────────────────────────${RESET}"
echo -e "${GREEN}${BOLD}✓ 安裝完成！${RESET}"
echo ""
echo -e "技能已安裝至: ${CYAN}$SKILLS_DIR${RESET}"
echo ""
echo -e "${BOLD}建議起步順序：${RESET}"
echo -e "  1. 先說：${CYAN}「幫我設定產品行銷背景資料」${RESET}"
echo -e "  2. 再說：${CYAN}「幫我寫主頁文案」${RESET}"
echo -e "  3. 或說：${CYAN}「幫我規劃內容策略」${RESET}"
echo ""
