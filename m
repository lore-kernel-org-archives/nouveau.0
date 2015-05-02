From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90276] [NVE6] nouveau E[ PFIFO][0000:01:00.0] read
 fault at 0x000a5c0000 [UNSUPPORTED_KIND] from CE2/GR_CE on channel
 0x007f329000 [unknown]
Date: Sat, 02 May 2015 15:46:47 +0000
Message-ID: <bug-90276-8800-jvNkTvsqvq@http.bugs.freedesktop.org/>
References: <bug-90276-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1964232168=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90276-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1964232168==
Content-Type: multipart/alternative; boundary="1430581607.5fdb11482.29208"; charset="UTF-8"


--1430581607.5fdb11482.29208
Date: Sat, 2 May 2015 15:46:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90276

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Great, thanks for doing that. The commit you landed on certainly *seems*
related to the whole DISP thing, which is good:

commit 7a014a872914a6bb5af8b67eba603f8546794ab9
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Fri May 16 14:36:15 2014 +1000

    drm/nouveau/disp: add internal representaion of output paths and connectors

    This will, at some point, be used to replace various bits and pieces of
    code doing direct bios parsing.  For now, it'll just be used for some
    DP improvements.

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Arthur, can you attach your VBIOS (cat /sys/kernel/debug/dri/0/vbios.rom) and
tell us which connectors have monitors connected?

Ben, any ideas?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1430581607.5fdb11482.29208
Date: Sat, 2 May 2015 15:46:47 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] nouveau E[ PFIFO][0000:01:00.0] read fault at 0x000a5c0000 [UNSUPPORTED_KIND] from CE2/GR_CE on channel 0x007f329000 [unknown]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90276#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] nouveau E[ PFIFO][0000:01:00.0] read fault at 0x000a5c0000 [UNSUPPORTED_KIND] from CE2/GR_CE on channel 0x007f329000 [unknown]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90276">bug 90276</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Great, thanks for doing that. The commit you landed on certainly *seems*
related to the whole DISP thing, which is good:

commit 7a014a872914a6bb5af8b67eba603f8546794ab9
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Fri May 16 14:36:15 2014 +1000

    drm/nouveau/disp: add internal representaion of output paths and connectors

    This will, at some point, be used to replace various bits and pieces of
    code doing direct bios parsing.  For now, it'll just be used for some
    DP improvements.

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

Arthur, can you attach your VBIOS (cat /sys/kernel/debug/dri/0/vbios.rom) and
tell us which connectors have monitors connected?

Ben, any ideas?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1430581607.5fdb11482.29208--

--===============1964232168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1964232168==--
