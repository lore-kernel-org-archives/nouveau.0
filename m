From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79522] New: [NV67] Possible Regression 3.14.4+
Date: Mon, 02 Jun 2014 03:18:13 +0000
Message-ID: <bug-79522-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1207064700=="
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


--===============1207064700==
Content-Type: multipart/alternative; boundary="1401679094.0086FEE1.27875"; charset="us-ascii"


--1401679094.0086FEE1.27875
Date: Mon, 2 Jun 2014 03:18:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79522

          Priority: medium
            Bug ID: 79522
          Keywords: regression
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV67] Possible Regression 3.14.4+
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: storkus-FfzuIwEQ1aBBDgjK7y7TUQ@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Note: this may be related to Bug#70972.

My Acer Aspire 5520-5092 with a GeForce 7000M/nForce 610M MCP-67 running
Slackware 14.1 was working fine until I updated to kernel 3.14.4.  I had
previously upgraded to 3.14.3 and nothing happened then.  Upgrading again today
to 3.14.5 did not fix the problem, although it behaves slightly differently.

The problem is that, during boot, upon KMS loading and the framebuffer starting
up, the laptop backlight does not turn on most of the time; part of the time
when it does, I still have a blank screen.  Sometimes the machine seems to have
booted up, but most of the time it appears locked, yet without a blinking LED. 
This has all the hallmarks of a race as rebooting enough times gives a working
system.  I haven't yet tried using an external monitor.

The only other update the Slackware has done since this started is messing with
LibELF--still 0.8.13, but with new compile options.  This was done
simultaneously with the kernel updates.  I don't see how this could affect the
kernel prior to mounting anything, though.

Thanks for any help, and a needed project!  Mike

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401679094.0086FEE1.27875
Date: Mon, 2 Jun 2014 03:18:14 +0000
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
   title="NEW --- - [NV67] Possible Regression 3.14.4+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79522">79522</a>
          </td>
        </tr>

        <tr>
          <th>Keywords</th>
          <td>regression
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV67] Possible Regression 3.14.4+
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
          <td>storkus&#64;storkus.com
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
        <pre>Note: this may be related to <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV67] Modesetting failure at 1280x800"
   href="show_bug.cgi?id=70972">Bug#70972</a>.

My Acer Aspire 5520-5092 with a GeForce 7000M/nForce 610M MCP-67 running
Slackware 14.1 was working fine until I updated to kernel 3.14.4.  I had
previously upgraded to 3.14.3 and nothing happened then.  Upgrading again today
to 3.14.5 did not fix the problem, although it behaves slightly differently.

The problem is that, during boot, upon KMS loading and the framebuffer starting
up, the laptop backlight does not turn on most of the time; part of the time
when it does, I still have a blank screen.  Sometimes the machine seems to have
booted up, but most of the time it appears locked, yet without a blinking LED. 
This has all the hallmarks of a race as rebooting enough times gives a working
system.  I haven't yet tried using an external monitor.

The only other update the Slackware has done since this started is messing with
LibELF--still 0.8.13, but with new compile options.  This was done
simultaneously with the kernel updates.  I don't see how this could affect the
kernel prior to mounting anything, though.

Thanks for any help, and a needed project!  Mike</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401679094.0086FEE1.27875--

--===============1207064700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1207064700==--
