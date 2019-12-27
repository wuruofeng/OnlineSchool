package org.action;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.dao.*;
import org.vo.*;

import java.util.ArrayList;
import java.util.List;

public class TermAction extends Action{
    private PureTerm pureTerm;
    private JSONObject jsonObj;
    private JSONArray jsonArray;
    private int page;
    private int rows;

    public TermAction() {
    }

    public TermAction(PureTerm pureTerm, JSONObject jsonObj, JSONArray jsonArray, int page, int rows) {
        this.pureTerm = pureTerm;
        this.jsonObj = jsonObj;
        this.jsonArray = jsonArray;
        this.page = page;
        this.rows = rows;
    }

    public PureTerm getPureTerm() {
        return pureTerm;
    }

    public void setPureTerm(PureTerm pureTerm) {
        this.pureTerm = pureTerm;
    }

    public JSONObject getJsonObj() {
        return jsonObj;
    }

    public void setJsonObj(JSONObject jsonObj) {
        this.jsonObj = jsonObj;
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public PureTerm parseTermToPureTerm(Term term){
        PureTerm pureTerm=new PureTerm();
        pureTerm.setId(term.getId());
        pureTerm.setTitle(term.getTitle());
        pureTerm.setCoverUrl(term.getCoverUrl());
        pureTerm.setCourseId(term.getCourseId());
        pureTerm.setDuration(term.getDuration());
        pureTerm.setExp(term.getExp());
        pureTerm.setIdx(term.getIdx());
        pureTerm.setTermDesc(term.getTermDesc());
        pureTerm.setUpdatedAtDay(term.getUpdatedAtDay());
        pureTerm.setUpdatedAtYearMonth(term.getUpdatedAtYearMonth());
        pureTerm.setVideoUrl(term.getVideoUrl());
        return pureTerm;
    }

    public Term parsePureTermToTerm(PureTerm pureTerm){
        Term term=new Term();
        term.setId(pureTerm.getId());
        term.setTitle(pureTerm.getTitle());
        term.setCoverUrl(pureTerm.getCoverUrl());
        term.setCourseId(pureTerm.getCourseId());
        term.setDuration(pureTerm.getDuration());
        term.setExp(pureTerm.getExp());
        term.setIdx(pureTerm.getIdx());
        term.setTermDesc(pureTerm.getTermDesc());
        term.setUpdatedAtDay(pureTerm.getUpdatedAtDay());
        term.setUpdatedAtYearMonth(pureTerm.getUpdatedAtYearMonth());
        term.setVideoUrl(pureTerm.getVideoUrl());
        return term;
    }

    public String queryTermByPage() {
        List<Term> termList = TermDAO.queryByPage(getMap(page,rows));
        ArrayList<PureTerm> pureTermList=new ArrayList<PureTerm>();
        for(Term term:termList){
            pureTermList.add(parseTermToPureTerm(term));
        }
        jsonObj = getJSONObject(TermDAO.queryNum(), pureTermList);
        return "success";
    }

    public String queryTermByTermId(){
        Term term=new Term();
        term.setId(pureTerm.getId());
        term=TermDAO.queryByTermId(term);
        if(term==null){
            jsonObj = (JSONObject)JSONObject.fromObject(new PureTerm());
            return "fail";
        }
        jsonObj = (JSONObject)JSONObject.fromObject(parseTermToPureTerm(term));
        return "success";
    }

    public Term getFullTerm(){
        Chapter chapter=new Chapter();
        chapter.setId(1);
        chapter= ChapterDAO.queryByChapterId(chapter);
        Term term=parsePureTermToTerm(pureTerm);
        term.setChapterByChapterId(chapter);
        return term;
    }

    public String insertTerm(){
        Term term=getFullTerm();
        if(TermDAO.insertTerm(term)){
            jsonObj=success();
            return "success";
        }
        jsonObj=fail();
        return "fail";
    }

    public String updateTerm(){
        Term term=getFullTerm();
        Term termInDataBase=new Term();
        termInDataBase.setId(term.getId());
        termInDataBase=TermDAO.queryByTermId(termInDataBase);
        if(termInDataBase!=null){
            if(term.getVideoUrl()==null||term.getVideoUrl()==""){
                term.setVideoUrl(termInDataBase.getVideoUrl());
            }
            if(term.getCoverUrl()==null||term.getCoverUrl()==""){
                term.setCoverUrl(termInDataBase.getCoverUrl());
            }
        }
        if(TermDAO.updateByTermId(term)) {
            jsonObj = success();
            return "success";
        }
        jsonObj=fail();
        return "fail";
    }


    public String deleteTerm(){
        Term term=getFullTerm();
        term.setId(pureTerm.getId());
        if(TermDAO.deleteByTermId(term)){
            jsonObj = success();
            return "success";
        }
        jsonObj=fail();
        return "fail";
    }

    public String queryByTermTitle(){
        Term term=getFullTerm();
        List<Term> termList=TermDAO.queryByTitle(term);
        ArrayList<PureTerm> pureTermList=new ArrayList<PureTerm>();
        if(termList==null){
            jsonObj = getJSONObject(0, pureTermList);
            return "success";
        }
        for(Term tTerm:termList){
            pureTermList.add(parseTermToPureTerm(tTerm));
        }
        jsonObj = getJSONObject(termList.size(), pureTermList);
        return "success";
    }

    public String queryByTermTitleLikely(){
        Term term=getFullTerm();
        List<Term> termList=TermDAO.queryByTitleLikely(term);
        ArrayList<PureTerm> pureTermList=new ArrayList<PureTerm>();
        if(termList==null){
            jsonObj = getJSONObject(0, pureTermList);
            return "success";
        }
        for(Term tTerm:termList){
            pureTermList.add(parseTermToPureTerm(tTerm));
        }
        jsonObj = getJSONObject(termList.size(), pureTermList);
        return "success";
    }

}
