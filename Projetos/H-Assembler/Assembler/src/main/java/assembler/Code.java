/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

/**
 * Traduz mnemônicos da linguagem assembly para códigos binários da arquitetura Z0.
 */
public class Code {

    /**
     * Retorna o código binário do(s) registrador(es) que vão receber o valor da instrução.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {
        if (mnemnonic[0].equals("movw")){
            if (mnemnonic.length == 4){
                if ((mnemnonic[mnemnonic.length -1].equals("%D") && mnemnonic[mnemnonic.length-2].equals("%S")) ||  ((mnemnonic[mnemnonic.length-1].equals("%S") && mnemnonic[mnemnonic.length-2].equals("%D")))){
                return "0110";
            }
            else if((mnemnonic[mnemnonic.length -1].equals("%D") && mnemnonic[mnemnonic.length-2].equals("%A")) ||  ((mnemnonic[mnemnonic.length-1].equals("%A") && mnemnonic[mnemnonic.length-2].equals("%D")))){
                return "1010";
            }else if((mnemnonic[mnemnonic.length -1].equals("%S") && mnemnonic[mnemnonic.length-2].equals("%A")) ||  ((mnemnonic[mnemnonic.length-1].equals("%A") && mnemnonic[mnemnonic.length-2].equals("%S")))){
                return "1100";
            }else if((mnemnonic[mnemnonic.length -1].equals("%S") && mnemnonic[mnemnonic.length-2].equals("(%A)")) ||  ((mnemnonic[mnemnonic.length-1].equals("(%A)") && mnemnonic[mnemnonic.length-2].equals("%S")))){
                return "0101";
            }else if((mnemnonic[mnemnonic.length -1].equals("%D") && mnemnonic[mnemnonic.length-2].equals("(%A)")) ||  ((mnemnonic[mnemnonic.length-1].equals("(%A)") && mnemnonic[mnemnonic.length-2].equals("%D")))){
                return "0011";
            }}}

        switch (mnemnonic[mnemnonic.length-1]){
            case "jmp"  :
            case "jg"   :
            case "je"   :
            case "jge"  :
            case "jl"   :
            case "jne"  :
            case "jle"  :
                return "0000";
            case "%A"  : return "1000";
            case "%D"  : return "0010";
            case "%S"  : return "0100";
            case "(%A)"  : return "0001";
        }
        return "0000";
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
    	return "";
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
        switch (mnemnonic[0]){
            case "jmp"  : return "111";
            case "jg"   : return "001";
            case "je"   : return "010";
            case "jge"  : return "011";
            case "jl"   : return "100";
            case "jne"  : return "101";
            case "jle"  : return "110";
            default     : return "000";
        }
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
        int value = Integer.valueOf(symbol);
        String binary = Integer.toBinaryString(value);
        return String.format("%1$16s", binary).replace(" ", "0");
    }

}
