<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Select Trip Information</title>
</head>
<body>
<h1>Let's plan your trip!</h1>




<form name="form2" action="events" onsubmit="return validate()" method="get">

<br>Starting Point: <input type="text" name="origin">
<br>
<br>Destination:<input type="text" name="destination">
<br>
<br>


Start Date : Year
 
  <select id="year_start" name="year_start">
	<option value=2016>2016</option>
	<option value=2017>2017</option>
	<option value=2018>2018</option>
	</select>

 / Month
   <select id="month_start"  name="month_start"> 
<option value=1>1</option>
<option value=2>2</option>
<option value=3>3</option>
<option value=4>4</option>
<option value=5>5</option>
<option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
<option value=10>10</option>
<option value=11>11</option>
<option value=12>12</option>
</select> / Day
 
  <select id="day_start" name="day_start">
<option value=1>1</option>
<option value=2>2</option>
<option value=3>3</option>
<option value=4>4</option>
<option value=5>5</option>
<option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
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
<option value=25>25</option>
<option value=26>26</option>
<option value=27>27</option>
<option value=28>28</option>
<option value=29>29</option>
<option value=30>30</option>
<option value=31>31</option>
</select>  (yyyy/mm/dd)
  
  
<br><br>
End Date: Year

  <select id="year_end" name="year_end">
	<option value=2016>2016</option>
	<option value=2017>2017</option>
	<option value=2018>2018</option>
	</select>

 / Month
   <select id="month_end"  name="month_end"> 
<option value=1>1</option>
<option value=2>2</option>
<option value=3>3</option>
<option value=4>4</option>
<option value=5>5</option>
<option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
<option value=10>10</option>
<option value=11>11</option>
<option value=12>12</option>
</select> / Day
 
  <select id="day_end" name="day_end">
<option value=1>1</option>
<option value=2>2</option>
<option value=3>3</option>
<option value=4>4</option>
<option value=5>5</option>
<option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
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
<option value=25>25</option>
<option value=26>26</option>
<option value=27>27</option>
<option value=28>28</option>
<option value=29>29</option>
<option value=30>30</option>
<option value=31>31</option>
</select>  (yyyy/mm/dd)

<br>
<br>
<br><input type="submit" value="Submit Registration">

</form>

<script>
function validate() {
	var sp = document.forms["form2"]["origin"].value;
    var d = document.forms["form2"]["destination"].value;
    
    if (sp == "") {
        alert("Enter trip location starting point");
        return false;
        } else if (d == "") {
    	alert("Enter a destination");
    	return false;
    	}
        <!--else if (sd == "" ) {
    		
    	alert("Enter trip start date");
    	return false;
    	} else if (ed == "") {
    	alert("Enter trip end date");
    	return false;

    	} -->
    	 
    	    
   }
</script>



</body>
</html>
