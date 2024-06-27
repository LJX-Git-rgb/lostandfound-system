package team.system.lostandfoundserver.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author JasonLiu
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Goods {
  protected Integer id;
  protected String title;
  protected String description;
  protected String image;
  protected String tag;
  protected Integer state;
  @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
  protected Date createTime;
  protected Integer uid;
  protected String[] imageList;
}
