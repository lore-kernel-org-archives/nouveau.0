From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69168] New: Arbitrary crashes
Date: Tue, 10 Sep 2013 08:12:51 +0000
Message-ID: <bug-69168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1350377390=="
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


--===============1350377390==
Content-Type: multipart/alternative; boundary="1378800772.E72F866f1.30012"; charset="us-ascii"


--1378800772.E72F866f1.30012
Date: Tue, 10 Sep 2013 08:12:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69168

          Priority: medium
            Bug ID: 69168
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Arbitrary crashes
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: wompy-KK0ffGbhmjU@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 85540
  --> https://bugs.freedesktop.org/attachment.cgi?id=85540&action=edit
dmesg-log with log_buf_len=1M

Hi,
using nouveau on arch linux my system crashes arbitrarily. I tried to force it
with maximum load (running tons of videos in parallel) but it would crash with
log on. Unplugging the external monitor was finally the trigger, even though I
am not sure if that is my actual problem. The picture on my external monitor
looks crappy (don't know how to describe, but some kind of "fuzzy", like Win
98) even though the right resolution 1920*1080 is used. 
uname -a
Linux wom 3.11.0-1-ARCH #1 SMP PREEMPT Tue Sep 3 08:58:01 CEST 2013 x86_64
GNU/Linux

lspci|grep NVIDIA
01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [GeForce 310M]
(rev a2)
01:00.1 Audio device: NVIDIA Corporation High Definition Audio Controller (rev
a1)

xf86-video-nouveau-1.0.9-1
mesa-9.2.0-1
libdrm-2.4.46-2

Attached the dmesg-log with log_buf_len=1M

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378800772.E72F866f1.30012
Date: Tue, 10 Sep 2013 08:12:52 +0000
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
   title="NEW --- - Arbitrary crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69168">69168</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Arbitrary crashes
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
          <td>wompy&#64;gmx.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=85540" name="attach_85540" title="dmesg-log with log_buf_len=1M">attachment 85540</a> <a href="attachment.cgi?id=85540&amp;action=edit" title="dmesg-log with log_buf_len=1M">[details]</a></span>
dmesg-log with log_buf_len=1M

Hi,
using nouveau on arch linux my system crashes arbitrarily. I tried to force it
with maximum load (running tons of videos in parallel) but it would crash with
log on. Unplugging the external monitor was finally the trigger, even though I
am not sure if that is my actual problem. The picture on my external monitor
looks crappy (don't know how to describe, but some kind of &quot;fuzzy&quot;, like Win
98) even though the right resolution 1920*1080 is used. 
uname -a
Linux wom 3.11.0-1-ARCH #1 SMP PREEMPT Tue Sep 3 08:58:01 CEST 2013 x86_64
GNU/Linux

lspci|grep NVIDIA
01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [GeForce 310M]
(rev a2)
01:00.1 Audio device: NVIDIA Corporation High Definition Audio Controller (rev
a1)

xf86-video-nouveau-1.0.9-1
mesa-9.2.0-1
libdrm-2.4.46-2

Attached the dmesg-log with log_buf_len=1M</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378800772.E72F866f1.30012--

--===============1350377390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1350377390==--
