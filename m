From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92971] [GF110] KDE plasma locks randomly due to
 crash of nouveau driver
Date: Mon, 16 Nov 2015 22:18:16 +0000
Message-ID: <bug-92971-8800-FXxeFCj9DB@http.bugs.freedesktop.org/>
References: <bug-92971-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1367690599=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92971-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1367690599==
Content-Type: multipart/alternative; boundary="1447712296.aFd5c1.32194"; charset="UTF-8"


--1447712296.aFd5c1.32194
Date: Mon, 16 Nov 2015 22:18:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92971

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Nov 14 19:06:12 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 80000000 []
ch 30 [007e6ab000 kscreenlocker_g[4257]] subc 6 mthd 2878 data a0c02020

A few things wrong with this picture... first off, nouveau never uses
subchannel 6.

Method 2878 is: lookup -a c8 -d SUBCHAN -- -v obj-class GF100_3D 2878
TFB_VARYING_LOCS[0][0x1e] => 0

But those are all emitted in one fell swoop, starting from 2800. No way
something could get into the middle of that and screw up the channel on just
that one. (Since they don't have independent begin clauses). So this has to
have come from elsewhere.... but where?

Is this the first error? The first error is always the most important... the
rest can often happen as a result of the earlier ones.

Are you sure the kernel update is what brought this about and not a KDE update?
Is this KDE4 or KDE5?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1447712296.aFd5c1.32194
Date: Mon, 16 Nov 2015 22:18:16 +0000
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
   title="NEW - [GF110] KDE plasma locks randomly due to crash of nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92971#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [GF110] KDE plasma locks randomly due to crash of nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92971">bug 92971</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Nov 14 19:06:12 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 80000000 []
ch 30 [007e6ab000 kscreenlocker_g[4257]] subc 6 mthd 2878 data a0c02020

A few things wrong with this picture... first off, nouveau never uses
subchannel 6.

Method 2878 is: lookup -a c8 -d SUBCHAN -- -v obj-class GF100_3D 2878
TFB_VARYING_LOCS[0][0x1e] =&gt; 0

But those are all emitted in one fell swoop, starting from 2800. No way
something could get into the middle of that and screw up the channel on just
that one. (Since they don't have independent begin clauses). So this has to
have come from elsewhere.... but where?

Is this the first error? The first error is always the most important... the
rest can often happen as a result of the earlier ones.

Are you sure the kernel update is what brought this about and not a KDE update?
Is this KDE4 or KDE5?</pre>
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

--1447712296.aFd5c1.32194--

--===============1367690599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1367690599==--
