From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55412] New: Screen turns black during boot after
 driver tries to set mode on NV50
Date: Fri, 28 Sep 2012 11:51:39 +0000
Message-ID: <bug-55412-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2100198932=="
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


--===============2100198932==
Content-Type: multipart/alternative; boundary="1348833099.A881CdC31.23567"; charset="us-ascii"


--1348833099.A881CdC31.23567
Date: Fri, 28 Sep 2012 11:51:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55412

          Priority: medium
            Bug ID: 55412
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Screen turns black during boot after driver tries to
                    set mode on NV50
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: lubosz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 67816
  --> https://bugs.freedesktop.org/attachment.cgi?id=67816&action=edit
kernel log without flags

The following commit on current nouveau git master breaks setting a valid
resolution at boot and results in a black screen.

commit 97d6852410a83e413d85649cb2cc10e17d6ee2ab
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Thu Jul 26 08:51:21 2012 +1000

    drm/nouveau/acpi: move definitions out of nouveau_drv.h

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

An interesting thing about this bug is that it can be avoided with adding the
kernel flag nouveau.reg_debug=0x600. With this flag a wrong resolution is set
at boot and the screen does not turn black. The X Server cannot start anyway.

My native resolution is 1366x768. GRUB_GFXMODE is 1360x768x32, since the
greater resolution is not listed in grub's vbeinfo.
nouveau and blob run X with 1366x768.

I will attach a log with and without the flag at commit
97d6852410a83e413d85649cb2cc10e17d6ee2ab.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1348833099.A881CdC31.23567
Date: Fri, 28 Sep 2012 11:51:39 +0000
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
   title="NEW --- - Screen turns black during boot after driver tries to set mode on NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55412">55412</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Screen turns black during boot after driver tries to set mode on NV50
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
          <td>lubosz&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=67816" name="attach_67816" title="kernel log without flags">attachment 67816</a> <a href="attachment.cgi?id=67816&amp;action=edit" title="kernel log without flags">[details]</a></span>
kernel log without flags

The following commit on current nouveau git master breaks setting a valid
resolution at boot and results in a black screen.

commit 97d6852410a83e413d85649cb2cc10e17d6ee2ab
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Thu Jul 26 08:51:21 2012 +1000

    drm/nouveau/acpi: move definitions out of nouveau_drv.h

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

An interesting thing about this bug is that it can be avoided with adding the
kernel flag nouveau.reg_debug=0x600. With this flag a wrong resolution is set
at boot and the screen does not turn black. The X Server cannot start anyway.

My native resolution is 1366x768. GRUB_GFXMODE is 1360x768x32, since the
greater resolution is not listed in grub's vbeinfo.
nouveau and blob run X with 1366x768.

I will attach a log with and without the flag at commit
97d6852410a83e413d85649cb2cc10e17d6ee2ab.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1348833099.A881CdC31.23567--

--===============2100198932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2100198932==--
