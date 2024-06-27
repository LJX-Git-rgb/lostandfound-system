package team.system.lostandfoundserver.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

@EqualsAndHashCode(callSuper = true)
@Data
public class FindGoods extends Goods{
  @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
  private Date foundTime;
  private String foundArea;
}
