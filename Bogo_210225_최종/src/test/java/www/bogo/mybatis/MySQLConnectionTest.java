package www.bogo.mybatis;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:/spring/root-context.xml"})
public class MySQLConnectionTest {

	@Inject
	private DataSource ds;
	
	@Test
	public void testConnection() throws Exception{
		
		try(Connection con = ds.getConnection()){
			System.out.println("\n >>>>>>>>>>>> Connection 출력 :" + con +"\n");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
