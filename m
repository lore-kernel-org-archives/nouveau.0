From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90306] Nouveau crashes with multiple monitors
Date: Sun, 17 May 2015 02:24:36 +0000
Message-ID: <bug-90306-8800-Rkwpt3Vle5@http.bugs.freedesktop.org/>
References: <bug-90306-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1982987566=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90306-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1982987566==
Content-Type: multipart/alternative; boundary="1431829475.ee28Adc2.20451"; charset="UTF-8"


--1431829475.ee28Adc2.20451
Date: Sun, 17 May 2015 02:24:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90306

--- Comment #3 from Lars Seipel <lars.seipel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I'm seeing the same symptoms on my machine. For me, the issue gets triggered by
a kernel update. 4.0 (with or without stable patches on top of that) works.
When running one of the 4.1 RCs the X server crashes on xrandr(1) (to enable
multi-monitor), printing the above symbol lookup error message to the console.

The attached log gives some hints as to why that might happen:
[    80.374] (EE) NOUVEAU(0): Failed to initialise context object: M2MF_NVC0
(0)
[    80.374] (EE) NOUVEAU(0): Error initialising acceleration.  Falling back to
NoAccel
[    80.374] (**) NOUVEAU(0): [COPY] acceleration disabled

So it's not necessarily that the original reporter is using GLAMOR, it might
also be the case that acceleration isn't enabled at all.

Any idea on what's causing this? I can try to pin down the earliest failing
commit but it'll take some time until I get to it.

Should I file a new report? OP doesn't state anything regarding kernel version,
so the issues might or might not be related.

Versions used:
xorg-server 1.17.1
libdrm 2.4.61
xf86-video-nouveau 1.0.11
kernel v4.1-rc3-284-g92752b5 (i.e. Linus' current tree as of now)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431829475.ee28Adc2.20451
Date: Sun, 17 May 2015 02:24:35 +0000
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
   title="NEW - Nouveau crashes with multiple monitors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90306#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau crashes with multiple monitors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90306">bug 90306</a>
              from <span class="vcard"><a class="email" href="mailto:lars.seipel&#64;gmail.com" title="Lars Seipel &lt;lars.seipel&#64;gmail.com&gt;"> <span class="fn">Lars Seipel</span></a>
</span></b>
        <pre>I'm seeing the same symptoms on my machine. For me, the issue gets triggered by
a kernel update. 4.0 (with or without stable patches on top of that) works.
When running one of the 4.1 RCs the X server crashes on xrandr(1) (to enable
multi-monitor), printing the above symbol lookup error message to the console.

The attached log gives some hints as to why that might happen:
[    80.374] (EE) NOUVEAU(0): Failed to initialise context object: M2MF_NVC0
(0)
[    80.374] (EE) NOUVEAU(0): Error initialising acceleration.  Falling back to
NoAccel
[    80.374] (**) NOUVEAU(0): [COPY] acceleration disabled

So it's not necessarily that the original reporter is using GLAMOR, it might
also be the case that acceleration isn't enabled at all.

Any idea on what's causing this? I can try to pin down the earliest failing
commit but it'll take some time until I get to it.

Should I file a new report? OP doesn't state anything regarding kernel version,
so the issues might or might not be related.

Versions used:
xorg-server 1.17.1
libdrm 2.4.61
xf86-video-nouveau 1.0.11
kernel v4.1-rc3-284-g92752b5 (i.e. Linus' current tree as of now)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431829475.ee28Adc2.20451--

--===============1982987566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1982987566==--
