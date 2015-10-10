import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class Matrix {
	
	private static final int m1RowNum = 500;
	private static final int m1ColNum = 700;
	private static final int m2RowNum = 700;
	private static final int m2ColNum = 600;
	
	public static void main(String args[]) {
		
		Matrix matrix = new Matrix();
		double[][] m1 = matrix.generateDoubleMatrix(m1RowNum, m1ColNum);
		double[][] m2 = matrix.generateDoubleMatrix(m2RowNum, m2ColNum);
		List<Long> doubleTimes = matrix.runDoubleMatrix(m1, m2);
		
		int[][] m3 = matrix.generateIntMatrix(m1RowNum, m1ColNum);
		int[][] m4 = matrix.generateIntMatrix(m2RowNum, m2ColNum);
		List<Long> intTimes = matrix.runIntMatrix(m3, m4);
		
		matrix.createTable(doubleTimes, "Double");
		matrix.createTable(intTimes, "Integer");
	}
	
	public void createTable(List<Long> runtimes, String title) {
		
		int length = runtimes.size();
		Object[][] rowData = new Object[length + 1][2];
		long total = 0;
		for(Long l : runtimes)
			total += l;
		double avg = total/length;
		System.out.println(title + ": " + avg);
		
		for(int i = 0; i < length; i++) {
			rowData[i][0] = i+1;
			rowData[i][1] = runtimes.get(i);				
		}
		
		rowData[length][0] = "Avg";
		rowData[length][1] = avg;
				
		String[] columnNames = {"Trial", "Runtime (ms)"};
	    JTable table = new JTable(rowData, columnNames);
	    JFrame f = new JFrame();
	    f.setSize(300, 300);
	    f.add(new JScrollPane(table));
	    f.setTitle(title);
	    f.setVisible(true);
	}
	
	public List<Long> runDoubleMatrix(double[][] m1, double[][] m2){
		
		List<Long> doubleRuntimes = new ArrayList<Long>();
		long startTime = 0;
		long endTime = 0;
		for(int i = 0; i < 10; i++) {
			startTime = System.currentTimeMillis();
			multiplyDouble(m1, m2);
			endTime = System.currentTimeMillis();
			doubleRuntimes.add(endTime - startTime);
		}
		return doubleRuntimes;
	}
	
	public List<Long> runIntMatrix(int[][] m1, int[][] m2){
			
			List<Long> runtimes = new ArrayList<Long>();
			long startTime = 0;
			long endTime = 0;
			for(int i = 0; i < 10; i++) {
				startTime = System.currentTimeMillis();
				multiplyInt(m1, m2);
				endTime = System.currentTimeMillis();
				runtimes.add(endTime - startTime);
			}
			return runtimes;
		}
	
	protected double[][] generateDoubleMatrix(int rows, int columns) {
		
		double[][] m = new double[rows][columns];
		Random randomDouble = new Random();
		for(int i = 0; i < rows; i++)
			for(int j = 0; j < columns; j++)
				m[i][j] = randomDouble.nextDouble();
		return m;
	}
	
	protected int[][] generateIntMatrix(int rows, int columns) {
			
			int[][] m = new int[rows][columns];
			Random randomInt = new Random();
			for(int i = 0; i < rows; i++)
				for(int j = 0; j < columns; j++)
					m[i][j] = randomInt.nextInt();
			return m;
		}
	
	public static double[][] multiplyDouble(double m1[][], double m2[][]) {
		
		int m1Rows = m1.length;
        int m1Columns = m1[0].length;
        int m2Rows = m2.length;
        int m2Columns = m2[0].length;
        double[][] result = new double[m1Rows][m2Columns];
        
        for(int i = 0; i < m1Rows; i++) {         // rows from m1
            for(int j = 0; j < m2Columns; j++) {     // columns from m2
                for(int k = 0; k < m1Columns; k++) { // columns from m1
                    result[i][j] += m1[i][k] * m2[k][j];
                }
            }
        }
        return result;
	}
	
	public static int[][] multiplyInt(int m1[][], int m2[][]) {
			
			int m1Rows = m1.length;
	        int m1Columns = m1[0].length;
	        int m2Rows = m2.length;
	        int m2Columns = m2[0].length;
	        int[][] result = new int[m1Rows][m2Columns];
	        
	        for(int i = 0; i < m1Rows; i++) {         // rows from m1
	            for(int j = 0; j < m2Columns; j++) {     // columns from m2
	                for(int k = 0; k < m1Columns; k++) { // columns from m1
	                    result[i][j] += m1[i][k] * m2[k][j];
	                }
	            }
	        }
	        return result;
		}
	
}