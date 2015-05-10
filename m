From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90390] New: [NV98] Modesetting causes blank screen
 because of INVALID_STATE [UNK0B] chid 1 mthd 0x0080 data 0x00000000
Date: Sun, 10 May 2015 19:53:30 +0000
Message-ID: <bug-90390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1155254762=="
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


--===============1155254762==
Content-Type: multipart/alternative; boundary="1431287610.075B441.27234"; charset="UTF-8"


--1431287610.075B441.27234
Date: Sun, 10 May 2015 19:53:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90390

            Bug ID: 90390
           Summary: [NV98] Modesetting causes blank screen because of
                    INVALID_STATE [UNK0B] chid 1 mthd 0x0080 data
                    0x00000000
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: analizer-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Environment:
Video card: GeForce 9300M GS (laptop)
Kernel: 4.0.2-gentoo

Steps to reproduce:
1. Boot
2. modprobe drm_kms_heloper
3. modprobe nouveau

Expected result:
Framebuffer initialization
Actually after dozen attempts I had framebuffer initialized once, background
was red, foreground was black and I never was able to achieve this again.

Actual result:
Blank screen. Still able to process keyboard input, so kernel log can be
gathered and system can be safely rebooted.

Results with various parameters:
With `nouveau.noaccel=1` I'm getting black screen instead of blank screen and
system is not responsive to keyboard input.
With `nouveau.modeset=0` nothing happens after `modprobe nouveau`, this makes
me think this is a modesetting issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431287610.075B441.27234
Date: Sun, 10 May 2015 19:53:30 +0000
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
   title="NEW - [NV98] Modesetting causes blank screen because of INVALID_STATE [UNK0B] chid 1 mthd 0x0080 data 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90390">90390</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV98] Modesetting causes blank screen because of INVALID_STATE [UNK0B] chid 1 mthd 0x0080 data 0x00000000
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
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
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
          <td>analizer&#64;yandex.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Environment:
Video card: GeForce 9300M GS (laptop)
Kernel: 4.0.2-gentoo

Steps to reproduce:
1. Boot
2. modprobe drm_kms_heloper
3. modprobe nouveau

Expected result:
Framebuffer initialization
Actually after dozen attempts I had framebuffer initialized once, background
was red, foreground was black and I never was able to achieve this again.

Actual result:
Blank screen. Still able to process keyboard input, so kernel log can be
gathered and system can be safely rebooted.

Results with various parameters:
With `nouveau.noaccel=1` I'm getting black screen instead of blank screen and
system is not responsive to keyboard input.
With `nouveau.modeset=0` nothing happens after `modprobe nouveau`, this makes
me think this is a modesetting issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431287610.075B441.27234--

--===============1155254762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1155254762==--
