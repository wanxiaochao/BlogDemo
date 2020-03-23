package com.dimple.test.util.ceshi;

import lombok.Data;
import org.springframework.data.annotation.Transient;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.List;

@Data
public class WpAnswerQuestion implements Serializable {
    private static final long serialVersionUID = 8937651990625742027L;

    private String id;
    private String uid;
    @NotBlank(message = "问题id不可为空")
    private String questionId;//问题id
    private String answerQuestionId = "0";//上一级回答id
    @NotBlank(message = "回答内容不可为空")
    private String content;//回答内容
    private String pictureUrl;
    private String videoUrl;//视频地址
    private Integer isDel = 0;//是否删除 1删除 0未删除
    private Integer isAnonymous = 0;//是否匿名 0 不匿名 1匿名
    private Integer isApprove = 0;//审核状态 0 待审核 1 审核通过 2 审核不通过
    private Integer isBest = 0;//1精选 0普通
    @Transient
    private List<WpAnswerQuestion> answerQuestion;
    private Long createTime;
    private Long updateTime;

    public WpAnswerQuestion() {
    }

    public WpAnswerQuestion(String id, String questionId, String answerQuestionId,String content) {
        this.id = id;
        this.questionId = questionId;
        this.answerQuestionId = answerQuestionId;
        this.content = content;
    }
}
