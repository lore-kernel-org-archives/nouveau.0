From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66177] New: pwm1 value not restored during
 hibernate/restore cycle in the event of manual fan management mode
Date: Tue, 25 Jun 2013 22:27:11 +0000
Message-ID: <bug-66177-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1683858726=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1683858726==
Content-Type: multipart/alternative; boundary="1372199232.0E28E5A1.8777"; charset="us-ascii"


--1372199232.0E28E5A1.8777
Date: Tue, 25 Jun 2013 22:27:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66177

          Priority: medium
            Bug ID: 66177
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: pwm1 value not restored during hibernate/restore cycle
                    in the event of manual fan management mode
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

When I have done the following:

echo 1 > /sys/class/hwmon/hwmon0/pwm1_enable 
echo 30 > /sys/class/hwmon/hwmon0/pwm1 

pwm1=30
pwm1_enable=1
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=41000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

and then do hibernate/restore, I get this:

pwm1=100
pwm1_enable=1
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=37000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

The "pwm1_enable" value is restored, thanks to the patch proposed by Emil
Velikov in Bug 66022, but that doesn't restore the pwm1 value in case of manual
fan management. I am attaching 2 patches to this report:

1. which fixes this bug and restores everything ("pwm1_enable", as well as
"pwm1"); and

2. a separate patch, allowing fan_mode and fan duty (percentage) to be
specified at the command line, allowing me to set my fan speed immediately and
not waiting for OS scripts to do that for me as was the case up until now.

Since the automatic fan management is, well, lets just say incomplete, that's
currently the best option to not have my fan wail like a jet engine every time
I boot up and use my machine.

Patches follow...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372199232.0E28E5A1.8777
Date: Tue, 25 Jun 2013 22:27:12 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - pwm1 value not restored during hibernate/restore cycle in the event of manual fan management mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66177">66177</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>pwm1 value not restored during hibernate/restore cycle in the event of manual fan management mode
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mr.dash.four&#64;googlemail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When I have done the following:

echo 1 &gt; /sys/class/hwmon/hwmon0/pwm1_enable 
echo 30 &gt; /sys/class/hwmon/hwmon0/pwm1 

pwm1=30
pwm1_enable=1
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=41000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

and then do hibernate/restore, I get this:

pwm1=100
pwm1_enable=1
pwm1_max=100
pwm1_min=0
temp1_auto_point1_pwm=100
temp1_auto_point1_temp=90000
temp1_auto_point1_temp_hyst=3000
temp1_crit=115000
temp1_crit_hyst=2000
temp1_emergency=135000
temp1_emergency_hyst=5000
temp1_input=37000
temp1_max=95000
temp1_max_hyst=3000
update_rate=1000

The &quot;pwm1_enable&quot; value is restored, thanks to the patch proposed by Emil
Velikov in <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - pwm1[_enable] faults after hibernate/restore related to automatic (or otherwise) fan management"
   href="show_bug.cgi?id=66022">Bug 66022</a>, but that doesn't restore the pwm1 value in case of manual
fan management. I am attaching 2 patches to this report:

1. which fixes this bug and restores everything (&quot;pwm1_enable&quot;, as well as
&quot;pwm1&quot;); and

2. a separate patch, allowing fan_mode and fan duty (percentage) to be
specified at the command line, allowing me to set my fan speed immediately and
not waiting for OS scripts to do that for me as was the case up until now.

Since the automatic fan management is, well, lets just say incomplete, that's
currently the best option to not have my fan wail like a jet engine every time
I boot up and use my machine.

Patches follow...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372199232.0E28E5A1.8777--

--===============1683858726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1683858726==--
