# partials/header.html

<!-- add syntax highlighting -->
<script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>

# partials/li.html

- Summary auskommentieren

<section class="post-excerpt">
    <p>{{ .Summary }} <a class="read-more" href="{{.RelPermalink}}">&raquo;</a></p>
</section>

# _default/single.html

- Prev- und Next-Buttons hinzufügen

<section class="post-content">
    {{ .Content }}
    <!-- add <Prev> and <Next> buttons to each post -->
    <div class="pagination">{{ if .Prev }}
      <a class="btn previous " href="{{.Prev.Permalink}}"> Prev</a> {{ end }} {{ if .Next }}
      <a class="btn next " href="{{.Next.Permalink}}"> Next</a> {{ end }}
    </div>
</section>

- Footer mit Logo ans Social-Media-Links auskommentieren

<!--
  <footer class="post-footer">
...
  </footer>
-->

# static/css/screen.css

.post-excerpt p {
    margin: 0;
    font-size: 0.9em;
    line-height: 1.7em;
    display: inline; # add this to avoid newline before '>>' 
}

# static/css/nav.css

- an das Ende einfügen:
  - Styles für Fussnoten
  - Styles für Prev- und Next-Buttons
  - Styles für Run-Button


/* footnote styles */
.footnotes {
    font-size: 0.8em;
	line-height: 1em;
    font-style: italic;
}

/* 'Prev' and 'Next' buttons styles */
.pagination {
  position: relative;
  margin-top: 5em;
}

.pagination:before, .pagination:after {
    content: '';
    display: table;
}

.pagination:after {
    clear: both;
}

.pagination .previous {
    float: left;
}

.pagination .next {
    float: right;
}

.btn {
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 5px;
    color: #ccc;
    cursor: pointer;
    display: inline-block;
    font-family: inherit;
    font-size: 100%;
    line-height: normal;
    padding: 0.5rem 0.75rem;
    text-align: center;
    /*text-transform: uppercase;*/
    text-decoration: none;
    vertical-align: middle;
    white-space: nowrap;
    -webkit-transition: all 0.3s;
            transition: all 0.3s;
}

.btn::-moz-focus-inner {
    padding: 0;
    border: 0;
}

.btn:hover, .btn:focus {
    color: #7fdbff;
    border: 1px solid #7fdbff;
    -webkit-transition: all 0.3s;
            transition: all 0.3s;
    text-decoration: none;
}

.btn:active {
    color: #0074d9;
    border: 1px solid #0074d9;
    -webkit-transition: all 0.3s;
            transition: all 0.3s;
}

/* 'Run' button styles */
.playground {
    color: #ccc;
    background-color: white;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    cursor: pointer;
    font-family: inherit;
    font-size: 0.8em;
    line-height: normal;
    text-align: center;
    /*text-transform: uppercase;*/
    text-decoration: none;
    vertical-align: middle;
    white-space: nowrap;
    -webkit-transition: all 0.3s;
            transition: all 0.3s;
}
