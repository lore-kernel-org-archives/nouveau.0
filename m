From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69345] New: nouveau no longer reports D3cold on
 linux-next as of at least 20130906
Date: Sat, 14 Sep 2013 06:38:57 +0000
Message-ID: <bug-69345-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1564661847=="
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


--===============1564661847==
Content-Type: multipart/alternative; boundary="1379140737.d7f4d6f10.28986"; charset="us-ascii"


--1379140737.d7f4d6f10.28986
Date: Sat, 14 Sep 2013 06:38:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69345

          Priority: medium
            Bug ID: 69345
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau no longer reports D3cold on linux-next as of
                    at least 20130906
          Severity: minor
    Classification: Unclassified
                OS: Linux (All)
          Reporter: tod.jackson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Hi there,

I saw Rafael made this recent commit:
http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=8ad928d52e63a9b7d69f0873d7318c4561e2f8cd

That may not be the culprit at all, sorry. I noticed that if I'm using, say,
the latest drm-intel-next kernel or nouveau kernel ACPI reports nouveau's
status properly, e.g. nouveau: power state changed by ACPI to D3cold, however
in next I no longer get these messages, although the device seems to be in
D3cold (?). At least temperatures are much lower, especially when building
software.

[23301.994315] ACPI Warning: \_SB_.PCI0.P0P2.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20130725/nsarguments-95)
(That's the only indicator of power transitions now - a warning that might go
away in the future - p.s., do I need to do some DSDT hacking for that or is it
on the Linux-side?)

Invoking lm_sensors' sensors command shows N/A for the nouveau device on
Optimus laptops, as expected if the device is in D3cold.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379140737.d7f4d6f10.28986
Date: Sat, 14 Sep 2013 06:38:57 +0000
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
   title="NEW --- - nouveau no longer reports D3cold on linux-next as of at least 20130906"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69345">69345</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau no longer reports D3cold on linux-next as of at least 20130906
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>minor
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
          <td>tod.jackson&#64;gmail.com
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
          <td>git
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
        <pre>Hi there,

I saw Rafael made this recent commit:
<a href="http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=8ad928d52e63a9b7d69f0873d7318c4561e2f8cd">http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=8ad928d52e63a9b7d69f0873d7318c4561e2f8cd</a>

That may not be the culprit at all, sorry. I noticed that if I'm using, say,
the latest drm-intel-next kernel or nouveau kernel ACPI reports nouveau's
status properly, e.g. nouveau: power state changed by ACPI to D3cold, however
in next I no longer get these messages, although the device seems to be in
D3cold (?). At least temperatures are much lower, especially when building
software.

[23301.994315] ACPI Warning: \_SB_.PCI0.P0P2.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20130725/nsarguments-95)
(That's the only indicator of power transitions now - a warning that might go
away in the future - p.s., do I need to do some DSDT hacking for that or is it
on the Linux-side?)

Invoking lm_sensors' sensors command shows N/A for the nouveau device on
Optimus laptops, as expected if the device is in D3cold.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379140737.d7f4d6f10.28986--

--===============1564661847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1564661847==--
