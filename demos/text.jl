@widget wdg function textinputdemo()
    :text = textbox(value = "Initial text", label = "This is a simple text box")
    :textarea = textarea(placeholder = "Here you can write several lines", label = "A larger text box")
    :number = spinbox(value = 0, label = "Here you can put numbers")
    @output! wdg string("Here you wrote ", $(:text), " and ", $(:textarea), " and your number is ", $(:number))
    @display! wdg InteractBase.center($(_.output))
    @layout! wdg Widgets.div(:text, :textarea, :number, _.display)
end

code = Node(
    :div,
    Node(
        :pre,
        Node(
            :code,
            """
            @widget wdg function textinputdemo()
                :text = textbox(value = "Initial text", label = "This is a simple text box")
                :textarea = textarea(placeholder = "Here you can write several lines", label = "A larger text box")
                :number = spinbox(value = 0, label = "Here you can put numbers")
                @output! wdg string("Here you wrote ", \$(:text), " and ", \$(:textarea), " and your number is ", \$(:number))
                @display! wdg InteractBase.center(\$(_.output))
                @layout! wdg Widgets.div(:text, :textarea, :number, _.display)
            end
            """,
            className = "language-julia"
        )
    ),
    className = "content"
)

scp = Scope(imports = [
    joinpath.(@__DIR__, "..", "css", "style.css"),
    joinpath.(@__DIR__, "..", "highlight", "prism.css"),
    joinpath.(@__DIR__, "..", "highlight", "prism.js")
])

scp.dom = code

fct = function (req)
    Widgets.div(
        header("Text demos"),
        Widgets.div(
            Widgets.div(
                textinputdemo(),
                className = "section"
            ),
            Widgets.div(
                togglecontent(scp, label = "Show code"),
                className = "section has-background-light"
            ),
            className = "container"
        )
    )
end

push!(pages, page("/demos/text.jl", fct))
