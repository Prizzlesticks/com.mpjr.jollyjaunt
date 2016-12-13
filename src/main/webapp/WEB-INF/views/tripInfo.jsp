<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Select Trip Information</title>
</head>
<!--View of form to input trip information, option to go to events page if selected  -->
<body>
<h1>Let's plan your trip!</h1>

<form name="form2" action="tripInfo" onsubmit="return validate()" method="get">

<br>Trip Name: <input type="text" name="title">
<br>
<br>Starting City:
<br>City<input type="text" name="cityStart">
<br>State<input type="text" name="stateStart">
<br>
<br>Ending City:
<br>City<input type="text" name="cityEnd">
<br>State<input type="text" name="stateEnd">
<br>
<br>Destination2:
<br>City<input type="text" name="cityEnd2">
<br>State<input type="text" name="stateEnd2">
<br>
<br>Destination3:
<br>City<input type="text" name="cityEnd3">
<br>State<input type="text" name="stateEnd3">
<br>
<br>Destination4:
<br>City<input type="text" name="cityEnd4">
<br>State<input type="text" name="stateEnd4">
<br>
<br>Destination5:
<br>City<input type="text" name="cityEnd5">
<br>State<input type="text" name="stateEnd5">
<br>
<br>Destination6:
<br>City<input type="text" name="cityEnd6">
<br>State<input type="text" name="stateEnd6">
<br>
<br>


Start Date : Year 
  <select id="year_start"   name="year_start">        
    <option value=2016>2016</option>       
    <option value=2017>2017</option>       
    <option value=2018>2018</option>    
  </select> / Month
 
  <select id="month_start"  name="month_start"> 
    <option value=01>1</option>       
    <option value=02>2</option>       
    <option value=03>3</option>       
    <option value=04>4</option>       
    <option value=05>5</option>       
    <option value=06>6</option>       
    <option value=07>7</option>       
    <option value=08>8</option>       
    <option value=09>9</option>       
    <option value=10>10</option>       
    <option value=11>11</option>       
    <option value=12>12</option>      
  </select> / Day
 
  <select id="day_start" name="day_start"> 
     <option value=01>1</option>       
    <option value=02>2</option>       
    <option value=03>3</option>       
    <option value=04>4</option>       
    <option value=05>5</option>       
    <option value=06>6</option>       
    <option value=07>7</option>       
    <option value=08>8</option>       
    <option value=09>9</option>       
    <option value=10>10</option>       
    <option value=11>11</option>       
    <option value=12>12</option>       
    <option value=13>13</option>       
    <option value=14>14</option>       
    <option value=15>15</option>       
    <option value=16>16</option>       
    <option value=17>17</option>       
    <option value=18>18</option>       
    <option value=19>19</option>       
    <option value=20>20</option>       
    <option value=21>21</option>       
    <option value=22>22</option>       
    <option value=23>23</option>       
    <option value=24>24</option>       
    <option value=25>25</option>       
    <option value=26>26</option>       
    <option value=27>27</option>       
    <option value=28>28</option>       
    <option value=29>29</option>       
    <option value=30>30</option>       
    <option value=31>31</option>       
  </select> (yyyy/mm/dd)
  
  
<br><br>
End Date: Year
  
  <select id="year_end"  name = "year_end">        
    <option value=2016>2016</option>       
    <option value=2017>2017</option>       
    <option value=2018>2018</option>       
  </select> 
  
  /Month
  <select id="month_end"  name="month_end"> 
   <option value=01>1</option>       
    <option value=02>2</option>       
    <option value=03>3</option>       
    <option value=04>4</option>       
    <option value=05>5</option>       
    <option value=06>6</option>       
    <option value=07>7</option>       
    <option value=08>8</option>       
    <option value=09>9</option>       
    <option value=10>10</option>       
    <option value=11>11</option>       
    <option value=12>12</option>    
  </select> /Day
  
  <select id="day_end" name="day_end" > 
    <option value=01>1</option>       
    <option value=02>2</option>       
    <option value=03>3</option>       
    <option value=04>4</option>       
    <option value=05>5</option>       
    <option value=06>6</option>       
    <option value=07>7</option>       
    <option value=08>8</option>       
    <option value=09>9</option>       
    <option value=10>10</option>       
    <option value=11>11</option>       
    <option value=12>12</option>       
    <option value=13>13</option>       
    <option value=14>14</option>       
    <option value=15>15</option>       
    <option value=16>16</option>       
    <option value=17>17</option>       
    <option value=18>18</option>       
    <option value=19>19</option>       
    <option value=20>20</option>       
    <option value=21>21</option>       
    <option value=22>22</option>       
    <option value=23>23</option>       
    <option value=24>24</option>       
    <option value=25>25</option>       
    <option value=26>26</option>       
    <option value=27>27</option>       
    <option value=28>28</option>       
    <option value=29>29</option>       
    <option value=30>30</option>       
    <option value=31>31</option>       
  </select> (yyyy/mm/dd)  
  
  <br><br>
  What date do you want to begin searching for events?
  <select id="year_arrive"   name="year_arrive">        
    <option value=2016>2016</option>       
    <option value=2017>2017</option>       
    <option value=2018>2018</option>    
  </select> / Month
 
  <select id="month_arrive"  name="month_arrive"> 
    <option value=01>1</option>       
    <option value=02>2</option>       
    <option value=03>3</option>       
    <option value=04>4</option>       
    <option value=05>5</option>       
    <option value=06>6</option>       
    <option value=07>7</option>       
    <option value=08>8</option>       
    <option value=09>9</option>       
    <option value=10>10</option>       
    <option value=11>11</option>       
    <option value=12>12</option>      
  </select> / Day
 
  <select id="day_arrive" name="day_arrive"> 
     <option value=01>1</option>       
    <option value=02>2</option>       
    <option value=03>3</option>       
    <option value=04>4</option>       
    <option value=05>5</option>       
    <option value=06>6</option>       
    <option value=07>7</option>       
    <option value=08>8</option>       
    <option value=09>9</option>       
    <option value=10>10</option>       
    <option value=11>11</option>       
    <option value=12>12</option>       
    <option value=13>13</option>       
    <option value=14>14</option>       
    <option value=15>15</option>       
    <option value=16>16</option>       
    <option value=17>17</option>       
    <option value=18>18</option>       
    <option value=19>19</option>       
    <option value=20>20</option>       
    <option value=21>21</option>       
    <option value=22>22</option>       
    <option value=23>23</option>       
    <option value=24>24</option>       
    <option value=25>25</option>       
    <option value=26>26</option>       
    <option value=27>27</option>       
    <option value=28>28</option>       
    <option value=29>29</option>       
    <option value=30>30</option>       
    <option value=31>31</option>       
  </select> (yyyy/mm/dd)
  
<!-- If yes is selected and submit pressed, goes to events view -->
<br>Look up events at your destination during your trip?
<br><input type="radio" name="choice" value="yes">Yes
<br><input type="radio" name="choice" value="no">No
<br>
<br><input type="submit" value="Get Event List">
</form>
<script>
function validate() {
	var sc = document.forms["form2"]["cityStart"].value;
	var ss = document.forms["form2"]["stateStart"].value;
	var ec = document.forms["form2"]["cityEnd"].value;
	var es = document.forms["form2"]["stateEnd"].value;
    
    if (sc == "" || ss=="") {
        alert("Enter trip location starting point");
        return false;
        } else if (ec == "" || es=="") {
        	alert("Enter trip location ending point");
        }else if (d == "") {
    	alert("Enter a destination");
    	return false;
    	}
}
  	     
</script>
    	
</body>
</html>