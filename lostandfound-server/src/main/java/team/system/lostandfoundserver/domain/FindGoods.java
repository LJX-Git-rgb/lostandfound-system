package team.system.lostandfoundserver.domain;

import lombok.Data;

import java.util.Date;

@Data
public class FindGoods {

  private Integer id;
  private String title;
  private String description;
  private String image;
  private String tag;
  private Integer state;
  private Date createTime;
  private Date foundTime;
  private String foundArea;
  private Integer uid;
}
