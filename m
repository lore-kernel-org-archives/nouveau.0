From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66022] pwm1[_enable] faults after hibernate/restore
 related to automatic (or otherwise) fan management
Date: Tue, 25 Jun 2013 22:10:12 +0000
Message-ID: <bug-66022-8800-TzeIowiiFE@http.bugs.freedesktop.org/>
References: <bug-66022-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2092114669=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66022-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2092114669==
Content-Type: multipart/alternative; boundary="1372198212.BBb51.5788"; charset="us-ascii"


--1372198212.BBb51.5788
Date: Tue, 25 Jun 2013 22:10:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66022

--- Comment #5 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
Some more feedback on this, after I was able to test this more thoroughly:

The automatic thermal management seems, at least for my card (Chipset G71 -
NV49), completely buggy!

After hibernate/resume, when my machine doesn't lock up a few seconds after
restore is complete (see Comment #4), I also get the following possible
scenarios developing:

pwm1=0
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=28000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

[...]

pwm1=0
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=52000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

As evident, pwm1_enable is restored, but the nouveau driver doesn't seem to
bother with any sort of fan management at all (the pwm1 is reduced from 100 to
0 after restore and it stays there for ever!).

When I do this:

echo 2 > /sys/class/hwmon/hwmon0/pwm1_enable 

I still get:

pwm1=0
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=55000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

Next, I tried the following sequence:

echo 1 > /sys/class/hwmon/hwmon0/pwm1_enable 
echo 2 > /sys/class/hwmon/hwmon0/pwm1_enable 

pwm1=26
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=53000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

[...]

pwm1=26
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=47000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

As evident, the pwm1 "twitched" for a bit, and then "froze" at 26%, reducing
the card temperature from about 55 degrees to 47. I then did this:

echo 1 > /sys/class/hwmon/hwmon0/pwm1_enable 
echo 100 > /sys/class/hwmon/hwmon0/pwm1 
echo 2 > /sys/class/hwmon/hwmon0/pwm1_enable 

pwm1=88
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=44000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

[...]

pwm1=13
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=47000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

pwm1=13
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=58000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

Again, pwm1 "froze" at a value of 13 and stayed there. Since I do not want to
burn my card out, I then switched to manual and set the pwm1 value to 100.

There are 3 additional bugs I discovered also, but will submit a separate
reports (and patches) for these.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372198212.BBb51.5788
Date: Tue, 25 Jun 2013 22:10:12 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - pwm1[_enable] faults after hibernate/restore related to automatic (or otherwise) fan management"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66022#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - pwm1[_enable] faults after hibernate/restore related to automatic (or otherwise) fan management"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66022">bug 66022</a>
              from <span class="vcard"><a class="email" href="mailto:mr.dash.four&#64;googlemail.com" title="Mr-4 &lt;mr.dash.four&#64;googlemail.com&gt;"> <span class="fn">Mr-4</span></a>
</span></b>
        <pre>Some more feedback on this, after I was able to test this more thoroughly:

The automatic thermal management seems, at least for my card (Chipset G71 -
NV49), completely buggy!

After hibernate/resume, when my machine doesn't lock up a few seconds after
restore is complete (see <a href="show_bug.cgi?id=66022#c4">Comment #4</a>), I also get the following possible
scenarios developing:

pwm1=0
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=28000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

[...]

pwm1=0
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=52000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

As evident, pwm1_enable is restored, but the nouveau driver doesn't seem to
bother with any sort of fan management at all (the pwm1 is reduced from 100 to
0 after restore and it stays there for ever!).

When I do this:

echo 2 &gt; /sys/class/hwmon/hwmon0/pwm1_enable 

I still get:

pwm1=0
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=55000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

Next, I tried the following sequence:

echo 1 &gt; /sys/class/hwmon/hwmon0/pwm1_enable 
echo 2 &gt; /sys/class/hwmon/hwmon0/pwm1_enable 

pwm1=26
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=53000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

[...]

pwm1=26
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=47000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

As evident, the pwm1 &quot;twitched&quot; for a bit, and then &quot;froze&quot; at 26%, reducing
the card temperature from about 55 degrees to 47. I then did this:

echo 1 &gt; /sys/class/hwmon/hwmon0/pwm1_enable 
echo 100 &gt; /sys/class/hwmon/hwmon0/pwm1 
echo 2 &gt; /sys/class/hwmon/hwmon0/pwm1_enable 

pwm1=88
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=44000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

[...]

pwm1=13
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=47000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

pwm1=13
pwm1_enable=2
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=58000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

Again, pwm1 &quot;froze&quot; at a value of 13 and stayed there. Since I do not want to
burn my card out, I then switched to manual and set the pwm1 value to 100.

There are 3 additional bugs I discovered also, but will submit a separate
reports (and patches) for these.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372198212.BBb51.5788--

--===============2092114669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2092114669==--
