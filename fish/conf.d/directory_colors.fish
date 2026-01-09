# ディレクトリによって iTerm2/tmux の背景色を自動変更
# Solarized Dark をベースにした色設定

function __update_terminal_bg --on-variable PWD
    # iTerm2 の場合（tmux 内外両方で動作）
    if test -n "$ITERM_SESSION_ID"
        if string match -q "*/work/engage-api*" $PWD
            # 青系の背景色 (明るめの青)
            # tmux 内の場合は passthrough を使う
            if test -n "$TMUX"
                echo -ne "\033Ptmux;\033\033]1337;SetColors=bg=1a3a4a\a\033\\"
            else
                echo -ne "\033]1337;SetColors=bg=1a3a4a\a"
            end
        else if string match -q "*/work/delivery-api*" $PWD
            # 赤系の背景色 (落ち着いた暗い赤)
            if test -n "$TMUX"
                echo -ne "\033Ptmux;\033\033]1337;SetColors=bg=2d1b1b\a\033\\"
            else
                echo -ne "\033]1337;SetColors=bg=2d1b1b\a"
            end
        else
            # デフォルトの Solarized Dark 背景色
            if test -n "$TMUX"
                echo -ne "\033Ptmux;\033\033]1337;SetColors=bg=002b36\a\033\\"
            else
                echo -ne "\033]1337;SetColors=bg=002b36\a"
            end
        end
    end
end

# 初回起動時にも実行
__update_terminal_bg
