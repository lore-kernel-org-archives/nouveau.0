From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] New: NV30: Xfwm4 use_compositing - garbled
	display
Date: Fri, 05 Jun 2015 14:04:44 +0000
Message-ID: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2130164363=="
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


--===============2130164363==
Content-Type: multipart/alternative; boundary="1433513084.a842ba1.12207"; charset="UTF-8"


--1433513084.a842ba1.12207
Date: Fri, 5 Jun 2015 14:04:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

            Bug ID: 90871
           Summary: NV30: Xfwm4 use_compositing -  garbled display
           Product: xorg
           Version: unspecified
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Garbled display
~~~~~~~~~~~~~~~


Chipset: NV34 (NV34)
Family : NV30

NVIDIA Corporation NV34 [GeForce FX 5200]
Kernel driver in use: nouveau
Kernel modules: nouveau
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Fedora 22 i686


1. Starting from - Xpresent support: no

commit fee08eafa751a153ff93b04152ea66334141cac5
Author: Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org>
Date:   Thu Apr 9 23:06:38 2015 +0200

    compositor: Add support for GLX

    Bug: 10439

    Using texture-from-pixmap extension.

    Signed-off-by: Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org>


Build Configuration for xfwm4 version 4.12.0git.fee08ea revision fee08ea:
  Startup notification support: yes
  XSync support:                yes
  Render support:               yes
  Xrandr support:               yes
  Xpresent support:             no
  Embedded compositor:          yes
  Epoxy support:                yes
  KDE systray protocol proxy:   no


~~~~~~~~~~ ~~~~~~~~~ ~~~~~~~~ ~~~~~~~ ~~~~~~ ~~~~~ ~~~~ ~~~ ~~ ~


2. Starting from - Xpresent support: yes

commit aee242cec4c3d8e8232d67875ec9fbfbeb504a9d
Author: Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org>
Date:   Mon Apr 27 21:40:27 2015 +0200

    compositor: Prefer GL over Present

    If both are available, try to use GL first and next Present.

    Signed-off-by: Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org>


Build Configuration for xfwm4 version 4.12.0git.aee242c revision aee242c:
  Startup notification support: yes
  XSync support:                yes
  Render support:               yes
  Xrandr support:               yes
  Xpresent support:             yes
  Embedded compositor:          yes
  Epoxy support:                yes
  KDE systray protocol proxy:   no



https://bugzilla.xfce.org/show_bug.cgi?id=11962

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1433513084.a842ba1.12207
Date: Fri, 5 Jun 2015 14:04:44 +0000
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
   title="NEW - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">90871</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV30: Xfwm4 use_compositing -  garbled display
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
          <td>x86 (IA32)
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
          <td>critical
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
          <td>pomidorabelisima&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Garbled display
~~~~~~~~~~~~~~~


Chipset: NV34 (NV34)
Family : NV30

NVIDIA Corporation NV34 [GeForce FX 5200]
Kernel driver in use: nouveau
Kernel modules: nouveau
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Fedora 22 i686


1. Starting from - Xpresent support: no

commit fee08eafa751a153ff93b04152ea66334141cac5
Author: Olivier Fourdan &lt;<a href="mailto:fourdan&#64;xfce.org">fourdan&#64;xfce.org</a>&gt;
Date:   Thu Apr 9 23:06:38 2015 +0200

    compositor: Add support for GLX

    Bug: 10439

    Using texture-from-pixmap extension.

    Signed-off-by: Olivier Fourdan &lt;<a href="mailto:fourdan&#64;xfce.org">fourdan&#64;xfce.org</a>&gt;


Build Configuration for xfwm4 version 4.12.0git.fee08ea revision fee08ea:
  Startup notification support: yes
  XSync support:                yes
  Render support:               yes
  Xrandr support:               yes
  Xpresent support:             no
  Embedded compositor:          yes
  Epoxy support:                yes
  KDE systray protocol proxy:   no


~~~~~~~~~~ ~~~~~~~~~ ~~~~~~~~ ~~~~~~~ ~~~~~~ ~~~~~ ~~~~ ~~~ ~~ ~


2. Starting from - Xpresent support: yes

commit aee242cec4c3d8e8232d67875ec9fbfbeb504a9d
Author: Olivier Fourdan &lt;<a href="mailto:fourdan&#64;xfce.org">fourdan&#64;xfce.org</a>&gt;
Date:   Mon Apr 27 21:40:27 2015 +0200

    compositor: Prefer GL over Present

    If both are available, try to use GL first and next Present.

    Signed-off-by: Olivier Fourdan &lt;<a href="mailto:fourdan&#64;xfce.org">fourdan&#64;xfce.org</a>&gt;


Build Configuration for xfwm4 version 4.12.0git.aee242c revision aee242c:
  Startup notification support: yes
  XSync support:                yes
  Render support:               yes
  Xrandr support:               yes
  Xpresent support:             yes
  Embedded compositor:          yes
  Epoxy support:                yes
  KDE systray protocol proxy:   no



<a href="https://bugzilla.xfce.org/show_bug.cgi?id=11962">https://bugzilla.xfce.org/show_bug.cgi?id=11962</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1433513084.a842ba1.12207--

--===============2130164363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2130164363==--
