From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91722] [NVE4] PGRAPH - grctx template channel unload
 timeout, failed to construct context, init failed, -16
Date: Thu, 24 Sep 2015 03:56:34 +0000
Message-ID: <bug-91722-8800-DjifZIbEUP@http.bugs.freedesktop.org/>
References: <bug-91722-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1613061434=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91722-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1613061434==
Content-Type: multipart/alternative; boundary="1443066994.1Bcf0.20597"; charset="UTF-8"


--1443066994.1Bcf0.20597
Date: Thu, 24 Sep 2015 03:56:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91722

--- Comment #13 from kyle.devir-U10LOJoAJ6dBDgjK7y7TUQ@public.gmane.org ---
The patch kind of works. A full Plasma session on Xorg did not work. Screen
updates froze, updating every full minute, or so. From that observation, the
desktop did work. With some luck, I opened an application, which only showed up
after a long while.

Also, I was able to start Weston, but there were minor visual glitches with
applications I started on Xwayland.

I was also able to start kwin_wayland with plasmashell running on Xwayland, but
plasmashell soon crashed.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1443066994.1Bcf0.20597
Date: Thu, 24 Sep 2015 03:56:34 +0000
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
   title="NEW - [NVE4] PGRAPH - grctx template channel unload timeout, failed to construct context, init failed, -16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91722#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] PGRAPH - grctx template channel unload timeout, failed to construct context, init failed, -16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91722">bug 91722</a>
              from <span class="vcard"><a class="email" href="mailto:kyle.devir&#64;mykolab.com" title="kyle.devir&#64;mykolab.com">kyle.devir&#64;mykolab.com</a>
</span></b>
        <pre>The patch kind of works. A full Plasma session on Xorg did not work. Screen
updates froze, updating every full minute, or so. From that observation, the
desktop did work. With some luck, I opened an application, which only showed up
after a long while.

Also, I was able to start Weston, but there were minor visual glitches with
applications I started on Xwayland.

I was also able to start kwin_wayland with plasmashell running on Xwayland, but
plasmashell soon crashed.</pre>
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

--1443066994.1Bcf0.20597--

--===============1613061434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1613061434==--
