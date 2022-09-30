# Create a nested query to get name of all bus stops on Gold line and the number of 'On' and 'Off' at each bus stop 
SELECT * FROM GOLDLINE.gold;
SELECT Onavg.Stop, Onavg.avgOn as DailyAvgOn, Offavg.avgOff as DailyAvgOff
from (select Stop, count(Onoff) as avgOn
from gold
where Onoff = 'on' and Route = 'Gold'
group by Stop) as Onavg
INNER JOIN (select Stop, count(Onoff) as avgOff
from gold
where Onoff = 'off' and Route = 'Gold'
group by Stop) as Offavg
using (Stop)
