#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
enum Statetype {NORMAL, SLASH, IN_COMMENT, END_STAR, DOUBLE_QUOTE, 
                SINGLE_QUOTE, DQ_BACKSLASH, SQ_BACKSLASH};

/*Handles normal state*/
enum Statetype 
handleNormalState(int c){
    enum Statetype state;
    if (c == '/'){
        state = SLASH;
    }
    else if (c == '"'){
        state = DOUBLE_QUOTE;
        putchar(c);
    }
    else if (c == '\''){
        state = SINGLE_QUOTE;
        putchar(c);
    }
    else{
        state = NORMAL;
        putchar(c);
    }
    return state;
}

/*Handles state for when a slash is encountered*/
enum Statetype
handleSlashState(int c){
    enum Statetype state;
    if (c == '/'){
        state = SLASH;
        putchar(c);
    }
    else if (c == '*'){
        state = IN_COMMENT;
        putchar(' ');
    }
    else if(c == '"'){
        state = DOUBLE_QUOTE;
        putchar('/');
        putchar(c);
    }
    else if(c == '\''){
        state = SINGLE_QUOTE;
        putchar('/');
        putchar(c);
    }
    else{
        state = NORMAL;
        putchar('/');
        putchar(c);
    }
    return state;
}

/*Handles state for when in a comment, when
a star has been encountered after a slash*/
enum Statetype
handleInCommentState(int c){
    enum Statetype state;
    if (c == '*'){
        state = END_STAR;
    }
    else{
        state = IN_COMMENT;
        if (c == '\n'){
            putchar(c);
        }
    }
    return state;
}

/*Handles state after a star is encountered, while already
in a comment*/
enum Statetype
handleEndStarState(int c){
    enum Statetype state;
    if (c == '/'){
        state = NORMAL;
    }
    else if (c == '*'){
        state = END_STAR;
    }
    else{
        state = IN_COMMENT;
        if (c == '\n'){
        putchar(c);
        }
    }
    return state;
 }

/*Handles state after a double quote is encountered*/
enum Statetype
handleDoubleQuoteState(int c){
    enum Statetype state;
    if (c == '"'){
        state = NORMAL;
        putchar(c);
    }
    else if (c == '\\'){
        state = DQ_BACKSLASH;
        putchar(c);
    }
    else{
        state = DOUBLE_QUOTE;
        putchar(c);
    }
    return state;
}

/*Handles state after a single quote is encountered*/
enum Statetype
handleSingleQuoteState(int c){
    enum Statetype state;
    if (c == '\''){
        state = NORMAL;
        putchar(c);
    }
    else if (c == '\\'){
        state = SQ_BACKSLASH;
        putchar(c);
    }
    else{
        state = SINGLE_QUOTE;
        putchar(c);
    }
    return state;
}

/*Handles state when backslash is encountered
after a double quote*/
enum Statetype
handleDQBackslash(int c){
    enum Statetype state;
    state = DOUBLE_QUOTE;
    putchar(c);
    return state;
 }

/*Handles state when backslash is encountered
after a single quote*/
enum Statetype
handleSQBackslash(int c){
    enum Statetype state;
    state = SINGLE_QUOTE;
    putchar(c);
    return state;
}

/*Updates state and calls the corresponding state handler*/
enum Statetype
updateState(int c, enum Statetype state){


    switch(state){

        case NORMAL:
            state = handleNormalState(c);
            break;
        case SLASH:
            state = handleSlashState(c);
            break;
        case IN_COMMENT:
            state = handleInCommentState(c);
            break;
        case END_STAR:
            state = handleEndStarState(c);
            break;
        case DOUBLE_QUOTE:
            state = handleDoubleQuoteState(c);
            break;
        case SINGLE_QUOTE:
            state = handleSingleQuoteState(c);
            break;
        case DQ_BACKSLASH:
            state = handleDQBackslash(c);
            break;   
        case SQ_BACKSLASH:
            state = handleSQBackslash(c);
            break;
    }
    return state;
}

int main(void){
    int c;

    /*Tracks total number of lines*/
    int line = 1;

    /*Tracks number of lines since the start of last comment*/
    int lastComment = 0;

    /*Starting state*/
    enum Statetype state = NORMAL;
    
    while ((c = getchar()) != EOF)
    {
         if (c == '\n'){
            line++;
            if (state == IN_COMMENT || state == END_STAR){
                lastComment++;
            }
            else{
                lastComment = 0;
            }
        }
       state = updateState(c, state); 
    }

    if (state == SLASH){
        putchar('/');
    }
    else if (state == IN_COMMENT || state == END_STAR){
        fprintf(stderr, 
                "Error: line %d: unterminated comment\n",line - lastComment);
        return EXIT_FAILURE;
    }
    return 0;
}

