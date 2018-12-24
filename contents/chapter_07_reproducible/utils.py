def mktable(symbols,
            nrow = 3, 
            justification = 'cc'):    
                
    '''
    This monstrosity returns a string that is a LaTeX tabular
    table of LaTeX math(s) commands and how they appear when
    rendered.
    '''
    
    n = len(symbols)
    
    ncol = (n % nrow > 0) * 1 + n // nrow
    
    cc = '|'.join([justification] * ncol)
    
    # These four are for dealing with slashes and braces in 
    # the verbatim of the \LaTeX command.
    G = lambda x: x.replace('\\', '\\textbackslash{}')
    
    F = lambda x: x.replace('{','LEFTCURLYBRACE').replace('}','RIGHTCURLYBRACE')

    H = lambda x: x.replace('LEFTCURLYBRACE', r'\{').replace('RIGHTCURLYBRACE', r'\}')
    
    J = lambda x: x.replace('^', r'\^{}').replace('_', '\_')
    
    def slice_keys(x, k):
        return ' & '.join([x[k,key[1]] for key in x.keys() if key[0] == k])
    
    x = {}
    for i, symbol in enumerate(symbols):        
        col, row = divmod(i, nrow)
        x[row, col] = "\\texttt{%s} & $%s$" % (J(H(G(F(symbol)))), symbol)
        
    S = []
    for i in range(nrow):
        s = slice_keys(x, i)
        s = s + ' & ' * (ncol * 2 - s.count('$'))
        S.append(s)
        

    return '\n'.join([
        '\\begin{center}',
        '\\begin{tabular}{%s}' % cc,
        '\\\\ \n'.join(S),
        '\\end{tabular}',
        '\\end{center}'
    ])
