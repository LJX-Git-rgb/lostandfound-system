package team.system.lostandfoundserver.domain;

import lombok.Data;

import java.util.Date;

@Data
public class FindGoods {

  private Integer id;
  private String title;
  private String desc;
  private String image;
  private String tag;
  private String state;
  private Date createTime;
  private Date foundTime;
  private Date foundArea;
  private Integer uid;
}
