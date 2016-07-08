package com.prj.biz.bean.tenant;

import java.math.BigDecimal;
import java.util.Date;
import com.prj.biz.bean._base.BaseEntity;

/** 
 * 描述: 租户实体类 实体类<br>
 * @author 1936
 * @date 2016-04-07
 * 
 */
public class Tenant extends BaseEntity  
{

    private static final long	serialVersionUID	= 1L;

    // 主键
    private String id;
    // 版本号
    private BigDecimal version;
    // 
    private Date createdate;
    // 最后更新时间
    private Date lastupdatedate;
    // 企业名称
    private String description;
    // 租户类型
    private String tenanttypeCode;
    // 
    private String tenanttypeDesc;
    // 租户状态
    private String tenantstatusCode;
    // 
    private String tenantstatusDesc;
    // 营业年限
    private String businessdurationCode;
    // 
    private String businessdurationDesc;
    // 企业规模
    private String enterprisescaleCode;
    // 
    private String enterprisescaleDesc;
    // 所属行业 外键  正式用户必填
    private String industryCode;
    // 
    private String industryDesc;
    // 主营业务
    private String mainbusiness;
    // 网址
    private String website;
    // 国家地区
    private String countryId;
    // 
    private String countryName;
    // 所在地区
    private String provinceId;
    // 
    private String provinceName;
    // 所在市
    private String cityId;
    // 
    private String cityName;
    // 街道地址
    private String street;
    // 手机或座机
    private String telephone;
    // 传真
    private String fax;


    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }


    public BigDecimal getVersion() {
        return version;
    }
    public void setVersion(BigDecimal version) {
        this.version = version;
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


    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }


    public String getTenanttypeCode() {
        return tenanttypeCode;
    }
    public void setTenanttypeCode(String tenanttypeCode) {
        this.tenanttypeCode = tenanttypeCode;
    }


    public String getTenanttypeDesc() {
        return tenanttypeDesc;
    }
    public void setTenanttypeDesc(String tenanttypeDesc) {
        this.tenanttypeDesc = tenanttypeDesc;
    }


    public String getTenantstatusCode() {
        return tenantstatusCode;
    }
    public void setTenantstatusCode(String tenantstatusCode) {
        this.tenantstatusCode = tenantstatusCode;
    }


    public String getTenantstatusDesc() {
        return tenantstatusDesc;
    }
    public void setTenantstatusDesc(String tenantstatusDesc) {
        this.tenantstatusDesc = tenantstatusDesc;
    }


    public String getBusinessdurationCode() {
        return businessdurationCode;
    }
    public void setBusinessdurationCode(String businessdurationCode) {
        this.businessdurationCode = businessdurationCode;
    }


    public String getBusinessdurationDesc() {
        return businessdurationDesc;
    }
    public void setBusinessdurationDesc(String businessdurationDesc) {
        this.businessdurationDesc = businessdurationDesc;
    }


    public String getEnterprisescaleCode() {
        return enterprisescaleCode;
    }
    public void setEnterprisescaleCode(String enterprisescaleCode) {
        this.enterprisescaleCode = enterprisescaleCode;
    }


    public String getEnterprisescaleDesc() {
        return enterprisescaleDesc;
    }
    public void setEnterprisescaleDesc(String enterprisescaleDesc) {
        this.enterprisescaleDesc = enterprisescaleDesc;
    }


    public String getIndustryCode() {
        return industryCode;
    }
    public void setIndustryCode(String industryCode) {
        this.industryCode = industryCode;
    }


    public String getIndustryDesc() {
        return industryDesc;
    }
    public void setIndustryDesc(String industryDesc) {
        this.industryDesc = industryDesc;
    }


    public String getMainbusiness() {
        return mainbusiness;
    }
    public void setMainbusiness(String mainbusiness) {
        this.mainbusiness = mainbusiness;
    }


    public String getWebsite() {
        return website;
    }
    public void setWebsite(String website) {
        this.website = website;
    }


    public String getCountryId() {
        return countryId;
    }
    public void setCountryId(String countryId) {
        this.countryId = countryId;
    }


    public String getCountryName() {
        return countryName;
    }
    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }


    public String getProvinceId() {
        return provinceId;
    }
    public void setProvinceId(String provinceId) {
        this.provinceId = provinceId;
    }


    public String getProvinceName() {
        return provinceName;
    }
    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }


    public String getCityId() {
        return cityId;
    }
    public void setCityId(String cityId) {
        this.cityId = cityId;
    }


    public String getCityName() {
        return cityName;
    }
    public void setCityName(String cityName) {
        this.cityName = cityName;
    }


    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }


    public String getTelephone() {
        return telephone;
    }
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }


    public String getFax() {
        return fax;
    }
    public void setFax(String fax) {
        this.fax = fax;
    }
    
	@Override
	public String toString() {
		return "Tenant [id=" + id + ", version=" + version + ", createdate=" + createdate + ", lastupdatedate="
				+ lastupdatedate + ", description=" + description + ", tenanttypeCode=" + tenanttypeCode
				+ ", tenanttypeDesc=" + tenanttypeDesc + ", tenantstatusCode=" + tenantstatusCode
				+ ", tenantstatusDesc=" + tenantstatusDesc + ", businessdurationCode=" + businessdurationCode
				+ ", businessdurationDesc=" + businessdurationDesc + ", enterprisescaleCode=" + enterprisescaleCode
				+ ", enterprisescaleDesc=" + enterprisescaleDesc + ", industryCode=" + industryCode + ", industryDesc="
				+ industryDesc + ", mainbusiness=" + mainbusiness + ", website=" + website + ", countryId=" + countryId
				+ ", countryName=" + countryName + ", provinceId=" + provinceId + ", provinceName=" + provinceName
				+ ", cityId=" + cityId + ", cityName=" + cityName + ", street=" + street + ", telephone=" + telephone
				+ ", fax=" + fax + "]";
	}
    
}
