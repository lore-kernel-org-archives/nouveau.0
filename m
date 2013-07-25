From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67315] New: System lockup with X consuming all CPU
Date: Thu, 25 Jul 2013 17:59:11 +0000
Message-ID: <bug-67315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1673306704=="
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


--===============1673306704==
Content-Type: multipart/alternative; boundary="1374775151.FEA21.7344"; charset="us-ascii"


--1374775151.FEA21.7344
Date: Thu, 25 Jul 2013 17:59:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67315

          Priority: medium
            Bug ID: 67315
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: System lockup with X consuming all CPU
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: ricks-ijgZXeOBpMSRq8AjE7tl8g@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 83002
  --> https://bugs.freedesktop.org/attachment.cgi?id=83002&action=edit
Xorg.0.log with modeset enabled and output of dmesg while problem is active

When using nouveau with modeset, the system starts up fine but eventually
(possibly when the screen saver kicks in), X consumes all CPU resources on one
core rendering the machine useless except via ssh sessions. If I disable
modeset at boot time (nouveau.modeset=0), then the system is stable but the
drive does not accept the EDID from the monitor and I'm stuck with a 1024x768
display instead of the 1600x900 it has with modeset enabled.

I'm attaching the Xorg.0.log file along with an excerpt from the output of
dmesg when this behavior is occurring.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374775151.FEA21.7344
Date: Thu, 25 Jul 2013 17:59:11 +0000
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
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315">67315</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>System lockup with X consuming all CPU
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ricks&#64;alldigital.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=83002" name="attach_83002" title="Xorg.0.log with modeset enabled and output of dmesg while problem is active">attachment 83002</a> <a href="attachment.cgi?id=83002&amp;action=edit" title="Xorg.0.log with modeset enabled and output of dmesg while problem is active">[details]</a></span>
Xorg.0.log with modeset enabled and output of dmesg while problem is active

When using nouveau with modeset, the system starts up fine but eventually
(possibly when the screen saver kicks in), X consumes all CPU resources on one
core rendering the machine useless except via ssh sessions. If I disable
modeset at boot time (nouveau.modeset=0), then the system is stable but the
drive does not accept the EDID from the monitor and I'm stuck with a 1024x768
display instead of the 1600x900 it has with modeset enabled.

I'm attaching the Xorg.0.log file along with an excerpt from the output of
dmesg when this behavior is occurring.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374775151.FEA21.7344--

--===============1673306704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1673306704==--
