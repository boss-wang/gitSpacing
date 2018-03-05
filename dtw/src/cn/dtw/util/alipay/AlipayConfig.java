package cn.dtw.util.alipay;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016091200496571";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC1RR2HHus5rclyuutEaG6fc96xPwcKzaaAOygNwjs9gm7jPLkNS0WokcYUmC2AjcQnyslFZBQrGf4cuj+DbhojT+D6bJOIVDh+6LfngQX4zv3D2vTeOZLzQj8lZ9cDeuYrBXixGIFFzLWOmFujP9/GB4S3NSqpQgoYRnzfzUcMM9YacaLmHJjt8L2aGipM0ZarjiwobwjNnD/RHlgZa75ZM9SlOonV445CSleU4F3FMPqbhEtdxxKS8B7fqNFAKXlyYXSDQeELoXoRwI1O/fNjNOVTUaZC8LeV7gDccElBLzd0Szv4v779OMAO3VPMAxaK6RQPCJgDpDbJsW37bzYlAgMBAAECggEBAJJn1EWCD3JyjrX/im2h+1cF+uMliMaM+uGu5dbW/Yncgzs9nCjElupjcpzHnFisJ7YL7ywAfNmjEL6bHxlEIBBNP+SDNVVy0H6P75kneG9Qn11Ex2mFDs8yvlWz3NGOvcAZlzVSGXcKs8kL/VeJC2+iOurOIjq6f/TDWbBY1/1dr/LhIzNYGfHdDgL2utR84dFJzbbQF6n1+cLOLQTcHAbCkVcdnedObcYHrgV/MTn/j0Dj4GnDbJXiLZfd+Ax+rEc276GtJxLL1GOpWFQcnGcJwddeMnh4tEM0LXSeYWCqNajYFLNnSHhyCWP3WeE7gKzvATiabTwgkTZ/JK/eDzECgYEA/cT0t07ylZt4oL5BMoMpl41fls7G6PbeLlvF5Jw5rQWghOArSWUWkzo8KLUo+unpkE5MwS0FNMm6dsk72TNYSbtXpn8pmBHOoS6oA6uNXccBZMb7SUZBQCqrh4P5B7JfoWH+ag6Qeh8D+BuxuFkJ5vLwoPkcXKt13GsD9QjuW4sCgYEAtt0Ej7dM7O4IJCHzyqOQ8eAB0pNz3Ch4NnF+/QV6zYGf7Kd8OG1WE9SM6mxuIXGDTZcy2hRqtAM2rzdanENDAxNb857u3NCkZwWA1GbsGnouZAIOFEr2K8c59XGOzzEBlVJTVPvKCMM57/xMQO2oBaGHXT8SkNvghO9Dxa02qw8CgYA8WfThC3OBxQHBKL4Up0Di/Ao5sV941A0u9UBxB/5neakdMLrar6HYzca037CpS6vyV8zFPFG6pickTONg2mcq0dUcka1wrvt3NcNbbBcosEVSlEf6uyyVeBBnICm/fNplZQq+akxN3sZw4RU5BGPoeupjPhtSpqxXCVRdmAwn1QKBgCYZChg/IkHCneOZR0eSqGIcP4T1v4/AxrrhDon8mEc0mHMfuduvu91JzUoR6SgClE6YD7orwsdaXAxJRhGEWfPMFr49AJr0xSvJk7us7cfeaMfhPbmwnHUmfsbKL+yu0xufGUl9Y+xLcEi1kdV9LiJuMtuUhnOzu6U2jDIlEly1AoGACowQ2H2v5UjbdcJnq3R5RS06U6gCJmZXWYhZMiXMzVH1XA05a2Uv/bn8OR4qgPDPbjiUgEYh0cCsOHqxIzQ2tsgerFAj6USnX1P2Rq0VsYCD699KfFCKBGwRxGLx0qRcHtnEZqCmot6tztcTGkTD22dZS4VLXg9xP+GCsVEpSMY=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsdFEcOyRfeYiWTm4KNge0fO+1Zfpa30ZEUAsDv9FJysAzugJ7OYexc3NsOz5plIvJTD1NQBcp1rxzHvPmiag7ZobUZZoxVRDAVY7s6yHE8+/0TLkg/kaUiOhG45bKOCzb2UkYD+FtUKuuUJA8lw16MsI7ttZ8p2WwQKWV1iz7teyYs8PocomMYC8kiyiO/116guPZECZpCmt00+fQ9ffjm1gz1LnSodJm/+oeXHXmCbv20cY3kodPu+bFSUicMhHkZfADoJor65zh+XAwTNq7ej5HDkP6RBw71EQeHHjZYJenL02LVd5MzqaldOBcNRwBQ8wbq/09sNYntOQt/kyVwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/dtw/alipay/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/dtw/alipay/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

