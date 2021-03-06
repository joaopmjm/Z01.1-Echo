/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 * Created by Luciano Soares <lpsoares@insper.edu.br>
 * Date: 2/05/2017
 * Adaptado por Rafael Corsi <rafael.corsi@insper.edu.br>
 * Date: 5/2018
 */

package vmtranslator;

import java.util.*;
import java.io.*;
import java.nio.file.*;

/**
 * Traduz da linguagem vm para códigos assembly.
 */
public class Code {

    PrintWriter outputFile = null;  // arquivo .nasm de saída
    String filename = null;         // arquivo .vm de entrada
    int lineCode = 0;               // Linha do codigo vm que gerou as instrucoes
    int countereq = 0;
    int counterlt = 0;
    int countergt = 0;

    /**
     * Abre o arquivo de saida e prepara para escrever
     * @param filename nome do arquivo NASM que receberá o código traduzido.
     */
    public Code(String filename) throws FileNotFoundException,IOException {
        File file = new File(filename);
        this.outputFile = new PrintWriter(new FileWriter(file));
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para executar o comando aritmético.
     * @param  command comando aritmético a ser analisado.
     */
    public void writeArithmetic(String command) {

        if (command.equals("")) {
            Error.error("Instrução invalida");
        }

        List<String> commands = new ArrayList<String>();

        if(command.equals("add")) {
            commands.add(String.format("; %d - ADD", lineCode++));
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw (%A), %S");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("addw %S, %D, %D");
            commands.add("movw %D, (%A)");
            commands.add("incw %A");
            commands.add("movw %A, %D");
            commands.add("leaw $SP, %A");
            commands.add("movw %D, (%A)");

        } else if (command.equals("sub")) {
            commands.add(String.format("; %d - SUB", lineCode++));
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw (%A), %S");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("subw %D, %S, %D");
            commands.add("movw %D, (%A)");
            commands.add("incw %A");
            commands.add("movw %A, %D");
            commands.add("leaw $SP, %A");
            commands.add("movw %D, (%A)");

        } else if (command.equals("neg")) {
            commands.add(String.format("; %d - NEG", lineCode++));
            commands.add("leaw $SP, %A");
            commands.add("subw (%A), $1, %A");
            commands.add("movw (%A), %D");
            commands.add("negw %D");
            commands.add("movw %D, (%A)");

        } else if (command.equals("eq")) {
            commands.add("leaw $SP,%A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw (%A), %S");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("subw %D, %S, %D");
            commands.add("movw %A, %S");
            commands.add("incw %S");
            commands.add("leaw $SP, %A");
            commands.add("movw %S, (%A)");
            commands.add("leaw $EQ" + filename + countereq +", %A");
            commands.add("je %D");
            commands.add("nop");
            commands.add("leaw $0, %A");
            commands.add("movw %A, %D");
            commands.add("leaw $EQ-END" + filename + countereq + ", %A");
            commands.add("jmp");
            commands.add("nop");
            commands.add("EQ" + filename + countereq + ":");
            commands.add("leaw $65535, %A");
            commands.add("movw %A, %D");
            commands.add("EQ-END" + filename + countereq + ":");
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw %D, (%A)");
            countereq++;

        } else if (command.equals("gt")) {
            commands.add("leaw $SP,%A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw (%A), %S");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("subw %D, %S, %D");
            commands.add("movw %A, %S");
            commands.add("incw %S");
            commands.add("leaw $SP, %A");
            commands.add("movw %S, (%A)");
            commands.add("leaw $EQ" + filename + countergt +", %A");
            commands.add("jg %D");
            commands.add("nop");
            commands.add("leaw $0, %A");
            commands.add("movw %A, %D");
            commands.add("leaw $EQ-END" + filename + countergt + ", %A");
            commands.add("jmp");
            commands.add("nop");
            commands.add("EQ" + filename + countergt + ":");
            commands.add("leaw $65535, %A");
            commands.add("movw %A, %D");
            commands.add("EQ-END" + filename + countergt + ":");
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw %D, (%A)");
            countergt++;

        } else if (command.equals("lt")) {
            commands.add("leaw $SP,%A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw (%A), %S");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("subw %D, %S, %D");
            commands.add("movw %A, %S");
            commands.add("incw %S");
            commands.add("leaw $SP, %A");
            commands.add("movw %S, (%A)");
            commands.add("leaw $EQ" + filename + counterlt +", %A");
            commands.add("jl %D");
            commands.add("nop");
            commands.add("leaw $0, %A");
            commands.add("movw %A, %D");
            commands.add("leaw $EQ-END" + filename + counterlt + ", %A");
            commands.add("jmp");
            commands.add("nop");
            commands.add("EQ" + filename + counterlt + ":");
            commands.add("leaw $65535, %A");
            commands.add("movw %A, %D");
            commands.add("EQ-END" + filename + counterlt + ":");
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw %D, (%A)");
            counterlt++;


        } else if (command.equals("and")) {
            commands.add(String.format("; %d - AND", lineCode++));
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw (%A), %S");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("andw %S, %D, %D");
            commands.add("movw %D, (%A)");
            commands.add("incw %A");
            commands.add("movw %A, %D");
            commands.add("leaw $SP, %A");
            commands.add("movw %D, (%A)");

        } else if (command.equals("or")) {
            commands.add(String.format("; %d - OR", lineCode++));
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw (%A), %S");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("orw %S, %D, %D");
            commands.add("movw %D, (%A)");
            commands.add("incw %A");
            commands.add("movw %A, %D");
            commands.add("leaw $SP, %A");
            commands.add("movw %D, (%A)");

        } else if (command.equals("not")) {
            commands.add(String.format("; %d - NOT", lineCode++));
            commands.add("leaw $SP, %A");
            commands.add("subw (%A), $1, %A");
            commands.add("movw (%A), %d");
            commands.add("notw %D");
            commands.add("movw %D, (%A)");
        }

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para executar o comando de Push ou Pop.
     * @param  command comando de push ou pop a ser analisado.
     * @param  segment segmento de memória a ser usado pelo comando.
     * @param  index índice do segkento de memória a ser usado pelo comando.
     */
    public void writePushPop(Parser.CommandType command, String segment, Integer index) {

        if (command.equals("")) {
            Error.error("Instrução invalida");
        }

        List<String> commands = new ArrayList<String>();

        if(command == Parser.CommandType.C_POP) {
            commands.add(String.format("; %d - POP %s %d", lineCode++ ,segment, index));

            if (segment.equals("constant")) {
                Error.error("Não faz sentido POP com constant");
            } else if (segment.equals("local")) {
                commands.add("leaw $SP,%A");
                commands.add("movw (%A), %S");
                commands.add("decw %S");
                commands.add("movw %S, (%A)");
                commands.add("movw %S, %A");
                commands.add("movw (%A), %S");
                commands.add("leaw $LCL, %A");
                commands.add("movw (%A), %A");
                commands.add("movw %A, %D");
                commands.add("leaw $" + index + ", %A");
                commands.add("addw %A, %D, %A");
                commands.add("movw %S, (%A)");


            } else if (segment.equals("argument")) {

            } else if (segment.equals("this")) {
                commands.add("leaw $SP,%A");
                commands.add("movw (%A), %S");
                commands.add("decw %S");
                commands.add("movw %S, (%A)");
                commands.add("movw (%A), %A");
                commands.add("movw (%A), %S");
                commands.add("leaw $" + index + ", %A");
                commands.add("movw %A,%D");
                commands.add("leaw $THIS,%A");
                commands.add("movw (%A),%A");
                commands.add("addw %A, %D, %A");
                commands.add("movw %S, (%A)");

            } else if (segment.equals("that")) {
                commands.add("leaw $SP,%A");
                commands.add("movw (%A), %S");
                commands.add("decw %S");
                commands.add("movw %S, (%A)");
                commands.add("movw (%A), %A");
                commands.add("movw (%A), %S");
                commands.add("leaw $" + index + ", %A");
                commands.add("movw %A,%D");
                commands.add("leaw $THAT,%A");
                commands.add("movw (%A),%A");
                commands.add("addw %A, %D, %A");
                commands.add("movw %S, (%A)");

            } else if (segment.equals("static")) {

            } else if (segment.equals("temp")) {
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %S");
                commands.add("decw %S");
                commands.add("movw %S, (%A)");
                commands.add("movw %S, %A");
                commands.add("movw (%A), %S");
                commands.add("leaw $" + (index+5) + ", %A");
                commands.add("movw %S, (%A)");

            } else if (segment.equals("pointer")) {
                if(index==0) {
                    commands.add("leaw $SP, %A");
                    commands.add("movw (%A), %S");
                    commands.add("decw %S");
                    commands.add("movw %S, (%A)");
                    commands.add("movw %S, %A");
                    commands.add("movw (%A), %S");
                    commands.add("leaw $THIS, %A");
                    commands.add("movw %S, (%A)");
                } else {
                    commands.add("leaw $SP, %A");
                    commands.add("movw (%A), %S");
                    commands.add("decw %S");
                    commands.add("movw %S, (%A)");
                    commands.add("movw %S, %A");
                    commands.add("movw (%A), %S");
                    commands.add("leaw $THAT, %A");
                    commands.add("movw %S, (%A)");
                }
            }
        } else if (command == Parser.CommandType.C_PUSH) {
            commands.add(String.format("; %d - PUSH %s %d", lineCode++ ,segment, index));

            if (segment.equals("constant")) {
                //save constant in %D
                commands.add("leaw $" + index + ",%A");
                commands.add("movw %A,%D");
                //save D to stack pointer
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("movw %D,(%A)");
                //increment stack pointer
                commands.add("addw %A,$1,%S");
                commands.add("leaw $SP, %A");
                commands.add("movw %S,(%A)");

            } else if (segment.equals("local")) {
                //save local in D
                commands.add("leaw $LCL, %A");
                commands.add("movw (%A), %D");
                commands.add("leaw $" + index + " ,%A");
                commands.add("addw %A,%D,%A");
                commands.add("movw (%A),%D");
                //save D to stack pointer
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("movw %D,(%A)");
                //increment stack pointer
                commands.add("addw %A,$1,%S");
                commands.add("leaw $SP, %A");
                commands.add("movw %S,(%A)");

            } else if (segment.equals("argument")) {
                //save argument in D
                commands.add("leaw $ARG, %A");
                commands.add("movw (%A), %D");
                commands.add("leaw $" + index + " ,%A");
                commands.add("addw %A,%D,%A");
                commands.add("movw (%A),%D");
                //save D to stack pointer
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("movw %D,(%A)");
                //increment stack pointer
                commands.add("addw %A,$1,%S");
                commands.add("leaw $SP, %A");
                commands.add("movw %S,(%A)");

            } else if (segment.equals("this")) {
                commands.add("leaw $" + index + ", %A");
                commands.add("movw %A,%D");
                commands.add("leaw $THIS,%A");
                commands.add("movw (%A),%A");
                commands.add("addw %A, %D, %A");
                commands.add("movw (%A), %S");
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("movw %S, (%A)");
                commands.add("leaw $SP,%A");
                commands.add("movw (%A),%S");
                commands.add("incw %S");
                commands.add("movw %S, (%A)");
            } else if (segment.equals("that")) {
                commands.add("leaw $" + index + ", %A");
                commands.add("movw %A,%D");
                commands.add("leaw $THAT,%A");
                commands.add("movw (%A),%A");
                commands.add("addw %A, %D, %A");
                commands.add("movw (%A), %S");
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("movw %S, (%A)");
                commands.add("leaw $SP,%A");
                commands.add("movw (%A),%S");
                commands.add("incw %S");
                commands.add("movw %S, (%A)");


            } else if (segment.equals("static")) {

            } else if (segment.equals("temp")) {
                //save temp in D
                commands.add("leaw $" + (5 + index) + " ,%A");
                commands.add("movw (%A),%D");
                //save D to stack pointer
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("movw %D,(%A)");
                //increment stack pointer
                commands.add("addw %A,$1,%S");
                commands.add("leaw $SP, %A");
                commands.add("movw %S,(%A)");


            } else if (segment.equals("pointer")) {
                if(index==0) {

                } else {

                }
            }
        }

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para inicializar o processo da VM (bootstrap).
     * Também prepara a chamada para a função Sys.init
     * O código deve ser colocado no início do arquivo de saída.
     */
    public void writeInit(boolean bootstrap, boolean isDir) {

        List<String> commands = new ArrayList<String>();

        if(bootstrap || isDir)
            commands.add( "; Inicialização para VM" );

        if(bootstrap) {
            commands.add("leaw $256,%A");
            commands.add("movw %A,%D");
            commands.add("leaw $SP,%A");
            commands.add("movw %D,(%A)");
        }

        if(isDir){
            commands.add("leaw $Main.main, %A");
            commands.add("jmp");
            commands.add("nop");
        }

        if(bootstrap || isDir) {
            String[] stringArray = new String[commands.size()];
            commands.toArray(stringArray);
            write(stringArray);
        }
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para gerar o labels (marcadores de jump).
     * @param  label define nome do label (marcador) a ser escrito.
     */
    public void writeLabel(String label) {

        List<String> commands = new ArrayList<String>();
        commands.add( "; Label (marcador)" );

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para gerar as instruções de goto (jumps).
     * Realiza um jump incondicional para o label informado.
     * @param  label define jump a ser realizado para um label (marcador).
     */
    public void writeGoto(String label) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Goto Incondicional", lineCode++));

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para gerar as instruções de goto condicional (jumps condicionais).
     * Realiza um jump condicional para o label informado.
     * @param  label define jump a ser realizado para um label (marcador).
     */
    public void writeIf(String label) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Goto Condicional", lineCode++));

     }

    /**
     * Grava no arquivo de saida as instruções em Assembly para uma chamada de função (Call).
     * @param  functionName nome da função a ser "chamada" pelo call.
     * @param  numArgs número de argumentos a serem passados na função call.
     */
    public void writeCall(String functionName, Integer numArgs) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - chamada de funcao %s", lineCode++, functionName));

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para o retorno de uma sub rotina.
     */
    public void writeReturn() {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Retorno de função", lineCode++));

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para a declaração de uma função.
     * @param  functionName nome da função a ser criada.
     * @param  numLocals número de argumentos a serem passados na função call.
     */
    public void writeFunction(String functionName, Integer numLocals) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Declarando função %s", lineCode++, functionName));

    }

    /**
     * Armazena o nome do arquivo vm de origem.
     * Usado para definir os dados estáticos do código (por arquivo).
     * @param file nome do arquivo sendo tratado.
     */
    public void vmfile(String file) {

        int i = file.lastIndexOf(File.separator);
        int j = file.lastIndexOf('.');
        this.filename = file.substring(i+1,j);

    }

    // grava as instruções em Assembly no arquivo de saída
    public void write(String[] stringArray) {
        // gravando comandos no arquivos
        for (String s: stringArray) {
            this.outputFile.println(s);
        }
    }

    // fecha o arquivo de escrita
    public void close() throws IOException {
        this.outputFile.close();
    }

}
