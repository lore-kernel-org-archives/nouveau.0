From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80769] New: [NVD9] GF119M boot hang with 3.15.2
Date: Tue, 01 Jul 2014 20:31:38 +0000
Message-ID: <bug-80769-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1114276116=="
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


--===============1114276116==
Content-Type: multipart/alternative; boundary="1404246698.DeB88D41.17157"; charset="us-ascii"


--1404246698.DeB88D41.17157
Date: Tue, 1 Jul 2014 20:31:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80769

          Priority: medium
            Bug ID: 80769
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVD9] GF119M boot hang with 3.15.2
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: sven.pilz+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 102095
  --> https://bugs.freedesktop.org/attachment.cgi?id=102095&action=edit
dmesg

Hello everybody.

I'm using a ThinkPad T420 with Optimus. Since 3.15 the boot hangs during KMS,
when I use the discrete card (GF119M [Quadro NVS 4200M]). With the Intel card
or Optimus, the system boots. Though I see those message from the kernel, also
after standby:
  nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT at 0x002140 [
!ENGINE ]

When I try to use the Nvidia card via PRIME with, the xserver crashes.

I tested the PRIME way with:
  xrandr --setprovideroffloadsink nouveau Intel
  DRI_PRIME=1 glxgears

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404246698.DeB88D41.17157
Date: Tue, 1 Jul 2014 20:31:38 +0000
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
   title="NEW --- - [NVD9] GF119M boot hang with 3.15.2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80769">80769</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVD9] GF119M boot hang with 3.15.2
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
          <td>sven.pilz+freedesktop&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=102095" name="attach_102095" title="dmesg">attachment 102095</a> <a href="attachment.cgi?id=102095&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

Hello everybody.

I'm using a ThinkPad T420 with Optimus. Since 3.15 the boot hangs during KMS,
when I use the discrete card (GF119M [Quadro NVS 4200M]). With the Intel card
or Optimus, the system boots. Though I see those message from the kernel, also
after standby:
  nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT at 0x002140 [
!ENGINE ]

When I try to use the Nvidia card via PRIME with, the xserver crashes.

I tested the PRIME way with:
  xrandr --setprovideroffloadsink nouveau Intel
  DRI_PRIME=1 glxgears</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404246698.DeB88D41.17157--

--===============1114276116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1114276116==--
