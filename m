From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69928] New: [NVAA] Boot of linux kernel 3.12-rc2
	hangs
Date: Sun, 29 Sep 2013 13:23:25 +0000
Message-ID: <bug-69928-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1200902009=="
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


--===============1200902009==
Content-Type: multipart/alternative; boundary="1380461005.F24b7Acd1.22869"; charset="us-ascii"


--1380461005.F24b7Acd1.22869
Date: Sun, 29 Sep 2013 13:23:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69928

          Priority: medium
            Bug ID: 69928
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVAA] Boot of linux kernel 3.12-rc2 hangs
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: dirkneukirchen-S0/GAf8tV78@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 86798
  --> https://bugs.freedesktop.org/attachment.cgi?id=86798&action=edit
3.12-rc2 fails to boot with NVAA

Steps to reproduce:
- Compiling Kernel 3.12-rc2 
- boot
- boot hangs at black screen/no signal

System:
- NVAA onboard (Jetway JNC62K)
- Linux Mint 15 (Ubuntu 13.04)

No error with 3.11.0 Kernel.

I compiled kernel 3.12-rc2 once as a dpkg and once with vanilla methods (make
install). Both same behaviour.

Attached are a netconsole log of 3.12-rc2 and a dmesg of a "working" 3.11.0


Example error message of 3.12-rc2:
[   22.081905] nouveau E[     PFB][0000:02:00.0] trapped write at 0x01002b75b4
on channel 0x00007ee0 [unknown] BAR/PFIFO_WRITE/IN reason: PAGE_NOT_PRESENT

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380461005.F24b7Acd1.22869
Date: Sun, 29 Sep 2013 13:23:25 +0000
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
   title="NEW --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69928">69928</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVAA] Boot of linux kernel 3.12-rc2 hangs
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
          <td>dirkneukirchen&#64;web.de
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=86798" name="attach_86798" title="3.12-rc2 fails to boot with NVAA">attachment 86798</a> <a href="attachment.cgi?id=86798&amp;action=edit" title="3.12-rc2 fails to boot with NVAA">[details]</a></span>
3.12-rc2 fails to boot with NVAA

Steps to reproduce:
- Compiling Kernel 3.12-rc2 
- boot
- boot hangs at black screen/no signal

System:
- NVAA onboard (Jetway JNC62K)
- Linux Mint 15 (Ubuntu 13.04)

No error with 3.11.0 Kernel.

I compiled kernel 3.12-rc2 once as a dpkg and once with vanilla methods (make
install). Both same behaviour.

Attached are a netconsole log of 3.12-rc2 and a dmesg of a &quot;working&quot; 3.11.0


Example error message of 3.12-rc2:
[   22.081905] nouveau E[     PFB][0000:02:00.0] trapped write at 0x01002b75b4
on channel 0x00007ee0 [unknown] BAR/PFIFO_WRITE/IN reason: PAGE_NOT_PRESENT</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380461005.F24b7Acd1.22869--

--===============1200902009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1200902009==--
