package core.control;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.Calendar;
import java.util.Date;

import core.model.student;

/**
 *
 * @author Hario
 */
public class controlStudent{
   private student model;
   private int AverageMark;
   

   public controlStudent(student student){
      this.model = student;
   }

   public void setStudentName(String name){
      model.setName(name);		
   }

   public String getStudentName(){
      return model.getName();		
   }

    /**
    * Date
     * @return 
    */
   public String getStudentDob() {
      return model.getdob();
   }
   
   public void setStudentDob(String StudentDob) {
      model.setDob(StudentDob);
   }
   
   public int getStudentRollNo(){
	      return model.getRollNo();		
	   }
   
   public void setStudentRollNo(int rollNo){
	      model.setRollNo(rollNo);		
	   }
	   
   /**
    *  Mark
     * @return 
    */
   public int getStudentMarkInPhysics() {
      return model.getMarkInPhysics();
   }
   
   public void setStudentMarkInPhysics(int StudentMark1) {
      model.setMarkInPhysics(StudentMark1);
   }
   
   public int getStudentInChemistry() {
      return model.getMarkInChemistry();
   }
   
   public void setStudentMarkInChemistry(int StudentMark2) {
      model.setMarkInCHemistry(StudentMark2);
       
   }
   
   public int getStudentMarkInMath() {
      return model.getMarkInMath();
   }
   
   public void setStudentMarkInMath(int StudentMark3) {
      model.setMarkInMath(StudentMark3);
   }
   
   public int getStudentAverageMark(){
       AverageMark = model.getMarkInPhysics() + model.getMarkInChemistry() + model.getMarkInMath();
       AverageMark = AverageMark / 3;
       return AverageMark;
   }
   
   public int getStudentTotalMark(){
       return model.getMarkInPhysics() + model.getMarkInChemistry() + model.getMarkInMath();
   }
   
   public int getStudentAge() throws ParseException{
       LocalDate today = LocalDate.now();  
       Calendar cal = Calendar.getInstance();
       Date date = new SimpleDateFormat("yyyy-MM-dd").parse(model.getdob());
       cal.setTime(date);
       int year = cal.get(Calendar.YEAR);
       int month = cal.get(Calendar.MONTH);
       int day = cal.get(Calendar.DAY_OF_MONTH);
       LocalDate DoB = LocalDate.of(year, month, day); 
       Period p = Period.between(DoB, today);
       return p.getYears();
   }
   
  
   
   

}
