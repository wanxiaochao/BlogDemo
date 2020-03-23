package com.dimple.test.util.ceshi;

import java.util.ArrayList;
import java.util.List;

public class AnswerTree {

    private List<WpAnswerQuestion> answerList = new ArrayList<WpAnswerQuestion>();

    public AnswerTree(List<WpAnswerQuestion> answerList) {
        this.answerList = answerList;
    }

    //建立树形结构
    public List<WpAnswerQuestion> buildTree() {
        List<WpAnswerQuestion> treeMenus = new ArrayList<WpAnswerQuestion>();
        List<WpAnswerQuestion> rootNode = getRootNode();
        for (WpAnswerQuestion answerNode : rootNode) {
            answerNode = buildChildTree(answerNode);
            treeMenus.add(answerNode);
        }
        return treeMenus;
    }

    //递归，建立子树形结构
    private WpAnswerQuestion buildChildTree(WpAnswerQuestion pNode) {
        List<WpAnswerQuestion> childMenus = new ArrayList<WpAnswerQuestion>();
        for (WpAnswerQuestion menuNode : answerList) {
            if (menuNode.getAnswerQuestionId().equals(pNode.getId())) {
                childMenus.add(buildChildTree(menuNode));
            }
        }
        pNode.setAnswerQuestion(childMenus);
        return pNode;
    }

    //获取根节点
    private List<WpAnswerQuestion> getRootNode() {
        List<WpAnswerQuestion> rootMenuLists = new ArrayList<WpAnswerQuestion>();
        for (WpAnswerQuestion answerNode : answerList) {
            if (answerNode.getAnswerQuestionId().equals("0")) {
                rootMenuLists.add(answerNode);
            }
        }
        return rootMenuLists;
    }

}
