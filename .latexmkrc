# See docs: https://personal.psu.edu/~jcc8/software/latexmk/latexmk-470b.pdf
@default_files = ('zeth-protocol-specification.tex');

$pdf_mode = 1;
$bibtex_use = 2;
$recorder = 1;
#$preview_continuous_mode = 1;
#
# See: https://hopf.math.purdue.edu/doc/html/suffixes.html for file extensions
$clean_ext = "synctex.gz aux bbl bcf blg brf fdb_latexmk upa upb";

# See: http://mirror.ox.ac.uk/sites/ctan.org/support/latexmk/example_rcfiles/glossary_latexmkrc
add_cus_dep('glo', 'gls', 0, 'makeglossaries');
add_cus_dep('acn', 'acr', 0, 'makeglossaries');
$clean_ext .= " acr acn alg glo gls glg ist";
sub makeglossaries{
    my ($base_name, $path) = fileparse( $_[0] );
    pushd $path;
    my $return = system "makeglossaries", $base_name;
    popd;
    return $return;
}

# See: http://mirror.ox.ac.uk/sites/ctan.org/support/latexmk/example_rcfiles/nomenclature_latexmkrc
#add_cus_dep( 'nlo', 'nls', 0, 'nlo2nls' );
#sub nlo2nls {
#    system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls -t $_[0].nlg");
#}

# http://mirror.ox.ac.uk/sites/ctan.org/support/latexmk/example_rcfiles/pdflatexmkrc
add_cus_dep( 'nlo', 'nls', 0, 'makenlo2nls' );
$clean_ext .= " nlo nls";
sub makenlo2nls {
    system( "makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"" );
}
