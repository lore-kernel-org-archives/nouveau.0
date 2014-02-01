From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74320] New: Screen freeze with flashplugin-nonfree
Date: Sat, 01 Feb 2014 14:03:26 +0000
Message-ID: <bug-74320-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0855430220=="
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


--===============0855430220==
Content-Type: multipart/alternative; boundary="1391263406.5e7EbAE31.12875"; charset="us-ascii"


--1391263406.5e7EbAE31.12875
Date: Sat, 1 Feb 2014 14:03:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74320

          Priority: medium
            Bug ID: 74320
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Screen freeze with flashplugin-nonfree
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: shuihuzhuan-GANU6spQydw@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 93167
  --> https://bugs.freedesktop.org/attachment.cgi?id=93167&action=edit
System journal

Hello,

Here is the config :

cpu : AMD64
Video card : 7600GT (NV40 family)
kernel : 3.12.9
nouveau-dri : 10.0.2
xf86-video-nouveau : 1.0.10
mesa : 10.0.2
flashplugin : 11.2.202.332
gnome-shell : 3.10.3
firefox : 26.0

When I want to see the video at this link
(https://www.youtube.com/watch?v=jT92qfriNCA) the screen freezes. I can only
use the magic-sys-key to reboot.

Here is the complete journalctl --system from boot to freeze (at 19:26:06).
There are a lot of :

nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 16 [plugin-containe[5002]]
subc 7 mthd 0x0000 data 0xbeef3097

and near the end :

nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
janv. 28 19:32:45 maisondubonheur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch
7 [0x001e0000 plugin-containe[5037]] subc 7 class 0x4097 mthd 0x0208 data
0x00000120
janv. 28 19:32:45 maisondubonheur kernel: nouveau E[  PGRAPH][0000:01:00.0] 
ERROR nsource: LIMIT_ZETA nstatus: BAD_ARGUMENT PROTECTION_FAULT
janv. 28 19:32:45 maisondubonheur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch
7 [0x001e0000 plugin-containe[5037]] subc 7 class 0x4097 mthd 0x0204 data
0x00c00000

I can't do a lot of testing on that computer (my wife needs it for her work),
but if I can help...

Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391263406.5e7EbAE31.12875
Date: Sat, 1 Feb 2014 14:03:26 +0000
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
   title="NEW --- - Screen freeze with flashplugin-nonfree"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74320">74320</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Screen freeze with flashplugin-nonfree
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
          <td>shuihuzhuan&#64;free.fr
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
        <pre>Created <span class=""><a href="attachment.cgi?id=93167" name="attach_93167" title="System journal">attachment 93167</a> <a href="attachment.cgi?id=93167&amp;action=edit" title="System journal">[details]</a></span>
System journal

Hello,

Here is the config :

cpu : AMD64
Video card : 7600GT (NV40 family)
kernel : 3.12.9
nouveau-dri : 10.0.2
xf86-video-nouveau : 1.0.10
mesa : 10.0.2
flashplugin : 11.2.202.332
gnome-shell : 3.10.3
firefox : 26.0

When I want to see the video at this link
(<a href="https://www.youtube.com/watch?v=jT92qfriNCA">https://www.youtube.com/watch?v=jT92qfriNCA</a>) the screen freezes. I can only
use the magic-sys-key to reboot.

Here is the complete journalctl --system from boot to freeze (at 19:26:06).
There are a lot of :

nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 16 [plugin-containe[5002]]
subc 7 mthd 0x0000 data 0xbeef3097

and near the end :

nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT
janv. 28 19:32:45 maisondubonheur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch
7 [0x001e0000 plugin-containe[5037]] subc 7 class 0x4097 mthd 0x0208 data
0x00000120
janv. 28 19:32:45 maisondubonheur kernel: nouveau E[  PGRAPH][0000:01:00.0] 
ERROR nsource: LIMIT_ZETA nstatus: BAD_ARGUMENT PROTECTION_FAULT
janv. 28 19:32:45 maisondubonheur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch
7 [0x001e0000 plugin-containe[5037]] subc 7 class 0x4097 mthd 0x0204 data
0x00c00000

I can't do a lot of testing on that computer (my wife needs it for her work),
but if I can help...

Thanks</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391263406.5e7EbAE31.12875--

--===============0855430220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0855430220==--
