From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90351] New: [Regression,
 bisected] Backlight of internal eDP display doesn't turn off any
 more (Dell XPS 17/GeForce GT 555M)
Date: Wed, 06 May 2015 21:36:08 +0000
Message-ID: <bug-90351-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0794845788=="
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


--===============0794845788==
Content-Type: multipart/alternative; boundary="1430948168.345efc1.21282"; charset="UTF-8"


--1430948168.345efc1.21282
Date: Wed, 6 May 2015 21:36:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90351

            Bug ID: 90351
           Summary: [Regression, bisected] Backlight of internal eDP
                    display doesn't turn off any more (Dell XPS 17/GeForce
                    GT 555M)
           Product: xorg
           Version: git
          Hardware: Other
               URL: https://bugzilla.redhat.com/show_bug.cgi?id=1123661
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: erik-freedesktop-bugzilla-7hpmIAI+aCYpZwe9G04TCw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 115605
  --> https://bugs.freedesktop.org/attachment.cgi?id=115605&action=edit
Patch which resolves the issue on the internal display for me

This bug was already filed quite some time ago in the Fedora bugzilla
(https://bugzilla.redhat.com/show_bug.cgi?id=1123661) but due to lack of
response there I've now filed the bug here. Here's a recap of the details
mentioned in the downstream bug report:

Between kernel 3.16.0-0.rc0.git9.1 and 3.16.0-0.rc0.git10.1 a regression got
introduced. After this kernel update the backlight on the internal display on
my notebook (Dell XPS 17/Geforce GT 555M) doesn't turn off any more.

Together with Hans de Goede we tried some additional kernel boot parameters
(like acpi_backlight=vendor) but those didn't resolve the issue.

The issue is still valid with the latest 4.1 development kernels on a Fedora 22
environment.

A git bisect was done to find out the exact commit which caused the regression
and this turned out to be:

commit 4874322e78d505d38c8d4481118af5c9f0e8306d
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Sat May 31 01:48:06 2014 +1000

    drm/nouveau/dp: fix support for dpms

    SOR_PWR has no effect to power-off DP links, unlike other SOR protocols.

    Instead, on the source side, we cut power to the lanes after having put
    the sink into D3.  Link training takes care of everything required to
    bring it back again.

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>


By now the code in question has seen some rewrites, but I found out that
removing the "args.pwr.state = 1;" instruction from the nv50_sor_dpms function
(see attached patch) resolves the issue for me. With this change the backlight
of the internal display on my notebook now properly turns off whenever I try to
lock my desktop.

Unfortunately this patch doesn't resolve all display related issues I'm having
with nouveau. There's also an external display connected to my notebook (using
a mini-DP connection) which shows a similar issue. Whenever I lock my desktop
the external display goes black (with the backlight off), but after about 8
seconds the backlight suddenly turns back on and remains on. The backlight on
my internal display remains off (with the patch applied). I've tested various
kernels (from 3.16 to current 4.1) and none are able to properly turn off the
external display (it may have worked in the past, but I can't get it reproduced
at the moment).

Any ideas where to go from here?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1430948168.345efc1.21282
Date: Wed, 6 May 2015 21:36:08 +0000
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
   title="NEW - [Regression, bisected] Backlight of internal eDP display doesn't turn off any more (Dell XPS 17/GeForce GT 555M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90351">90351</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Regression, bisected] Backlight of internal eDP display doesn't turn off any more (Dell XPS 17/GeForce GT 555M)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>URL</th>
          <td>https://bugzilla.redhat.com/show_bug.cgi?id=1123661
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
          <td>erik-freedesktop-bugzilla&#64;vanpienbroek.nl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=115605" name="attach_115605" title="Patch which resolves the issue on the internal display for me">attachment 115605</a> <a href="attachment.cgi?id=115605&amp;action=edit" title="Patch which resolves the issue on the internal display for me">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=90351&amp;attachment=115605'>[review]</a>
Patch which resolves the issue on the internal display for me

This bug was already filed quite some time ago in the Fedora bugzilla
(<a href="https://bugzilla.redhat.com/show_bug.cgi?id=1123661">https://bugzilla.redhat.com/show_bug.cgi?id=1123661</a>) but due to lack of
response there I've now filed the bug here. Here's a recap of the details
mentioned in the downstream bug report:

Between kernel 3.16.0-0.rc0.git9.1 and 3.16.0-0.rc0.git10.1 a regression got
introduced. After this kernel update the backlight on the internal display on
my notebook (Dell XPS 17/Geforce GT 555M) doesn't turn off any more.

Together with Hans de Goede we tried some additional kernel boot parameters
(like acpi_backlight=vendor) but those didn't resolve the issue.

The issue is still valid with the latest 4.1 development kernels on a Fedora 22
environment.

A git bisect was done to find out the exact commit which caused the regression
and this turned out to be:

commit 4874322e78d505d38c8d4481118af5c9f0e8306d
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Sat May 31 01:48:06 2014 +1000

    drm/nouveau/dp: fix support for dpms

    SOR_PWR has no effect to power-off DP links, unlike other SOR protocols.

    Instead, on the source side, we cut power to the lanes after having put
    the sink into D3.  Link training takes care of everything required to
    bring it back again.

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;


By now the code in question has seen some rewrites, but I found out that
removing the &quot;args.pwr.state = 1;&quot; instruction from the nv50_sor_dpms function
(see attached patch) resolves the issue for me. With this change the backlight
of the internal display on my notebook now properly turns off whenever I try to
lock my desktop.

Unfortunately this patch doesn't resolve all display related issues I'm having
with nouveau. There's also an external display connected to my notebook (using
a mini-DP connection) which shows a similar issue. Whenever I lock my desktop
the external display goes black (with the backlight off), but after about 8
seconds the backlight suddenly turns back on and remains on. The backlight on
my internal display remains off (with the patch applied). I've tested various
kernels (from 3.16 to current 4.1) and none are able to properly turn off the
external display (it may have worked in the past, but I can't get it reproduced
at the moment).

Any ideas where to go from here?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1430948168.345efc1.21282--

--===============0794845788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0794845788==--
