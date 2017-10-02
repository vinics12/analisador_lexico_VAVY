package br.com.analisador_lexico_compiladores;


%%

%{

private void printToken(String description, String lexeme) {
		System.out.println(lexeme + " - \t" + description);
}
private void printNewLine(String description){
	System.out.println("\\n" +" - \t" + description);
}
private void printTAB(String description){
	System.out.println("\\t" +" - \t" + description);
}
private void unknownCharacter(String description){
	System.out.println(description);
}

%}

%class LexicalAnalyzer
%type void

EOL 				 = [\r|\n|\r\n]
NEWLINE			 = [\n]
TAB				 = [\t]
BLANK 			 = [\n| |\t|\r|\r\n]
ID 	  			 = [_|a-z|A-Z][a-z|A-Z|0-9|_]*

SUM   			 = "+"
SUB				 = "-"
MUL				 = "*"
DIV				 = "/"

int			 = 0|[1-9][0-9]*
dec			 = (([0-9]+[.][0-9]*)|([0-9]*[.][0-9]+))
CHAR				 = ['][a-z|A-Z|a-z0-9][']
seq 			 = ["].[^\x]+[a-z|A-Z|a-z0-9]*.[^\x]+["]
EMPTY_STRING		 = [']['] | [']{BLANK}*['] | ["]["]| ["]{BLANK}*["]
COMMENT 		 	 = "/*" [^*] ~"*/" | "/*" "*" "/"

%%


"int"		{printToken("Reserved word interger ", yytext());}
"dec"		{printToken("Reserved word float ", yytext());}
"seq"		{printToken("Reserved word string ", yytext());}
"aqui"				{printToken("Reserved word if ", yytext());}
"ali"			{printToken("Reserved word else ", yytext());}
"vai"			{printToken("Reserved word for ", yytext());}
"mostrar"		{printToken("Output function ", yytext());}
"pegar"			{printToken("Input function ", yytext());}
"vaise"		{printToken("Reserved word while ", yytext());}

"{"				{printToken("block start ", yytext());}
"}"				{printToken("Block end ", yytext());}
";"				{printToken("End of instruction", yytext());}
"("				{printToken("Open parentheses ", yytext());}
")"				{printToken("Close parentheses ", yytext());}
"["				{printToken("Open bracket ", yytext());}
"]"				{printToken("Close bracket ", yytext());}
"||"			 	{printToken("OR operator ", yytext());}
"&&"				{printToken("AND operator ", yytext());}
"++"				{printToken("Increment operator ", yytext());}
"--"				{printToken("Decrement operator ", yytext());}
"!="				{printToken("Not equal operator", yytext());}
","				{printToken("Concatenation operator ", yytext());}

{NEWLINE}		{printNewLine("New line scape");}
{TAB}			{printTAB("Tabulation scape");}
{BLANK}			{printToken("Blank space ", yytext());}

{ID}				{printToken("Identificator ", yytext());}
{SUM}			{printToken("Sum operator ", yytext());}
{SUB}			{printToken("Subtraction operator ", yytext());}
{MUL}			{printToken("Multiplication operator ", yytext());}
{DIV}			{printToken("Division operator", yytext());}
{int}		{printToken("Integer number ", yytext());}
{dec}			{printToken("Float number ",yytext());}
{CHAR}				{printToken("Character ", yytext());}
{seq}			{printToken("String ", yytext());}
{EMPTY_STRING}	{printToken("Empty string ", yytext());}


{COMMENT}		{printToken("Comment ", yytext());}

"<"				{printToken("Less than operator ", yytext());}
">"				{printToken("Greater than operator ", yytext());}
"<="				{printToken("Less than or equal to operator ", yytext());}
">="				{printToken("Greater than or equal to operator ", yytext());}
"=="				{printToken("Equal to operator ", yytext());}
"="				{printToken("Attribution operator ", yytext());}



.				{unknownCharacter("Unknown character " + yytext());}				









