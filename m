From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Thu, 12 Mar 2015 19:34:43 +0000
Message-ID: <bug-89558-8800-bTEFXLy8bj@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1134597291=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89558-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1134597291==
Content-Type: multipart/alternative; boundary="1426188883.7044Aa52.12460"; charset="UTF-8"


--1426188883.7044Aa52.12460
Date: Thu, 12 Mar 2015 19:34:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89558

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Unknown chipset error for   |[NV118] GM108 not supported
                   |GeForce 840M                |by nouveau

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
There is presently no support in nouveau for this particular chip. However it
_ought_ to be pretty similar to the GM107, so you can just add a

case 0x118:

right above the "case 0x117:" in
drivers/gpu/drm/nouveau/core/engine/device/gm100.c (approximate path, going by
memory). In hypothetical scenario where that works fine, you still wouldn't be
able to use this for acceleration [but you would be able to use any displays
direct-attached to the controller, if any].

For acceleration, you can either grab blob fw (see
http://nouveau.freedesktop.org/wiki/NVC0_Firmware/), or you may want to build
the (out-of-tree style) module available at

http://cgit.freedesktop.org/~darktama/nouveau

which just 2 days ago gained support for GM107 acceleration without any blob
fw. All of these will require the extra "case" statement of course.

If you end up going through with any parts of this advice, let us know how it
works out. We'd love to add support for this chip, but no one on the nouveau
team presently has access to it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426188883.7044Aa52.12460
Date: Thu, 12 Mar 2015 19:34:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Unknown chipset error for GeForce 840M
           </td>
           <td>[NV118] GM108 not supported by nouveau
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>There is presently no support in nouveau for this particular chip. However it
_ought_ to be pretty similar to the GM107, so you can just add a

case 0x118:

right above the &quot;case 0x117:&quot; in
drivers/gpu/drm/nouveau/core/engine/device/gm100.c (approximate path, going by
memory). In hypothetical scenario where that works fine, you still wouldn't be
able to use this for acceleration [but you would be able to use any displays
direct-attached to the controller, if any].

For acceleration, you can either grab blob fw (see
<a href="http://nouveau.freedesktop.org/wiki/NVC0_Firmware/">http://nouveau.freedesktop.org/wiki/NVC0_Firmware/</a>), or you may want to build
the (out-of-tree style) module available at

<a href="http://cgit.freedesktop.org/~darktama/nouveau">http://cgit.freedesktop.org/~darktama/nouveau</a>

which just 2 days ago gained support for GM107 acceleration without any blob
fw. All of these will require the extra &quot;case&quot; statement of course.

If you end up going through with any parts of this advice, let us know how it
works out. We'd love to add support for this chip, but no one on the nouveau
team presently has access to it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426188883.7044Aa52.12460--

--===============1134597291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1134597291==--
