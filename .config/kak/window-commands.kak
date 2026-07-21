define-command new -override %{
    evaluate-commands %{ split kak -c %val{session} -e "%arg{@}" }
}

define-command newtab -params 1.. %{
    set-option local windowing_placement "tab"

    try %{
        evaluate-commands %{ terminal %arg{@} }
    } catch %{
        set-option local windowing_placement "window"
        evaluate-commands %{ terminal %arg{@} }
    }
}

define-command popup -params 1.. %{
    set-option local windowing_placement "window"
    evaluate-commands %{ terminal %arg{@} }
}

define-command split -params 1.. %{
    set-option local windowing_placement "horizontal"

    try %{
        evaluate-commands %{ terminal %arg{@} }
    } catch %{
        set-option local windowing_placement "window"
        evaluate-commands %{ terminal %arg{@} }
    }
}

define-command vsplit -params 1.. %{
    set-option local windowing_placement "vertical"

    try %{
        evaluate-commands %{ terminal %arg{@} }
    } catch %{
        set-option local windowing_placement "window"
        evaluate-commands %{ terminal %arg{@} }
    }
}

define-command vnew %{
    evaluate-commands %{ vsplit kak -c %val{session} -e "%arg{@}" }
}
