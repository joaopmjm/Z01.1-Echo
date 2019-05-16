/**
 * Curso: Elementos de Sistemas
 * Arquivo: Assemble.java
 * Created by Luciano <lpsoares@insper.edu.br> 
 * Date: 04/02/2017
 *
 * 2018 @ Rafael Corsi
 */

package assembler;

import java.io.*;
import java.util.*;

/**
 * Faz a geração do código gerenciando os demais módulos
 */
public class Assemble {
    private String inputFile;              // arquivo de entrada nasm
    File hackFile = null;                  // arquivo de saída hack
    private PrintWriter outHACK = null;    // grava saida do código de máquina em Hack
    boolean debug;                         // flag que especifica se mensagens de debug são impressas
    private SymbolTable table;             // tabela de símbolos (variáveis e marcadores)

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  /mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public Assemble(String inFile, String outFileHack, boolean debug) throws IOException {
        this.debug = debug;
        inputFile  = inFile;
        hackFile   = new File(outFileHack);                      // Cria arquivo de saída .hack
        outHACK    = new PrintWriter(new FileWriter(hackFile));  // Cria saída do print para
                                                                 // o arquivo hackfile
        table      = new SymbolTable();                          // Cria e inicializa a tabela de simbolos

    }

    /**
     * primeiro passo para a construção da tabela de símbolos de marcadores (labels)
     * varre o código em busca de Símbolos novos Labels e Endereços de memórias
     * e atualiza a tabela de símbolos com os endereços.
     *
     * Dependencia : Parser, SymbolTable
     */
    public SymbolTable fillSymbolTable() throws FileNotFoundException, IOException {
        Parser parser = new Parser(inputFile);
        String p;
        String[] instructionList;
        String reg;
        Boolean isNumeric;
        String R;
        int counter = 0;
        int regCounter = 16;
        LinkedList<Parser> checkLabels = new LinkedList<>();
        while (parser.advance()) {
            p = parser.command();
            if (parser.commandType(p) == Parser.CommandType.L_COMMAND) {
                checkLabels.add(parser.label(p));
            }
        }

        while (parser.advance()) {
            p = parser.command();
            R = "R";
            if (parser.commandType(p) == Parser.CommandType.A_COMMAND) {
                instructionList = parser.instruction(p);
                if (!table.contains(instructionList[1])) {
                    reg = instructionList[1].split("\\$")[1];
                    try {
                        Integer.parseInt(reg);
                        isNumeric = true;
                    } catch (NumberFormatException e){
                        isNumeric = false;
                    }
                    if (isNumeric) {
                        R = R.concat(reg);
                        if (!table.contains(R)) {
                            table.addEntry(R, regCounter);
                            regCounter++;
                        }
                    } else {
                        table.addEntry(reg, regCounter);
                        regCounter++;
                    }
                }
                counter++;
            } else if (parser.commandType(p) == Parser.CommandType.C_COMMAND) {
                instructionList = parser.instruction(p);
                if (instructionList.length > 1) {
                    if (!table.contains(instructionList[1])) {
                        reg = instructionList[1].split("%")[1];
                        if (!(reg.equals("A") || reg.equals("D") || reg.equals("S") || reg.equals("A)"))) {
                            table.addEntry(instructionList[1], regCounter);
                            regCounter++;
                        }
                    }
                }
                counter++;
            } else {
                instructionList = parser.instruction(p);
                if (!table.contains(instructionList[1])) {
                    table.addEntry(parser.instruction(p)[0], counter);
                }
            }
        }
        return table;
    }

    /**
     * Segundo passo para a geração do código de máquina
     * Varre o código em busca de instruções do tipo A, C
     * gerando a linguagem de máquina a partir do parse das instruções.
     *
     * Dependencias : Parser, Code
     */
    public void generateMachineCode() throws FileNotFoundException, IOException{
        Parser parser = new Parser(inputFile);  // abre o arquivo e aponta para o começo
        String instruction  = null;

        /**
         * Aqui devemos varrer o código nasm linha a linha
         * e gerar a string 'instruction' para cada linha
         * de instrução válida do nasm
         */
        while (parser.advance()){
            switch (parser.commandType(parser.command())){
                case C_COMMAND:
                    break;
                case A_COMMAND:
                    break;
                default:
                    continue;
            }
            // Escreve no arquivo .hack a instrução
            if(outHACK!=null) {
                outHACK.println(instruction);
            }
            instruction = null;
        }

    }

    /**
     * Fecha arquivo de escrita
     */
    public void close() throws IOException {
        if(outHACK!=null) {
            outHACK.close();
        }
    }

    /**
     * Remove o arquivo de .hack se algum erro for encontrado
     */
    public void delete() {
        try{
            if(hackFile!=null) {
                hackFile.delete();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

}
