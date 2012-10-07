From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55744] New: Hangs on resume
Date: Sun, 07 Oct 2012 20:48:01 +0000
Message-ID: <bug-55744-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0476616904=="
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


--===============0476616904==
Content-Type: multipart/alternative; boundary="1349642882.8Cfb6C5F1.29243"; charset="us-ascii"


--1349642882.8Cfb6C5F1.29243
Date: Sun, 7 Oct 2012 20:48:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55744

          Priority: medium
            Bug ID: 55744
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Hangs on resume
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: francois5537-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 68228
  --> https://bugs.freedesktop.org/attachment.cgi?id=68228&action=edit
kernel_log.txt

OS: Archlinux
Drivers: xf86-video-nouveau-git
DE: Gnome-shell 3.6
Kernel: Linux ArchDesktop 3.6.0-1-ARCH #1 SMP PREEMPT Mon Oct 1 20:51:05 CEST
2012 x86_64 GNU/Linux
MB: ASUS P8H67-M Pro
GPU: EVGA GeForce 450 GTS (1GB)

Their is no problem when going to sleep-modes.
When resume the session their are all coloured blocks and stripes, and the
session seems to be hanging/freezing.

I have tried the Linux Kernel 3.5 and Linux Kernel 3.6, latest nouveau-drivers
but the problem still exist.

You can see the problem here:
https://www.dropbox.com/s/dk7xzerzdxzzphq/2012-10-06%2019.26.26.jpg

I never had this issue with the official nvidia drivers, but I haven't tried it
yet because this is running on an UEFI-system.

Hope the issue can be fixed. :)

Thanks.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1349642882.8Cfb6C5F1.29243
Date: Sun, 7 Oct 2012 20:48:02 +0000
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
   title="NEW --- - Hangs on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55744">55744</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Hangs on resume
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>francois5537&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=68228" name="attach_68228" title="kernel_log.txt">attachment 68228</a> <a href="attachment.cgi?id=68228&amp;action=edit" title="kernel_log.txt">[details]</a></span>
kernel_log.txt

OS: Archlinux
Drivers: xf86-video-nouveau-git
DE: Gnome-shell 3.6
Kernel: Linux ArchDesktop 3.6.0-1-ARCH #1 SMP PREEMPT Mon Oct 1 20:51:05 CEST
2012 x86_64 GNU/Linux
MB: ASUS P8H67-M Pro
GPU: EVGA GeForce 450 GTS (1GB)

Their is no problem when going to sleep-modes.
When resume the session their are all coloured blocks and stripes, and the
session seems to be hanging/freezing.

I have tried the Linux Kernel 3.5 and Linux Kernel 3.6, latest nouveau-drivers
but the problem still exist.

You can see the problem here:
<a href="https://www.dropbox.com/s/dk7xzerzdxzzphq/2012-10-06%2019.26.26.jpg">https://www.dropbox.com/s/dk7xzerzdxzzphq/2012-10-06%2019.26.26.jpg</a>

I never had this issue with the official nvidia drivers, but I haven't tried it
yet because this is running on an UEFI-system.

Hope the issue can be fixed. :)

Thanks.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1349642882.8Cfb6C5F1.29243--

--===============0476616904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0476616904==--
