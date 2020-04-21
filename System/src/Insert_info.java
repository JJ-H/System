import java.sql.*;
import java.text.DecimalFormat;
public class Insert_info {
	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://127.0.0.1/database","root","123456");
			PreparedStatement sql = null;
			Double area = null;
			String hx = null;
			String add = null;
			Double price = null;
			String date = null;
			String desc = null;
			int j = 1000;
			DecimalFormat df=new DecimalFormat("#.0");
			String[] city = {"深圳","广州","东莞","香港","澳门","北京","杭州","南昌","上海","成都"};
			String[] huxing = {"一室一厅","两室一厅","三室两厅","四室两厅","复式楼","单身公寓"};
			String[] brand = {"万科","碧桂园","恒大","保利","绿地","万达","中海","融创"};
			String[] style1 = {"高层景观房","超大阳台房","朝阳房","优质绿化房","邻近地铁房","交通便利房","学区房","优质风景房","海景房","江景房"};
			System.out.println("正在插入数据...");
			for(int i=1601;i<2000;i++) {
				j+=1;
				area = Math.random()*150+100;
				hx = huxing[(int)(Math.random()*huxing.length)];
				add = city[(int)(Math.random()*city.length)];
				price = Math.random()*100+100;
				date = (int)(Math.random()*25)+1995+"-"+(int)(Math.random()*13)+"-"+(int)(Math.random()*29);
				desc = add+brand[(int)(Math.random()*brand.length)]+style1[(int)(Math.random()*style1.length)];
				String SQL = "INSERT INTO house VALUES(?,?,?,?,?,?,?,?)";
				sql = connect.prepareStatement(SQL);
				sql.setInt(1, j);
				sql.setInt(2, i);
				sql.setDouble(3, Double.parseDouble(df.format(area)));
				sql.setString(4, hx);
				sql.setString(5, add);
				sql.setDouble(6, Double.parseDouble(df.format(price)));
				sql.setString(7, date);
				sql.setString(8, desc);
				sql.execute();
			}
				connect.close();
				System.out.println("插入完成!!!");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
