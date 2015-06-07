From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Sun, 07 Jun 2015 20:33:35 +0000
Message-ID: <bug-90887-8800-Gz4LUwPhNc@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0895008007=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0895008007==
Content-Type: multipart/alternative; boundary="1433709215.cfF4bd1.8354"; charset="UTF-8"


--1433709215.cfF4bd1.8354
Date: Sun, 7 Jun 2015 20:33:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Gah! The inbound edge ordering having to be the same as in phi nodes has bit me
before as well. I wonder if it wouldn't be simpler to just fix that, i.e. make
phi nodes attach a bb reference to each argument.

In any case, I'll be able to take a closer look in a week or so. Great
detective work btw.

FTR, nva5 should be able to allow manual reclocking on kernel 3.19+ (if you add
nouveau.pstate=1), which should help decrease some of the perf difference wrt
blob.

Also, bug 90347 is completely different... that findFirstUse stuff is pretty
dodgy in the first place, and it happens post-RA. (And only on kepler+)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1433709215.cfF4bd1.8354
Date: Sun, 7 Jun 2015 20:33:35 +0000
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
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Gah! The inbound edge ordering having to be the same as in phi nodes has bit me
before as well. I wonder if it wouldn't be simpler to just fix that, i.e. make
phi nodes attach a bb reference to each argument.

In any case, I'll be able to take a closer look in a week or so. Great
detective work btw.

FTR, nva5 should be able to allow manual reclocking on kernel 3.19+ (if you add
nouveau.pstate=1), which should help decrease some of the perf difference wrt
blob.

Also, <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE0+] Failure to insert texbar under some circumstances (causing bad colors in Terasology)"
   href="show_bug.cgi?id=90347">bug 90347</a> is completely different... that findFirstUse stuff is pretty
dodgy in the first place, and it happens post-RA. (And only on kepler+)</pre>
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

--1433709215.cfF4bd1.8354--

--===============0895008007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0895008007==--
