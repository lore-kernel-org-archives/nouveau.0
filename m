From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90513] Odd gray and red flicker in The Talos
	Principle on GK104
Date: Thu, 16 Jul 2015 00:43:48 +0000
Message-ID: <bug-90513-8800-7PuEYcXzej@http.bugs.freedesktop.org/>
References: <bug-90513-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1840159521=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90513-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1840159521==
Content-Type: multipart/alternative; boundary="1437007428.1FD11.16664"; charset="UTF-8"


--1437007428.1FD11.16664
Date: Thu, 16 Jul 2015 00:43:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90513

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, so... it looks like nouveau just fails at rendering this game entirely. The
flickering is like the *least* of our problems. Although one of the more
annoying. I just ran Karol's trace through apitrace dump-images on i965 and a
gk208, and beyond the semi-expected small differences all over, things seem to
go extremely wrong in a few distinct places:

Draw call at 383068. Nouveau just fails to draw the "top" part of the image.
There is supposed to be a "circle" of specs, and nouveau just has a
semi-circle. Subsequent draws add more specs and they all appear to be missing
on nouveau. This is a mask of some sort, but I can't imagine that it translates
into anything good down the line.

Then the next big difference comes in at draw 395973. Now, I'm willing to
entertain the notion that it's actually fine for that difference to exist due
to silly GPU differences. However the next draw after that -- 396054 -- the
footpath is supposed to have some texture mapped on top of it, and it's just
not there on the gk208 -- the footpath is there, but the dark pattern that's
supposed to go over it isn't.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1437007428.1FD11.16664
Date: Thu, 16 Jul 2015 00:43:48 +0000
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
   title="NEW - Odd gray and red flicker in The Talos Principle on GK104"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90513#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Odd gray and red flicker in The Talos Principle on GK104"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90513">bug 90513</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, so... it looks like nouveau just fails at rendering this game entirely. The
flickering is like the *least* of our problems. Although one of the more
annoying. I just ran Karol's trace through apitrace dump-images on i965 and a
gk208, and beyond the semi-expected small differences all over, things seem to
go extremely wrong in a few distinct places:

Draw call at 383068. Nouveau just fails to draw the &quot;top&quot; part of the image.
There is supposed to be a &quot;circle&quot; of specs, and nouveau just has a
semi-circle. Subsequent draws add more specs and they all appear to be missing
on nouveau. This is a mask of some sort, but I can't imagine that it translates
into anything good down the line.

Then the next big difference comes in at draw 395973. Now, I'm willing to
entertain the notion that it's actually fine for that difference to exist due
to silly GPU differences. However the next draw after that -- 396054 -- the
footpath is supposed to have some texture mapped on top of it, and it's just
not there on the gk208 -- the footpath is there, but the dark pattern that's
supposed to go over it isn't.</pre>
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

--1437007428.1FD11.16664--

--===============1840159521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1840159521==--
