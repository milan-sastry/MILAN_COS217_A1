#include <stdio.h>
#include <ctype.h>

enum Statetype {NORMAL, SLASH, IN_COMMENT, END_STAR, DOUBLE_QUOTE, SINGLE_QUOTE, DQ_BACKSLASH, SQ_BACKSLASH};

enum Stateype 
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
    else{
        state = NORMAL;
        putchar('/');
        putchar(c);
    }
    return state;
}

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
        return state;
    }
}

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
        }
        return state;
    }

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

    enum Statetype
    handleDQBackslash(int c){
        enum Statetype state;
        state = DOUBLE_QUOTE;
        putchar(c);
        return state;
    }

    enum Statetype
    handleSQBackslash(int c){
        enum Statetype state;
        state = SINGLE_QUOTE;
        putchar(c);
        return state;
    }


    void updateState(int c, int lineNumber, enum Statetype state){
        if (c == '\n'){
            lineNumber++;
        }

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

    }

int main(void){
    int c;
    int line = 1;
    enum Statetype state = NORMAL;
    while ((c = getchar()) != EOF)
    {
        updateState(c,line,state);
    }

    if (state == IN_COMMENT || state == END_STAR){
        fprintf(stderr, "Error: line " + line +": unterminated comment\n");
        exit(EXIT_FAILURE);
    }
    return 0;
}

