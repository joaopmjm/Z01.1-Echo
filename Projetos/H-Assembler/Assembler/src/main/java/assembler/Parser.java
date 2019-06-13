/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 */

package assembler;

import sun.awt.image.ImageWatched;

import javax.sound.midi.SysexMessage;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;

/**
 * Encapsula o código de leitura. Carrega as instruções na linguagem assembly,
 * analisa, e oferece acesso as partes da instrução  (campos e símbolos).
 * Além disso, remove todos os espaços em branco e comentários.
 */
public class Parser {

    public String currentCommand = "";  // comando atual
    public String inputFile;		    // arquivo de leitura
    public int lineNumber = 0;			// linha atual do arquivo (nao do codigo gerado)
    public String currentLine;			// linha de codigo atual
    private BufferedReader fileReader;  // leitor de arquivo


    /** Enumerator para os tipos de comandos do Assembler. */
    public enum CommandType {
        A_COMMAND,      // comandos LEA, que armazenam no registrador A
        C_COMMAND,      // comandos de calculos
        L_COMMAND       // comandos de Label (símbolos)
    }

    /**
     * Abre o arquivo de entrada NASM e se prepara para analisá-lo.
     * @param file arquivo NASM que será feito o parser.
     */
    public Parser(String file) throws FileNotFoundException {
        this.lineNumber = 0;
        this.inputFile = file;
        this.fileReader = new BufferedReader(new FileReader(file));
    }

    /**
     * Carrega uma instrução e avança seu apontador interno para o próxima
     * linha do arquivo de entrada. Caso não haja mais linhas no arquivo de
     * entrada o método retorna "Falso", senão retorna "Verdadeiro".
     * @return Verdadeiro se ainda há instruções, Falso se as instruções terminaram.
     */
    public Boolean advance() {
        // usar o fileReader.readLine();
        try{
            while(true){
                String read = fileReader.readLine();
                this.lineNumber++;
                if (read == null){ return false;}
                else {// if(commandType(read).equals(CommandType.A_COMMAND) || commandType(read).equals(CommandType.C_COMMAND)){
                    this.currentCommand = read;
                    return true;
                }
            }
        }catch (IOException ex){ex.printStackTrace();}
        return null;
    }

    /**
     * Retorna o comando "intrução" atual (sem o avanço)
     * @return a instrução atual para ser analilisada
     */
    public String command() {
        String[] sp = this.currentCommand.split(" ");
        String sts = "";
        for(String s:sp){
            if (!s.isEmpty()){
            if (s.charAt(0) != ';'){
                sts += s + " ";
            }else{
                break;
            }
        }}
        this.currentCommand = sts.substring(0, sts.length() - 1);
    	return this.currentCommand;
    }

    /**
     * Retorna o tipo da instrução passada no argumento:
     *  A_COMMAND para leaw, por exemplo leaw $1,%A
     *  L_COMMAND para labels, por exemplo Xyz: , onde Xyz é um símbolo.
     *  C_COMMAND para todos os outros comandos
     * @param  command instrução a ser analisada.
     * @return o tipo da instrução.
     */
    public CommandType commandType(String command){
        String[] assmebly = new String[]{"movw","addw","subw","rsubw","incw","decw","notw","negw","andw","orw","jmp","je","jne","jg","jge","jl","jle","nop",};
        LinkedList<String> codes = new LinkedList<String>();
        Collections.addAll(codes, assmebly);
        String[] codigos = command.split(" ");
        if(codigos[0].equals("leaw")){
            return CommandType.A_COMMAND;
        }else if(codes.contains(codigos[0])){
            return CommandType.C_COMMAND;
        }else{
            return  CommandType.L_COMMAND;
        }
    }

    /**
     * Retorna o símbolo ou valor numérico da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é A_COMMAND.
     * @param  command instrução a ser analisada.
     * @return somente o símbolo ou o valor número da instrução.
     */

    public String symbol(String command) {

        String sym = "";

        if (commandType(command) == CommandType.A_COMMAND) {

            sym = command.replace("leaw $", "");

            sym = sym.split(",")[0];
        }

        return sym;
    }

    /**
     * Retorna o símbolo da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é L_COMMAND.
     * @param  command instrução a ser analisada.
     * @return o símbolo da instrução (sem os dois pontos).
     */
    public String label(String command) {

        String sim = "";

        if (commandType(command) == CommandType.L_COMMAND) sim = command.replace(":", "");

        return sim;
    }

    /**
     * Separa os mnemônicos da instrução fornecida em tokens em um vetor de Strings.
     * Deve ser chamado somente quando CommandType () é C_COMMAND.
     * @param  command instrução a ser analisada.
     * @return um vetor de string contento os tokens da instrução (as partes do comando).
     */
    public String[] instruction(String command) {
        command = command.replace(",", " ");
        command = command.replace("  ", " ");
        String[] comandos = command.split(" ");
        return comandos;
    }
    // fecha o arquivo de leitura
    public void close() throws IOException {
        fileReader.close();
    }


}
