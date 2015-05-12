From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90423] New: [NVAA]: Shutdown (poweroff) get stuck
 when runtime PM is enabled
Date: Tue, 12 May 2015 16:04:45 +0000
Message-ID: <bug-90423-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2069975732=="
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


--===============2069975732==
Content-Type: multipart/alternative; boundary="1431446685.28e5E561.20994"; charset="UTF-8"


--1431446685.28e5E561.20994
Date: Tue, 12 May 2015 16:04:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90423

            Bug ID: 90423
           Summary: [NVAA]: Shutdown (poweroff) get stuck when runtime PM
                    is enabled
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: alexanders83-S0/GAf8tV78@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I'm currently running a 3.19 kernel where I looked into the problem that one of
my systems doesn't shutdown cleanly most of the time. THis behavior started
from some older kernels, I _guess_ it's 5addcf0a5f0fadc ("nouveau: add runtime
PM support (v0.9").
My board is a Asus M3N78-EM with a
> 02:00.0 VGA compatible controller: NVIDIA Corporation C77 [GeForce 8300] (rev a2)

During shutdown dmesg shows the following:
[   38.476675] systemd-shutdown[1]: Powering off.
[   38.536997] sd 1:0:0:0: [sdb] Synchronizing SCSI cache
[   38.542522] sd 1:0:0:0: [sdb] Stopping disk
[   41.069224] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[   41.074745] sd 0:0:0:0: [sda] Stopping disk

That's all.

I added some printk to my source tree and could trace the shutdown execution
path down to __pm_runtime_barrier where dev->power.runtime_status == 3. The
call to schedule() finally seems to be the deadlock.
Of course, if I compile my kernel with CONFIG_PM=n everything is fine.
Reenabling it again the problem occurs again.
A workaround suggested on IRC is to set runpm=0. This seems to work as the
system did clean shutdowns from this change on.
As I consider this really as a workaround I would like to fix this.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431446685.28e5E561.20994
Date: Tue, 12 May 2015 16:04:45 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAA]: Shutdown (poweroff) get stuck when runtime PM is enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90423">90423</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVAA]: Shutdown (poweroff) get stuck when runtime PM is enabled
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>alexanders83&#64;web.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I'm currently running a 3.19 kernel where I looked into the problem that one of
my systems doesn't shutdown cleanly most of the time. THis behavior started
from some older kernels, I _guess_ it's 5addcf0a5f0fadc (&quot;nouveau: add runtime
PM support (v0.9&quot;).
My board is a Asus M3N78-EM with a
<span class="quote">&gt; 02:00.0 VGA compatible controller: NVIDIA Corporation C77 [GeForce 8300] (rev a2)</span >

During shutdown dmesg shows the following:
[   38.476675] systemd-shutdown[1]: Powering off.
[   38.536997] sd 1:0:0:0: [sdb] Synchronizing SCSI cache
[   38.542522] sd 1:0:0:0: [sdb] Stopping disk
[   41.069224] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[   41.074745] sd 0:0:0:0: [sda] Stopping disk

That's all.

I added some printk to my source tree and could trace the shutdown execution
path down to __pm_runtime_barrier where dev-&gt;power.runtime_status == 3. The
call to schedule() finally seems to be the deadlock.
Of course, if I compile my kernel with CONFIG_PM=n everything is fine.
Reenabling it again the problem occurs again.
A workaround suggested on IRC is to set runpm=0. This seems to work as the
system did clean shutdowns from this change on.
As I consider this really as a workaround I would like to fix this.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431446685.28e5E561.20994--

--===============2069975732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2069975732==--
