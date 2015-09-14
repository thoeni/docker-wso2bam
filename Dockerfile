#
# WSO2 ESB 4.8.1 on CentOS Linux with Oracle JDK 1.7.0_80
#

FROM	thoeni/centos-oracle-java:1.7.0_80

MAINTAINER Antonio Troina, thoeni@gmail.com

ENV WSO2_SOFT_VER=2.5.0
ENV WSO2_PRODUCT=wso2bam
ENV WSO2_PRODUCT_DESCRIPTION=business-activity-monitor

# copy zip from local folder to container
RUN     wget -P /opt --user-agent="testuser" --referer="http://connect.wso2.com/wso2/getform/reg/new_product_download" http://product-dist.wso2.com/products/${WSO2_PRODUCT_DESCRIPTION}/${WSO2_SOFT_VER}/${WSO2_PRODUCT}-${WSO2_SOFT_VER}.zip && \
	yum update -y && \
	yum install -y unzip && \
        unzip /opt/${WSO2_PRODUCT}-${WSO2_SOFT_VER}.zip -d /opt && \
	mv /opt/${WSO2_PRODUCT}-${WSO2_SOFT_VER} /opt/wso2esb && \
        rm /opt/${WSO2_PRODUCT}-${WSO2_SOFT_VER}.zip

EXPOSE 9443
EXPOSE 9763
EXPOSE 8243
EXPOSE 8280

CMD ["/opt/wso2bam/bin/wso2server.sh"]	
