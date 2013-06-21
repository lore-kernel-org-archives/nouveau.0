From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66022] New: pwm1[_enable] faults after
 hibernate/restore related to automatic (or otherwise) fan management
Date: Fri, 21 Jun 2013 19:58:27 +0000
Message-ID: <bug-66022-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1888950143=="
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


--===============1888950143==
Content-Type: multipart/alternative; boundary="1371844707.cB61251.13565"; charset="us-ascii"


--1371844707.cB61251.13565
Date: Fri, 21 Jun 2013 19:58:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66022

          Priority: medium
            Bug ID: 66022
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: pwm1[_enable] faults after hibernate/restore related
                    to automatic (or otherwise) fan management
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

This is a collection of 2 bugs, which I think are related (hence why I am
reporting them both here) as they both happen as a result of hibernate/restore:

1. After a hibernate/restore cycle, the fan management option (the value of
pwm1_enable) is not restored; and also 

2. After a hibernate/restore cycle, when automatic fan management is applied
("echo 2 > .../pwm1_enable"), this doesn't work - the nouveau driver takes the
fan speed to 2 and keeps it there *regardless* of the temperature of the video
card, which may cause the card to BURN OUT!

The kernel in use is 3.9.6 with the stock-supplied nvidia driver. For more
details please see https://bugzilla.redhat.com/show_bug.cgi?id=976658

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1371844707.cB61251.13565
Date: Fri, 21 Jun 2013 19:58:27 +0000
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
   title="NEW --- - pwm1[_enable] faults after hibernate/restore related to automatic (or otherwise) fan management"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66022">66022</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>pwm1[_enable] faults after hibernate/restore related to automatic (or otherwise) fan management
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
        <pre>This is a collection of 2 bugs, which I think are related (hence why I am
reporting them both here) as they both happen as a result of hibernate/restore:

1. After a hibernate/restore cycle, the fan management option (the value of
pwm1_enable) is not restored; and also 

2. After a hibernate/restore cycle, when automatic fan management is applied
(&quot;echo 2 &gt; .../pwm1_enable&quot;), this doesn't work - the nouveau driver takes the
fan speed to 2 and keeps it there *regardless* of the temperature of the video
card, which may cause the card to BURN OUT!

The kernel in use is 3.9.6 with the stock-supplied nvidia driver. For more
details please see <a href="https://bugzilla.redhat.com/show_bug.cgi?id=976658">https://bugzilla.redhat.com/show_bug.cgi?id=976658</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1371844707.cB61251.13565--

--===============1888950143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1888950143==--
