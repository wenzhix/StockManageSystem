package com.xiaowen.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.xiaowen.model.GoodsType;
import com.xiaowen.model.PageBean;
import com.xiaowen.util.StringUtil;
/**
 * GoodsTypeDao的Dao数据层
 * @author xiaowen
 * 2016年12月11日
 */
public class GoodsTypeDao {

	/**
	 * 查询
	 * @param con
	 * @param pageBean
	 * @param goodsType
	 * @return
	 * @throws Exception
	 */
	public ResultSet goodsTypeList(Connection con,PageBean pageBean,GoodsType goodsType) throws Exception{
		StringBuffer sb = new StringBuffer("select * from t_goodsType");
		if(goodsType!=null && StringUtil.isNotEmpty(goodsType.getTypeName())){
			sb.append(" and typeName like '%"+goodsType.getTypeName()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt = con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}
	
	/**
	 * 查询记录数
	 * @param con
	 * @param goodsType
	 * @return
	 * @throws Exception
	 */
	public int goodsTypeCount(Connection con,GoodsType goodsType) throws Exception{
		StringBuffer sb = new StringBuffer("select count(*) as total from t_goodsType");
		if(goodsType!=null && StringUtil.isNotEmpty(goodsType.getTypeName())){
			sb.append(" and typeName like '%"+goodsType.getTypeName()+"%'");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
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
	public int goodsTypeDelete(Connection con,String delIds) throws Exception{
		String sql = "delete from t_goodsType where id in ("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	/**
	 * 新增
	 * @param con
	 * @param goodsType
	 * @return
	 * @throws Exception
	 */
	public int goodsTypeSave(Connection con,GoodsType goodsType) throws Exception{
		String sql = "insert into t_goodsType value(null,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1,goodsType.getTypeName());
		pstmt.setString(2, goodsType.getTypeDesc());
		return pstmt.executeUpdate();
	}
	
	/**
	 * 修改
	 * @param con
	 * @param goodsType
	 * @return
	 * @throws Exception
	 */
	public int goodsTypeModify(Connection con ,GoodsType goodsType) throws Exception{
		String sql = "update t_goodsType set id=?,typeName=?,typeDesc=? where id=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1,goodsType.getId());
		pstmt.setString(2, goodsType.getTypeName());
		pstmt.setString(3, goodsType.getTypeDesc());
		pstmt.setInt(4, goodsType.getId());
		return pstmt.executeUpdate();
	}
}
