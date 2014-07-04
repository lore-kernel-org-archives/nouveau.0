From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80900] New: [NVCF] PWM fan speed too high under
	kernel 3.15
Date: Fri, 04 Jul 2014 07:32:16 +0000
Message-ID: <bug-80900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1175204307=="
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


--===============1175204307==
Content-Type: multipart/alternative; boundary="1404459136.DbEE40.32162"; charset="us-ascii"


--1404459136.DbEE40.32162
Date: Fri, 4 Jul 2014 07:32:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80900

          Priority: medium
            Bug ID: 80900
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVCF] PWM fan speed too high under kernel 3.15
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: gianni-1aVadY534Hbk1uMJSBkQmQ@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 10.2
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 102242
  --> https://bugs.freedesktop.org/attachment.cgi?id=102242&action=edit
Dmesg

Since updating to kernel 3.15, the pwm fan speed of my 550 Ti card is too high
(above 35% in all situations) when compared with the proprietary NVIDIA driver
(that hovers around 30%).
The only way to reduce it to silence once again is to manually change the
pwm1_max value under sysfs to 30 (by default it's 100).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404459136.DbEE40.32162
Date: Fri, 4 Jul 2014 07:32:16 +0000
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
   title="NEW --- - [NVCF] PWM fan speed too high under kernel 3.15"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80900">80900</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVCF] PWM fan speed too high under kernel 3.15
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>gianni&#64;rootcube.net
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.2
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=102242" name="attach_102242" title="Dmesg">attachment 102242</a> <a href="attachment.cgi?id=102242&amp;action=edit" title="Dmesg">[details]</a></span>
Dmesg

Since updating to kernel 3.15, the pwm fan speed of my 550 Ti card is too high
(above 35% in all situations) when compared with the proprietary NVIDIA driver
(that hovers around 30%).
The only way to reduce it to silence once again is to manually change the
pwm1_max value under sysfs to 30 (by default it's 100).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404459136.DbEE40.32162--

--===============1175204307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1175204307==--
