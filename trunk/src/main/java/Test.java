import javax.script.*;

public class Test {


	/**
	 * @Description: TODO
	 * @param args
	 * 
	 * @date 2015年12月30日 
	 * @author 1936
	 */
	public static void main(String[] args) throws Exception {
		
		int a = 5;
		
		for(int i=0;i<32;i++){
		    int t = (a & 0X80000000 >>>i) >>> (31-i);

		    System.out.print(t);
		}
		System.out.println();
		System.out.println(Integer.toBinaryString(5));
		
        ScriptEngineManager manager = new ScriptEngineManager();
        ScriptEngine engine = manager.getEngineByName("JavaScript");
        engine.eval("print ('Hello World')");
        

	}
	
}
