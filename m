From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87244] [NV94] X hangs,
 logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after
 101 spins, halt followed by an X trace
Date: Fri, 20 Feb 2015 17:19:56 +0000
Message-ID: <bug-87244-8800-FhSKEExsrn@http.bugs.freedesktop.org/>
References: <bug-87244-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1246552105=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87244-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1246552105==
Content-Type: multipart/alternative; boundary="1424452796.F254Ac2.28610"; charset="UTF-8"


--1424452796.F254Ac2.28610
Date: Fri, 20 Feb 2015 17:19:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87244

--- Comment #18 from Adam Williamson <adamw-cfjF3rc+CpsYNetmKr+vY16hYfS7NtTn@public.gmane.org> ---
The patch is in Ben's personal tree already:

http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=c869d99187a356b886bdecc757caa0038d142844

but hasn't yet made its way from there into the nouveau tree from which it'd
get merged to linus':

http://cgit.freedesktop.org/nouveau/linux-2.6/log/?h=linux-3.20

I have, however, prevailed on the Fedora kernel maintainers to put it in at
least the F22/Rawhide kernels; the builds of both that are running as I type
this will include it. I'm hoping we can get it backported from there to 21 as
well.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424452796.F254Ac2.28610
Date: Fri, 20 Feb 2015 17:19:56 +0000
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
   title="NEW - [NV94] X hangs, logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] X hangs, logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244">bug 87244</a>
              from <span class="vcard"><a class="email" href="mailto:adamw&#64;happyassassin.net" title="Adam Williamson &lt;adamw&#64;happyassassin.net&gt;"> <span class="fn">Adam Williamson</span></a>
</span></b>
        <pre>The patch is in Ben's personal tree already:

<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=c869d99187a356b886bdecc757caa0038d142844">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=c869d99187a356b886bdecc757caa0038d142844</a>

but hasn't yet made its way from there into the nouveau tree from which it'd
get merged to linus':

<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/log/?h=linux-3.20">http://cgit.freedesktop.org/nouveau/linux-2.6/log/?h=linux-3.20</a>

I have, however, prevailed on the Fedora kernel maintainers to put it in at
least the F22/Rawhide kernels; the builds of both that are running as I type
this will include it. I'm hoping we can get it backported from there to 21 as
well.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424452796.F254Ac2.28610--

--===============1246552105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1246552105==--
