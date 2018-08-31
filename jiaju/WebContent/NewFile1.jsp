<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>table表格无刷新翻页排序效果</title>
<link rel="stylesheet" href="css/css/lanrenzhijia.css"/>
<link rel="stylesheet" href="css/bootstrap.css"/>
</head>
<body>
	<div id="tablewrapper">
		<div id="tableheader">
        	<div class="search">
                <select id="columns" onchange="sorter.search('query')"></select>
                <input type="text" id="query" onkeyup="sorter.search('query')" />
            </div>
            <span class="details">
				<div>Records <span id="startrecord"></span>-<span id="endrecord"></span> of <span id="totalrecords"></span></div>
        		<div><a href="javascript:sorter.reset()">reset</a></div>
        	</span>
        </div>
        <table cellpadding="0" cellspacing="0" border="0" id="table" class="table table-bordered">
            <thead>
                <tr >
                    <th class="nosort" style="border-bottom: none;"><h8>ID</h8></th>
                    <th style="border-bottom: none;"><h8>Name</h8></th>
                    <th style="border-bottom: none;"><h8>Phone</h8></th>
                    <th style="border-bottom: none;"><h8>Email</h8></th>
                    <th style="border-bottom: none;"><h8>Birthdate</h8></th>
                    <th style="border-bottom: none;"><h8>Last Access</h8></th>
                    <th style="border-bottom: none;"><h8>Rating</h8></th>
                    <th style="border-bottom: none;"><h8>Done</h8></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Ezekiel Hart</td>
                    <td>(627) 536-4760</td>
                    <td><a href="mailto:#">tortor@est.ca</a></td>
                    <td>12/02/1962</td>
                    <td>7%</td>
                    <td>$73,229</td>
                    <td>6.9</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Jaquelyn Pace</td>
                    <td>(921) 943-5780</td>
                    <td><a href="mailto:#">in@elementum.org</a></td>
                    <td>06/03/1957</td>
                    <td>33%</td>
                    <td>$130,752</td>
                    <td>4.9</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Lois Pickett</td>
                    <td>(835) 361-5993</td>
                    <td><a href="mailto:#">arcu.ac@disse.ca</a></td>
                    <td>10/15/1983</td>
                    <td>44%</td>
                    <td>$48,684</td>
                    <td>5.5</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>Keane Raymond</td>
                    <td>(605) 803-1561</td>
                    <td><a href="mailto:#">at.risus.Nunc@ipsum.com</a></td>
                    <td>07/30/1982</td>
                    <td>20%</td>
                    <td>$7,023</td>
                    <td>9.5</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>Porter Thomas</td>
                    <td>(666) 569-9894</td>
                    <td><a href="mailto:#">non@Proin.ca</a></td>
                    <td>09/27/1986</td>
                    <td>66%</td>
                    <td>$69,875</td>
                    <td>0.9</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>Imani Murphy</td>
                    <td>(771) 294-6690</td>
                    <td><a href="mailto:#">Aenean.sed@elit.ca</a></td>
                    <td>10/23/1970</td>
                    <td>30%</td>
                    <td>$113,763</td>
                    <td>4.9</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td>Zachery Guthrie</td>
                    <td>(851) 784-4129</td>
                    <td><a href="mailto:#">nunc.nulla@vel.com</a></td>
                    <td>12/22/1972</td>
                    <td>24%</td>
                    <td>$130,248</td>
                    <td>6.9</td>
                </tr>
                <tr>
                    <td>8</td>
                    <td>Harper Bowen</td>
                    <td>(810) 652-6704</td>
                    <td><a href="mailto:#">dis@duinec.ca</a></td>
                    <td>10/26/1973</td>
                    <td>49%</td>
                    <td>$73,197</td>
                    <td>4.5</td>
                </tr>
                <tr>
                    <td>9</td>
                    <td>Caldwell Larson</td>
                    <td>(850) 562-3177</td>
                    <td><a href="mailto:#">elit@dolor.com</a></td>
                    <td>07/20/1985</td>
                    <td>81%</td>
                    <td>$63,736</td>
                    <td>7.5</td>
                </tr>
                <tr>
                    <td>10</td>
                    <td>Baker Osborn</td>
                    <td>(378) 371-0559</td>
                    <td><a href="mailto:#">turpis.Nulla@ac.edu</a></td>
                    <td>03/29/1970</td>
                    <td>61%</td>
                    <td>$2,868</td>
                    <td>0.1</td>
                </tr>
                <tr>
                    <td>11</td>
                    <td>Yael Owens</td>
                    <td>(465) 520-1801</td>
                    <td><a href="mailto:#">nunc.ac.mattis@enim.com</a></td>
                    <td>08/10/1963</td>
                    <td>85%</td>
                    <td>$126,469</td>
                    <td>8.9</td>
                </tr>
                <tr>
                    <td>12</td>
                    <td>Fletcher Briggs</td>
                    <td>(992) 962-9419</td>
                    <td><a href="mailto:#">amet.ante@lentesque.edu</a></td>
                    <td>08/12/1971</td>
                    <td>23%</td>
                    <td>$142,448</td>
                    <td>8.9</td>
                </tr>
                <tr>
                    <td>13</td>
                    <td>Maggy Murphy</td>
                    <td>(585) 210-0390</td>
                    <td><a href="mailto:#">eu@Integer.com</a></td>
                    <td>07/11/1968</td>
                    <td>31%</td>
                    <td>$40,267</td>
                    <td>6.9</td>
                </tr>
                <tr>
                    <td>14</td>
                    <td>Maggie Blake</td>
                    <td>(489) 101-5447</td>
                    <td><a href="mailto:#">rutrum.non.hendrerit@iaculis.org</a></td>
                    <td>04/11/1970</td>
                    <td>32%</td>
                    <td>$99,686</td>
                    <td>7.9</td>
                </tr>
                <tr>
                    <td>15</td>
                    <td>Ginger Bell</td>
                    <td>(934) 692-7294</td>
                    <td><a href="mailto:#">erat.in.conetuer@pedenout.org</a></td>
                    <td>06/10/1957</td>
                    <td>74%</td>
                    <td>$112,997</td>
                    <td>4.5</td>
                </tr>
                <tr>
                    <td>16</td>
                    <td>Iliana Ballard</td>
                    <td>(806) 835-7035</td>
                    <td><a href="mailto:#">vel.sapien@mi.ca</a></td>
                    <td>02/09/1989</td>
                    <td>78%</td>
                    <td>$5,282</td>
                    <td>5.5</td>
                </tr>
                <tr>
                    <td>17</td>
                    <td>Alisa Monroe</td>
                    <td>(859) 974-4442</td>
                    <td><a href="mailto:#">adipiscing.ligula@aretraNam.edu</a></td>
                    <td>02/14/1990</td>
                    <td>95%</td>
                    <td>$103,999</td>
                    <td>5.9</td>
                </tr>
            </tbody>
        </table>
        <div id="tablefooter">
          <div id="tablenav">
            	<div>
                    <img src="css/images/first.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1,true)" />
                    <img src="css/images/previous.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1)" />
                    <img src="css/images/next.gif" width="16" height="16" alt="First Page" onclick="sorter.move(1)" />
                    <img src="css/images/last.gif" width="16" height="16" alt="Last Page" onclick="sorter.move(1,true)" />
                </div>
                <div>
                	<select id="pagedropdown"></select>
				</div>
                <div>
                	<a href="javascript:sorter.showall()">view all</a>
                </div>
            </div>
			<div id="tablelocation">
            	<div>
                    <select onchange="sorter.size(this.value)">
                    <option value="5">5</option>
                        <option value="10" selected="selected">10</option>
                        <option value="20">20</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                    </select>
                    <span>Entries Per Page</span>
                </div>
                <div class="page">Page <span id="currentpage"></span> of <span id="totalpages"></span></div>
            </div>
        </div>
    </div>
	<script type="text/javascript" src="js/lanrenzhijia.js"></script>
	<script type="text/javascript">
	var sorter = new TINY.table.sorter('sorter','table',{
		headclass:'head',
		ascclass:'asc',
		descclass:'desc',
		evenclass:'evenrow',
		oddclass:'oddrow',
		evenselclass:'evenselected',
		oddselclass:'oddselected',
		paginate:true,
		size:10,
		colddid:'columns',
		currentid:'currentpage',
		totalid:'totalpages',
		startingrecid:'startrecord',
		endingrecid:'endrecord',
		totalrecid:'totalrecords',
		hoverid:'selectedrow',
		pageddid:'pagedropdown',
		navid:'tablenav',
		sortcolumn:1,
		sortdir:1,
		sum:[8],
		avg:[6,7,8,9],
		columns:[{index:7, format:'%', decimals:1},{index:8, format:'$', decimals:0}],
		init:true
	});
  </script>
</body>
</html>