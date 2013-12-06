From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72399] New: [NVAA][NV50][Regression] Oops : nouveau:
 3.13-rc1+ probe of 0000:02:00.0 failed with error -22
Date: Fri, 06 Dec 2013 14:31:54 +0000
Message-ID: <bug-72399-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0666618762=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0666618762==
Content-Type: multipart/alternative; boundary="1386340314.Eb6F851.6659"; charset="us-ascii"


--1386340314.Eb6F851.6659
Date: Fri, 6 Dec 2013 14:31:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72399

          Priority: medium
            Bug ID: 72399
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVAA][NV50][Regression] Oops : nouveau: 3.13-rc1+
                    probe of 0000:02:00.0 failed with error -22
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: All
          Reporter: dirkneukirchen-S0/GAf8tV78@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 90360
  --> https://bugs.freedesktop.org/attachment.cgi?id=90360&action=edit
lspci -vv -nn output

[   11.132901] nouveau E[     CLK][0000:02:00.0] init failed, -22
[   11.132966] nouveau E[     DRM] failed to create 0x80000080, -22
[   11.133734] nouveau: probe of 0000:02:00.0 failed with error -22
[   11.138028] BUG: unable to handle kernel paging request at 08097000

Kernel version with that bug:
3.13-rc1
3.13-rc2

Kernel versions without the bug: 3.12.1 (and before)

I already filed a bug report and attached a netconsole log of
3.13-rc1 + 3.12.1 on
Kernel Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=65771

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386340314.Eb6F851.6659
Date: Fri, 6 Dec 2013 14:31:54 +0000
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
   title="NEW --- - [NVAA][NV50][Regression] Oops : nouveau: 3.13-rc1+ probe of 0000:02:00.0 failed with error -22"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72399">72399</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVAA][NV50][Regression] Oops : nouveau: 3.13-rc1+ probe of 0000:02:00.0 failed with error -22
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
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
          <td>dirkneukirchen&#64;web.de
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
        <pre>Created <span class=""><a href="attachment.cgi?id=90360" name="attach_90360" title="lspci -vv -nn output">attachment 90360</a> <a href="attachment.cgi?id=90360&amp;action=edit" title="lspci -vv -nn output">[details]</a></span>
lspci -vv -nn output

[   11.132901] nouveau E[     CLK][0000:02:00.0] init failed, -22
[   11.132966] nouveau E[     DRM] failed to create 0x80000080, -22
[   11.133734] nouveau: probe of 0000:02:00.0 failed with error -22
[   11.138028] BUG: unable to handle kernel paging request at 08097000

Kernel version with that bug:
3.13-rc1
3.13-rc2

Kernel versions without the bug: 3.12.1 (and before)

I already filed a bug report and attached a netconsole log of
3.13-rc1 + 3.12.1 on
Kernel Bugzilla: <a href="https://bugzilla.kernel.org/show_bug.cgi?id=65771">https://bugzilla.kernel.org/show_bug.cgi?id=65771</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386340314.Eb6F851.6659--

--===============0666618762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0666618762==--
