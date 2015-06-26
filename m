From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91119] New: [NVE4] GPU hangs when opening several
 Firefox tabs at once
Date: Fri, 26 Jun 2015 20:35:19 +0000
Message-ID: <bug-91119-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1276519700=="
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


--===============1276519700==
Content-Type: multipart/alternative; boundary="1435350919.bd561.21403"; charset="UTF-8"


--1435350919.bd561.21403
Date: Fri, 26 Jun 2015 20:35:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91119

            Bug ID: 91119
           Summary: [NVE4] GPU hangs when opening several Firefox tabs at
                    once
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mbarrera-KK0ffGbhmjU@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

When opening several (about 30) saved HTML pages at once in Firefox all video
freezes and it becomes impossible to switch TTYs probably because the keyboard
stops responding.

I can reproduce this problem always and I have done it under:
    XFCE with compiz + emerald
    XFCE with xfwm
    XFCE with no WM
    Enlightenment
    Gnome 3
    Gnome 3 under Wayland (though Firefox uses XWayland)

Sometimes the screen freezes, sometimes it goes black, sometimes the image
distorts or changes its colours. Sometimes the mouse pointer is still movable.

lsmod, dmesg and Xorg.log attached for the times I reproduced today.

# System info

% uname -a
Linux localhost 4.0.5-1-ARCH #1 SMP PREEMPT Sat Jun 6 18:37:49 CEST 2015 x86_64
GNU/Linux

% lspci | grep VGA 
01:00.0 VGA compatible controller: NVIDIA Corporation GK104M [GeForce GTX
670MX] (rev a1)

# Relevant packages

glu 9.0.0-3
libdrm 2.4.61-1
libtxc_dxtn 1.0.1-6
mesa 10.6.0-1
mesa-demos 8.2.0-4
mesa-libgl 10.6.0-1
mesa-vdpau 10.6.0-1
nouveau-fw 325.15-1
opencl-mesa 10.6.0-1
xf86-video-nouveau 1.0.11-3

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1435350919.bd561.21403
Date: Fri, 26 Jun 2015 20:35:19 +0000
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
   title="NEW - [NVE4] GPU hangs when opening several Firefox tabs at once"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91119">91119</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE4] GPU hangs when opening several Firefox tabs at once
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
          <td>blocker
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
          <td>mbarrera&#64;gmx.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When opening several (about 30) saved HTML pages at once in Firefox all video
freezes and it becomes impossible to switch TTYs probably because the keyboard
stops responding.

I can reproduce this problem always and I have done it under:
    XFCE with compiz + emerald
    XFCE with xfwm
    XFCE with no WM
    Enlightenment
    Gnome 3
    Gnome 3 under Wayland (though Firefox uses XWayland)

Sometimes the screen freezes, sometimes it goes black, sometimes the image
distorts or changes its colours. Sometimes the mouse pointer is still movable.

lsmod, dmesg and Xorg.log attached for the times I reproduced today.

# System info

% uname -a
Linux localhost 4.0.5-1-ARCH #1 SMP PREEMPT Sat Jun 6 18:37:49 CEST 2015 x86_64
GNU/Linux

% lspci | grep VGA 
01:00.0 VGA compatible controller: NVIDIA Corporation GK104M [GeForce GTX
670MX] (rev a1)

# Relevant packages

glu 9.0.0-3
libdrm 2.4.61-1
libtxc_dxtn 1.0.1-6
mesa 10.6.0-1
mesa-demos 8.2.0-4
mesa-libgl 10.6.0-1
mesa-vdpau 10.6.0-1
nouveau-fw 325.15-1
opencl-mesa 10.6.0-1
xf86-video-nouveau 1.0.11-3</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1435350919.bd561.21403--

--===============1276519700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1276519700==--
