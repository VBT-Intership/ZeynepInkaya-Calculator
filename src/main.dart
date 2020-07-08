import 'dart:convert';
import 'dart:io';
import 'Calculator.dart';
void main(List<String> args) {
    print("Console calculator with dart\nPlease write [operand] [operator] [operand]");
    executeProgram();
}

void executeProgram(){
    List<String> parameters= new List();
    var input = readInput();
    parameters = parseInput(input);
    /*
    If parameter list contains less than 3 or more than 3 elements, that means input is not valid.
    */
    if(parameters.length != 3) 
        return;
    
    Calculator calculator = new Calculator();

    int result = calculator.makeCalculation(int.parse(parameters[0]), int.parse(parameters[1]), parameters[2]);

    print(result==null? "Error occured" : result);

}


/*
Read user input from console
*/
String readInput(){
    var line = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    return line;
}
/*
Split given string into the list.
Traverse through the string, add operand when character is the operator.
If user does not enter a whitespace between the operator and the operand, a loop is required instead of directly using the split method.
@param input is read line fron console
@return List<String> is parsed parameters.
*/

List<String> parseInput(String input){
    String temp = "";
    List<String> operands = new List();
    String operator = "";
    input.runes.forEach((int rune) {
        var character=new String.fromCharCode(rune);
        if(isNumeric(character)){
            temp += character;
        }
        else{
            operands.add(temp);
            temp = "";
            operator += character;

        }
    });
    operands.add(temp);
    operands.add(operator);
    return operands;

}
/*
Check given string is numeric or not.
@param str input
@return true if string contains only decimals, false otherwise.
*/
bool isNumeric(String str) {
    RegExp numericRegex = RegExp(r'^-?[0-9]+$');
    return numericRegex.hasMatch(str);
}