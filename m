From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80507] New: Cannot set pwm1 above 80 on GeForce 9600
 GT, 10de:0622
Date: Wed, 25 Jun 2014 01:13:08 +0000
Message-ID: <bug-80507-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1717059392=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1717059392==
Content-Type: multipart/alternative; boundary="1403658788.fd73A1.1597"; charset="us-ascii"


--1403658788.fd73A1.1597
Date: Wed, 25 Jun 2014 01:13:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80507

          Priority: medium
            Bug ID: 80507
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Cannot set pwm1 above 80 on GeForce 9600 GT, 10de:0622
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: awilliam-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

It seems like the /sys/class/drm/card0/device/hwmon/hwmon0/pwm1 value for my
GeForce 9600 GT (10de:0622) will never go above 80.

If I do echo 1 > pwm1_enable (to set it to manual control), then try echoing
values to pwm1, it basically acts as if any value above 80 is identical to 80.

[root@adam hwmon0]# pwd
/sys/class/drm/card0/device/hwmon/hwmon0
[root@adam hwmon0]# echo 79 > pwm1
[root@adam hwmon0]# cat pwm1
79
[root@adam hwmon0]# echo 81 > pwm1
[root@adam hwmon0]# cat pwm1
80
[root@adam hwmon0]# echo 100 > pwm1
[root@adam hwmon0]# cat pwm1
80
[root@adam hwmon0]# echo 100000 > pwm1
[root@adam hwmon0]# cat pwm1
80
[root@adam hwmon0]# echo 30 > pwm1
[root@adam hwmon0]# cat pwm1
30
[root@adam hwmon0]# echo 100000 > pwm1
[root@adam hwmon0]# cat pwm1
80

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403658788.fd73A1.1597
Date: Wed, 25 Jun 2014 01:13:08 +0000
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
   title="NEW --- - Cannot set pwm1 above 80 on GeForce 9600 GT, 10de:0622"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80507">80507</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Cannot set pwm1 above 80 on GeForce 9600 GT, 10de:0622
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
          <td>awilliam&#64;redhat.com
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
        <pre>It seems like the /sys/class/drm/card0/device/hwmon/hwmon0/pwm1 value for my
GeForce 9600 GT (10de:0622) will never go above 80.

If I do echo 1 &gt; pwm1_enable (to set it to manual control), then try echoing
values to pwm1, it basically acts as if any value above 80 is identical to 80.

[root&#64;adam hwmon0]# pwd
/sys/class/drm/card0/device/hwmon/hwmon0
[root&#64;adam hwmon0]# echo 79 &gt; pwm1
[root&#64;adam hwmon0]# cat pwm1
79
[root&#64;adam hwmon0]# echo 81 &gt; pwm1
[root&#64;adam hwmon0]# cat pwm1
80
[root&#64;adam hwmon0]# echo 100 &gt; pwm1
[root&#64;adam hwmon0]# cat pwm1
80
[root&#64;adam hwmon0]# echo 100000 &gt; pwm1
[root&#64;adam hwmon0]# cat pwm1
80
[root&#64;adam hwmon0]# echo 30 &gt; pwm1
[root&#64;adam hwmon0]# cat pwm1
30
[root&#64;adam hwmon0]# echo 100000 &gt; pwm1
[root&#64;adam hwmon0]# cat pwm1
80</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403658788.fd73A1.1597--

--===============1717059392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1717059392==--
