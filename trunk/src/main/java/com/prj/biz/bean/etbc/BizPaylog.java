package com.prj.biz.bean.etbc;

import com.prj.biz.bean._base.BaseEntity;
import java.math.BigDecimal;
import java.util.Date;

/** 
 * 描述: 支付记录 实体类<br>
 * @author 1936
 * @date 2016-03-23
 * 
 */
public class BizPaylog extends BaseEntity  
{

    private static final long	serialVersionUID	= 1L;

    // 
    private BigDecimal id;
    // 
    private Date createdate;
    // 
    private Date lastupdatedate;
    // 
    private String ownership;
    // 
    private BigDecimal version;
    // 
    private String biids;
    // 
    private BigDecimal payamount;
    // 
    private String payrecordid;
    // 
    private String payresult;
    // 
    private String transactionid;
    // 
    private String userno;
    // 
    private BigDecimal channeluserId;
    // 
    private BigDecimal paystatusId;
    // 
    private BigDecimal serviceaccountId;
    // 
    private String serviceAccountName;
    // 
    private String orgno;
    // 
    private String transactiontype;


    public BigDecimal getId() {
        return id;
    }
    public void setId(BigDecimal id) {
        this.id = id;
    }

    public Date getCreatedate() {
        return createdate;
    }
    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getLastupdatedate() {
        return lastupdatedate;
    }
    public void setLastupdatedate(Date lastupdatedate) {
        this.lastupdatedate = lastupdatedate;
    }


    public String getOwnership() {
        return ownership;
    }
    public void setOwnership(String ownership) {
        this.ownership = ownership;
    }


    public BigDecimal getVersion() {
        return version;
    }
    public void setVersion(BigDecimal version) {
        this.version = version;
    }


    public String getBiids() {
        return biids;
    }
    public void setBiids(String biids) {
        this.biids = biids;
    }


    public BigDecimal getPayamount() {
        return payamount;
    }
    public void setPayamount(BigDecimal payamount) {
        this.payamount = payamount;
    }


    public String getPayrecordid() {
        return payrecordid;
    }
    public void setPayrecordid(String payrecordid) {
        this.payrecordid = payrecordid;
    }


    public String getPayresult() {
        return payresult;
    }
    public void setPayresult(String payresult) {
        this.payresult = payresult;
    }


    public String getTransactionid() {
        return transactionid;
    }
    public void setTransactionid(String transactionid) {
        this.transactionid = transactionid;
    }


    public String getUserno() {
        return userno;
    }
    public void setUserno(String userno) {
        this.userno = userno;
    }


    public BigDecimal getChanneluserId() {
        return channeluserId;
    }
    public void setChanneluserId(BigDecimal channeluserId) {
        this.channeluserId = channeluserId;
    }


    public BigDecimal getPaystatusId() {
        return paystatusId;
    }
    public void setPaystatusId(BigDecimal paystatusId) {
        this.paystatusId = paystatusId;
    }


    public BigDecimal getServiceaccountId() {
        return serviceaccountId;
    }
    public void setServiceaccountId(BigDecimal serviceaccountId) {
        this.serviceaccountId = serviceaccountId;
    }


    public String getOrgno() {
        return orgno;
    }
    public void setOrgno(String orgno) {
        this.orgno = orgno;
    }


    public String getTransactiontype() {
        return transactiontype;
    }
    public void setTransactiontype(String transactiontype) {
        this.transactiontype = transactiontype;
    }
    
	public String getServiceAccountName() {
		return serviceAccountName;
	}
	public void setServiceAccountName(String serviceAccountName) {
		this.serviceAccountName = serviceAccountName;
	}
	
	@Override
	public String toString() {
		return "BizPaylog [id=" + id + ", createdate=" + createdate + ", lastupdatedate=" + lastupdatedate
				+ ", ownership=" + ownership + ", version=" + version + ", biids=" + biids + ", payamount=" + payamount
				+ ", payrecordid=" + payrecordid + ", payresult=" + payresult + ", transactionid=" + transactionid
				+ ", userno=" + userno + ", channeluserId=" + channeluserId + ", paystatusId=" + paystatusId
				+ ", serviceaccountId=" + serviceaccountId + ", serviceAccountName=" + serviceAccountName + ", orgno="
				+ orgno + ", transactiontype=" + transactiontype + "]";
	}

    
}
