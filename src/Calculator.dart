
class Calculator{
    int makeCalculation(int operand1,int operand2, String operator){
    
        switch(operator){
        case "+":{
            return addition(operand1, operand2);
        
        }
        case "-":{
            return subtraction(operand1, operand2);
        
        }
        case "*":{
            return multiplication(operand1, operand2);
        
        }
        case "/":{
            return division(operand1, operand2);
        
        }
      }

        return null; 
    }

    int addition(int operand1,int operand2){
        return operand1+operand2;
    }
    int subtraction(int operand1,int operand2){
        return operand1-operand2;
    }
    int multiplication(int operand1,int operand2){
        return operand1*operand2;
    }
    int division(int operand1,int operand2){
        int result;
        try {
            result = operand1~/operand2;
        }
        on IntegerDivisionByZeroException { 
            print('Can not divide by zero'); 
            return null;
        } 
        return result;
    
    }
  

}