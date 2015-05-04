From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90306] New: Nouveau crashes with multiple monitors
Date: Mon, 04 May 2015 20:55:46 +0000
Message-ID: <bug-90306-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1209578185=="
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


--===============1209578185==
Content-Type: multipart/alternative; boundary="1430772946.aCdC1.14175"; charset="UTF-8"


--1430772946.aCdC1.14175
Date: Mon, 4 May 2015 20:55:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90306

            Bug ID: 90306
           Summary: Nouveau crashes with multiple monitors
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ofpoj.20.Toranaga-San-w1QkCcy0X+BxKfgMtfWJuA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hello all,

I would like to direct your attention to this bug report from the arch linux
tracker:

https://bugs.archlinux.org/task/42121

Essentially the X server crashes when using nouveau with multiple monitors.
Whenever an xrandr command is issued the server crashes. This is particularly
irksome since this seems to send the monitors into power-saving mode (i.e. no
more signals are sent) so that the problem can't even be resolved from a shell.

I am not the author of the bug report above, I merely googled the error

/usr/bin/Xorg.bin: symbol lookup error:
/usr/lib/xorg/modules/drivers/nouveau_drv.so: undefined symbol:
exaGetPixmapDriverPrivate

So this seems to affect multiple users. I am currently running debian jessie
using version 1.0.11 of xserver-xorg-video-nouveau and version 7.7+3~deb7u1 of
xorg-xserver but I ran into the same problem with arch a couple of weeks ago.

I would very much appreciate any help with this. This bug *really* breaks my
setup.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1430772946.aCdC1.14175
Date: Mon, 4 May 2015 20:55:46 +0000
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
   title="NEW - Nouveau crashes with multiple monitors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90306">90306</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau crashes with multiple monitors
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
          <td>ofpoj.20.Toranaga-San&#64;spamgourmet.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello all,

I would like to direct your attention to this bug report from the arch linux
tracker:

<a href="https://bugs.archlinux.org/task/42121">https://bugs.archlinux.org/task/42121</a>

Essentially the X server crashes when using nouveau with multiple monitors.
Whenever an xrandr command is issued the server crashes. This is particularly
irksome since this seems to send the monitors into power-saving mode (i.e. no
more signals are sent) so that the problem can't even be resolved from a shell.

I am not the author of the bug report above, I merely googled the error

/usr/bin/Xorg.bin: symbol lookup error:
/usr/lib/xorg/modules/drivers/nouveau_drv.so: undefined symbol:
exaGetPixmapDriverPrivate

So this seems to affect multiple users. I am currently running debian jessie
using version 1.0.11 of xserver-xorg-video-nouveau and version 7.7+3~deb7u1 of
xorg-xserver but I ran into the same problem with arch a couple of weeks ago.

I would very much appreciate any help with this. This bug *really* breaks my
setup.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1430772946.aCdC1.14175--

--===============1209578185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1209578185==--
