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
     * @param  ;mnemnonic vetor de mnemônicos "instrução" a ser analisada.
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
        Parser parser = new Parser(this.inputFile);
        String p;
        String symbol;
        String label;
        int counter = 0;
        int regCounter = 16;
        // primeiro loop para salvar labels
        while (parser.advance()) {
            p = parser.command();
            if (parser.commandType(p) == Parser.CommandType.L_COMMAND) {
                label = parser.label(p);
                table.addEntry(label, counter);
                counter--;
            }
            counter++;
        }

        // segundo loop para salvar simbolos em comandos tipo A

        Parser parser1 = new Parser(this.inputFile);
        boolean check;
        while (parser1.advance()) {
            p = parser1.command();
            if (parser.commandType(p) == Parser.CommandType.A_COMMAND) {
                symbol = parser1.symbol(p);
                try {
                    Integer.parseInt(symbol);
                    check = true;
                } catch (NumberFormatException e) {
                    check = false;
                }

                if (!table.contains(symbol) && !check) {
                    table.addEntry(symbol, regCounter);
                    regCounter++;
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
        String destino, computa, pulo, symbol, binario,bit;

        /**
         * Aqui devemos varrer o código nasm linha a linha
         * e gerar a string 'instruction' para cada linha
         * de instrução válida do nasm
         */
        while (parser.advance()){
            String[] comandos = parser.instruction(parser.command());
            switch (parser.commandType(parser.command())){
                case C_COMMAND:
                    bit = "10";
                    destino = Code.dest(comandos);
                    computa = Code.comp(comandos);
                    pulo = Code.jump(comandos);
                    instruction = bit + computa + destino + pulo;
                    break;
                case A_COMMAND:
                    bit = "00";
                    symbol = parser.symbol(parser.command());
                    if (table.contains(symbol)) {
                        int symbol_value = table.getAddress(symbol);
                        binario = Code.toBinary(Integer.toString(symbol_value));
                    } else {
                        binario = Code.toBinary(symbol);
                    }
                    instruction = bit + binario;
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
