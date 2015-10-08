From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92271] Unusably slow OpenGL performance on nouveau
 (GeForce 9600 GT) with X server 1.18 with rotated output
Date: Thu, 08 Oct 2015 02:17:04 +0000
Message-ID: <bug-92271-8800-HyLrubsJPz@http.bugs.freedesktop.org/>
References: <bug-92271-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0553446012=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92271-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0553446012==
Content-Type: multipart/alternative; boundary="1444270624.42cD3.29852"; charset="UTF-8"


--1444270624.42cD3.29852
Date: Thu, 8 Oct 2015 02:17:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92271

--- Comment #23 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Adam Williamson from comment #22)
> it's to rotate my screens on desktops that don't do their own RandR stuff
> (and it used to work for GDM too, doesn't any more). But for some reason, if
> I have that file active with latest git nouveau, X won't start; I have to
> rename it to .conf.bak to make X start. Still, if I do that, it does run
> fine and at full speed, so this one looks like a bug tied to the particular
> nouveau DDX git snapshot Fedora is using. Guess I should move it downstream?

Need some logs. That config seems generally fine.

Also, does it run at full speed if you force DRI3?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444270624.42cD3.29852
Date: Thu, 8 Oct 2015 02:17:04 +0000
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
   title="NEW - Unusably slow OpenGL performance on nouveau (GeForce 9600 GT) with X server 1.18 with rotated output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92271#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Unusably slow OpenGL performance on nouveau (GeForce 9600 GT) with X server 1.18 with rotated output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92271">bug 92271</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Adam Williamson from <a href="show_bug.cgi?id=92271#c22">comment #22</a>)
<span class="quote">&gt; it's to rotate my screens on desktops that don't do their own RandR stuff
&gt; (and it used to work for GDM too, doesn't any more). But for some reason, if
&gt; I have that file active with latest git nouveau, X won't start; I have to
&gt; rename it to .conf.bak to make X start. Still, if I do that, it does run
&gt; fine and at full speed, so this one looks like a bug tied to the particular
&gt; nouveau DDX git snapshot Fedora is using. Guess I should move it downstream?</span >

Need some logs. That config seems generally fine.

Also, does it run at full speed if you force DRI3?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444270624.42cD3.29852--

--===============0553446012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0553446012==--
