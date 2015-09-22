From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92072] New: Wine breackage since
 504903b827604f1a630a335d14231f88c2cf36be (st/mesa: don't call
 st_validate_state in BlitFramebuffer)
Date: Tue, 22 Sep 2015 11:25:51 +0000
Message-ID: <bug-92072-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1599023940=="
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


--===============1599023940==
Content-Type: multipart/alternative; boundary="1442921151.cad50.3252"; charset="UTF-8"


--1442921151.cad50.3252
Date: Tue, 22 Sep 2015 11:25:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92072

            Bug ID: 92072
           Summary: Wine breackage  since
                    504903b827604f1a630a335d14231f88c2cf36be (st/mesa:
                    don't call st_validate_state in BlitFramebuffer)
           Product: Mesa
           Version: git
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: randrik-JGs/UdohzUI@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 118396
  --> https://bugs.freedesktop.org/attachment.cgi?id=118396&action=edit
X log

Hello. 

Recently I tried  to play win32  version of UnrealTournament (first version)
via wine. It worked before, but now failed. Updating wine to latest git
(wine-1.7.51-201-g60d1d6f) not helped. I've bisected this down to mesa  commit
in summary (bisect was  done on 10.6 branch, while bug was also present  on
master, what I usually use).

Bug manifested itself as static desktop image instead of  fullscreen or even
windowed game (in windowed mode it was not wine's desktop, yet not anything
from game). I also suspect llvmpipe can be affected - because I tried with
LIBGL_ALWAYS_SOFTWARE=1 and saw similar effect.

Hopefully below  you can find apitrace from successfull game startup:
https://cloud.mail.ru/public/Hre5/bqVCYrwod

(3.2 Mb)

git bisect log below:
----------------
git bisect start
# good: [0b8e73a6ae2a77d0e9a7810cca5b181ba5f0893e] r600g,radeonsi: add driver
queries for GPU temperature and shader+memory clocks
git bisect good 0b8e73a6ae2a77d0e9a7810cca5b181ba5f0893e
# bad: [02387926addc62198c9b684f4f51f7cbe06b3e25] docs: add sha256 checksums
for 10.6.8
git bisect bad 02387926addc62198c9b684f4f51f7cbe06b3e25
# good: [65d4a20f1c1923498220637f9474d2ae399df52d] main: Refactor
invalidate_framebuffer_storage.
git bisect good 65d4a20f1c1923498220637f9474d2ae399df52d
# good: [1f3ec929761d9aee986362ef90a4a150f4481496] mesa: Turn
need_rgb_to_luminance_conversion() in to a global function
git bisect good 1f3ec929761d9aee986362ef90a4a150f4481496
# bad: [1f6798a70a6d7e6db636decc6af752f9a7714906] egl: Add eglQuerySurface
surface type check for EGL_LARGEST_PBUFFER attrib
git bisect bad 1f6798a70a6d7e6db636decc6af752f9a7714906
# bad: [1f6798a70a6d7e6db636decc6af752f9a7714906] egl: Add eglQuerySurface
surface type check for EGL_LARGEST_PBUFFER attrib
git bisect bad 1f6798a70a6d7e6db636decc6af752f9a7714906
# good: [4c3a4ac6da7820226ecad5fd654899ae727e11e0] nvc0: turn sample counts off
during blit
git bisect good 4c3a4ac6da7820226ecad5fd654899ae727e11e0
# good: [ddc976368fef367e464472ebcc2ac4fd89eb9fd8] Add release notes for 10.6.3
git bisect good ddc976368fef367e464472ebcc2ac4fd89eb9fd8
# bad: [ba10c9ff5088b99591c13cad0b70929b49e6319c] nvc0: fix geometry program
revalidation of clipping params
git bisect bad ba10c9ff5088b99591c13cad0b70929b49e6319c
# bad: [fbc464803a777bea4f9b7b11eeba192122adf8cb] mesa: Turn
get_readpixels_transfer_ops() in to a global function
git bisect bad fbc464803a777bea4f9b7b11eeba192122adf8cb
# bad: [504903b827604f1a630a335d14231f88c2cf36be] st/mesa: don't call
st_validate_state in BlitFramebuffer
git bisect bad 504903b827604f1a630a335d14231f88c2cf36be
# good: [c33ca1696a0a967091937805fa198ffc3317a03f] configure.ac: do not set
HAVE_DRI(23) when libdrm is missing
git bisect good c33ca1696a0a967091937805fa198ffc3317a03f

---------------

Hw:
05:00.0 VGA compatible controller: NVIDIA Corporation G92 [GeForce 8800 GS]
(rev a2) (prog-if 00 [VGA controller])

Note: I use older (patched) X server from 1.12 branch - but as far as I can see
it doesn't expose anything new (sRGB fbconfigs, etc), and just changing
nouveau_dri.so alone enough to make bug visible.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1442921151.cad50.3252
Date: Tue, 22 Sep 2015 11:25:51 +0000
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
   title="NEW - Wine breackage since 504903b827604f1a630a335d14231f88c2cf36be (st/mesa: don't call st_validate_state in BlitFramebuffer)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92072">92072</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Wine breackage  since 504903b827604f1a630a335d14231f88c2cf36be (st/mesa: don't call st_validate_state in BlitFramebuffer)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>randrik&#64;mail.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118396" name="attach_118396" title="X log">attachment 118396</a> <a href="attachment.cgi?id=118396&amp;action=edit" title="X log">[details]</a></span>
X log

Hello. 

Recently I tried  to play win32  version of UnrealTournament (first version)
via wine. It worked before, but now failed. Updating wine to latest git
(wine-1.7.51-201-g60d1d6f) not helped. I've bisected this down to mesa  commit
in summary (bisect was  done on 10.6 branch, while bug was also present  on
master, what I usually use).

Bug manifested itself as static desktop image instead of  fullscreen or even
windowed game (in windowed mode it was not wine's desktop, yet not anything
from game). I also suspect llvmpipe can be affected - because I tried with
LIBGL_ALWAYS_SOFTWARE=1 and saw similar effect.

Hopefully below  you can find apitrace from successfull game startup:
<a href="https://cloud.mail.ru/public/Hre5/bqVCYrwod">https://cloud.mail.ru/public/Hre5/bqVCYrwod</a>

(3.2 Mb)

git bisect log below:
----------------
git bisect start
# good: [0b8e73a6ae2a77d0e9a7810cca5b181ba5f0893e] r600g,radeonsi: add driver
queries for GPU temperature and shader+memory clocks
git bisect good 0b8e73a6ae2a77d0e9a7810cca5b181ba5f0893e
# bad: [02387926addc62198c9b684f4f51f7cbe06b3e25] docs: add sha256 checksums
for 10.6.8
git bisect bad 02387926addc62198c9b684f4f51f7cbe06b3e25
# good: [65d4a20f1c1923498220637f9474d2ae399df52d] main: Refactor
invalidate_framebuffer_storage.
git bisect good 65d4a20f1c1923498220637f9474d2ae399df52d
# good: [1f3ec929761d9aee986362ef90a4a150f4481496] mesa: Turn
need_rgb_to_luminance_conversion() in to a global function
git bisect good 1f3ec929761d9aee986362ef90a4a150f4481496
# bad: [1f6798a70a6d7e6db636decc6af752f9a7714906] egl: Add eglQuerySurface
surface type check for EGL_LARGEST_PBUFFER attrib
git bisect bad 1f6798a70a6d7e6db636decc6af752f9a7714906
# bad: [1f6798a70a6d7e6db636decc6af752f9a7714906] egl: Add eglQuerySurface
surface type check for EGL_LARGEST_PBUFFER attrib
git bisect bad 1f6798a70a6d7e6db636decc6af752f9a7714906
# good: [4c3a4ac6da7820226ecad5fd654899ae727e11e0] nvc0: turn sample counts off
during blit
git bisect good 4c3a4ac6da7820226ecad5fd654899ae727e11e0
# good: [ddc976368fef367e464472ebcc2ac4fd89eb9fd8] Add release notes for 10.6.3
git bisect good ddc976368fef367e464472ebcc2ac4fd89eb9fd8
# bad: [ba10c9ff5088b99591c13cad0b70929b49e6319c] nvc0: fix geometry program
revalidation of clipping params
git bisect bad ba10c9ff5088b99591c13cad0b70929b49e6319c
# bad: [fbc464803a777bea4f9b7b11eeba192122adf8cb] mesa: Turn
get_readpixels_transfer_ops() in to a global function
git bisect bad fbc464803a777bea4f9b7b11eeba192122adf8cb
# bad: [504903b827604f1a630a335d14231f88c2cf36be] st/mesa: don't call
st_validate_state in BlitFramebuffer
git bisect bad 504903b827604f1a630a335d14231f88c2cf36be
# good: [c33ca1696a0a967091937805fa198ffc3317a03f] configure.ac: do not set
HAVE_DRI(23) when libdrm is missing
git bisect good c33ca1696a0a967091937805fa198ffc3317a03f

---------------

Hw:
05:00.0 VGA compatible controller: NVIDIA Corporation G92 [GeForce 8800 GS]
(rev a2) (prog-if 00 [VGA controller])

Note: I use older (patched) X server from 1.12 branch - but as far as I can see
it doesn't expose anything new (sRGB fbconfigs, etc), and just changing
nouveau_dri.so alone enough to make bug visible.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442921151.cad50.3252--

--===============1599023940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1599023940==--
