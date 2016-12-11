package com.xiaowen.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.xiaowen.model.Goods;
import com.xiaowen.model.PageBean;
import com.xiaowen.model.Stock;
import com.xiaowen.util.StringUtil;
/**
 * StockDao的Dao数据层
 * @author xiaowen
 * 2016年12月11日
 */
public class StockDao {

	/**
	 * 查询
	 * @param con
	 * @param pageBean
	 * @param goods
	 * @param s_bimpoPrice
	 * @param s_eimpoPrice
	 * @param s_bexpoPrice
	 * @param s_eexpoPrice
	 * @return
	 * @throws Exception
	 */
	public ResultSet stockList(Connection con,PageBean pageBean,Goods goods,String s_bimpoPrice,String s_eimpoPrice,String s_bexpoPrice,String s_eexpoPrice)throws Exception{
		StringBuffer sb = new StringBuffer("select * from t_goods t1, t_stock t2 where t1.id=t2.goodsId");
		if(StringUtil.isNotEmpty(goods.getGoodsName())){
			sb.append(" and t1.goodsName like '%"+goods.getGoodsName()+"%'");
		}
		if(StringUtil.isNotEmpty(s_bimpoPrice)){
			sb.append(" and impoPrice >="+s_bimpoPrice+"");
		}
		if(StringUtil.isNotEmpty(s_eimpoPrice)){
			sb.append(" and impoPrice <="+s_eimpoPrice+"");
		}
		if(StringUtil.isNotEmpty(s_bexpoPrice)){
			sb.append(" and expoPrice >="+s_bexpoPrice+"");
		}
		if(StringUtil.isNotEmpty(s_eexpoPrice)){
			sb.append(" and expoPrice <="+s_eexpoPrice+"");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt = con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}
	
	/**
	 * 获取总是
	 * @param con
	 * @param goods
	 * @param s_bimpoPrice
	 * @param s_eimpoPrice
	 * @param s_bexpoPrice
	 * @param s_eexpoPrice
	 * @return
	 * @throws Exception
	 */
	public int stockCount(Connection con,Goods goods,String s_bimpoPrice,String s_eimpoPrice,String s_bexpoPrice,String s_eexpoPrice) throws Exception{
		StringBuffer sb = new StringBuffer("select count(*) as total from t_goods t1, t_stock t2 where t1.id=t2.goodsId");
		if(StringUtil.isNotEmpty(goods.getGoodsName())){
			sb.append(" and t1.goodsName like '%"+goods.getGoodsName()+"%'");
		}
		if(StringUtil.isNotEmpty(s_bimpoPrice)){
			sb.append(" and impoPrice >="+s_bimpoPrice+"");
		}
		if(StringUtil.isNotEmpty(s_eimpoPrice)){
			sb.append(" and impoPrice <="+s_eimpoPrice+"");
		}
		if(StringUtil.isNotEmpty(s_bexpoPrice)){
			sb.append(" and expoPrice >="+s_bexpoPrice+"");
		}
		if(StringUtil.isNotEmpty(s_eexpoPrice)){
			sb.append(" and expoPrice <="+s_eexpoPrice+"");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	/**
	 * 删除
	 * @param con
	 * @param delIds
	 * @return
	 * @throws Exception
	 */
	public int stockDelete(Connection con,String delIds) throws Exception{
		String sql = "delete from t_stock where id in ("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	/**
	 * 添加
	 * @param con
	 * @param stock
	 * @return
	 * @throws Exception
	 */
	public int stockSave(Connection con,Stock stock) throws Exception{
		String sql = "insert into t_stock value(null,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1,stock.getGoodsId());
		pstmt.setString(2, stock.getStockNum());
		pstmt.setString(3, stock.getImpoPrice());
		pstmt.setString(4, stock.getExpoPrice());
		pstmt.setString(5, stock.getStockDesc());
		return pstmt.executeUpdate();
	}
	
	/**
	 * 修改
	 * @param con
	 * @param stock
	 * @return
	 * @throws Exception
	 */
	public int stockModify(Connection con ,Stock stock) throws Exception{
		String sql = "update t_stock set goodsId=?,stockNum=?,impoPrice=?,expoPrice=?,stockDesc=? where id=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1,stock.getGoodsId());
		pstmt.setString(2, stock.getStockNum());
		pstmt.setString(3, stock.getImpoPrice());
		pstmt.setString(4, stock.getExpoPrice());
		pstmt.setString(5, stock.getStockDesc());
		pstmt.setInt(6, stock.getId());
		return pstmt.executeUpdate();
	}
	
	/**
	 * 查询id
	 * @param con
	 * @param delIds
	 * @return
	 * @throws Exception
	 */
	public boolean getGoodsByStockId(Connection con,String delIds) throws Exception{
		String sql = "select * from t_stock where goodsId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, delIds);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return true;
		}else{
			return false;
		}
	}
}
