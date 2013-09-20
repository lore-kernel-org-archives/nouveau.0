From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69594] New: NVA3 - Flash overlays all tabs
Date: Fri, 20 Sep 2013 06:42:35 +0000
Message-ID: <bug-69594-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0988868552=="
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


--===============0988868552==
Content-Type: multipart/alternative; boundary="1379659355.CCFee2E30.28042"; charset="us-ascii"


--1379659355.CCFee2E30.28042
Date: Fri, 20 Sep 2013 06:42:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69594

          Priority: medium
            Bug ID: 69594
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: NVA3 - Flash overlays all tabs
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: tod.jackson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 86170
  --> https://bugs.freedesktop.org/attachment.cgi?id=86170&action=edit
current dmesg

This is probably a VDPAU problem since I can't reproduce it like 'DRI_PRIME=1
VDPAU_DRIVER="" chromium-browser'. Granted it's pointless for me to do this,
but I was trying to reproduce another crash that's similar to another NVA3
report on here (bug 69465). I wanted to listen to some music until it crashed
and noticed the Flash bug. ;)

Anyway,
1. DRI_PRIME=1 chromium-browser (which I guess defaults to
VDPAU_DRIVER=nouveau)
2. go to www.youtube.com and play a video
3. open new tabs

The Flash video is overlaying all the other tabs. Alas, there's nothing at all
in dmesg. I'm pretty sure I have the latest firmware. Note: this is Adobe
Flash, not Pepper Flash.

For what it's worth, DRI_PRIME=1 VDPAU_DRIVER=nouveau mplayer -vo vdpau
file.avi works fine.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379659355.CCFee2E30.28042
Date: Fri, 20 Sep 2013 06:42:35 +0000
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
   title="NEW --- - NVA3 - Flash overlays all tabs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69594">69594</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NVA3 - Flash overlays all tabs
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
        <pre>Created <span class=""><a href="attachment.cgi?id=86170" name="attach_86170" title="current dmesg">attachment 86170</a> <a href="attachment.cgi?id=86170&amp;action=edit" title="current dmesg">[details]</a></span>
current dmesg

This is probably a VDPAU problem since I can't reproduce it like 'DRI_PRIME=1
VDPAU_DRIVER=&quot;&quot; chromium-browser'. Granted it's pointless for me to do this,
but I was trying to reproduce another crash that's similar to another NVA3
report on here (<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kernel freeze with NVA3 kernel 3.11.1 / PGRAPH][0000:01:00.0] PGRAPH TLB flush idle timeout fail"
   href="show_bug.cgi?id=69465">bug 69465</a>). I wanted to listen to some music until it crashed
and noticed the Flash bug. ;)

Anyway,
1. DRI_PRIME=1 chromium-browser (which I guess defaults to
VDPAU_DRIVER=nouveau)
2. go to www.youtube.com and play a video
3. open new tabs

The Flash video is overlaying all the other tabs. Alas, there's nothing at all
in dmesg. I'm pretty sure I have the latest firmware. Note: this is Adobe
Flash, not Pepper Flash.

For what it's worth, DRI_PRIME=1 VDPAU_DRIVER=nouveau mplayer -vo vdpau
file.avi works fine.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379659355.CCFee2E30.28042--

--===============0988868552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0988868552==--
