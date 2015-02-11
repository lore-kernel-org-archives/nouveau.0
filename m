From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88822] X freezes after watching videos
Date: Wed, 11 Feb 2015 21:12:43 +0000
Message-ID: <bug-88822-8800-xfpyX4xhVN@http.bugs.freedesktop.org/>
References: <bug-88822-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0250746004=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88822-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0250746004==
Content-Type: multipart/alternative; boundary="1423689162.83cdcb1.5482"; charset="UTF-8"


--1423689162.83cdcb1.5482
Date: Wed, 11 Feb 2015 21:12:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88822

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to rv from comment #3)
> Is there a possible workaround? How can I help to solve this issue? With
> those crashes, my computer is getting unusable (losing my work all the
> time...)
> 
> Thanks for your help

nouveau E[   PFIFO][0000:01:00.0] still angry after 101 spins, halt

So... seems like nouveau gets stuck. I think I saw a patch recently which may
help with that:

http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=c869d99187a356b886bdecc757caa0038d142844

With some creativity, you can apply it to a regular kernel tree.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423689162.83cdcb1.5482
Date: Wed, 11 Feb 2015 21:12:42 +0000
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
   title="NEW - X freezes after watching videos"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88822#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - X freezes after watching videos"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88822">bug 88822</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to rv from <a href="show_bug.cgi?id=88822#c3">comment #3</a>)
<span class="quote">&gt; Is there a possible workaround? How can I help to solve this issue? With
&gt; those crashes, my computer is getting unusable (losing my work all the
&gt; time...)
&gt; 
&gt; Thanks for your help</span >

nouveau E[   PFIFO][0000:01:00.0] still angry after 101 spins, halt

So... seems like nouveau gets stuck. I think I saw a patch recently which may
help with that:

<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=c869d99187a356b886bdecc757caa0038d142844">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=c869d99187a356b886bdecc757caa0038d142844</a>

With some creativity, you can apply it to a regular kernel tree.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423689162.83cdcb1.5482--

--===============0250746004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0250746004==--
