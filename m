From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Wed, 27 May 2015 18:20:37 +0000
Message-ID: <bug-89730-8800-EJfhjvoPoP@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1428274688=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89730-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1428274688==
Content-Type: multipart/alternative; boundary="1432750837.106f871.13360"; charset="UTF-8"


--1432750837.106f871.13360
Date: Wed, 27 May 2015 18:20:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #20 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to andrew p. from comment #19)
> Hi, it's me again. I'm not familiar with all this nouveau stuff, so can you
> tell what is the current status of the bug?
> I received bug reports that look very similar to this. Is there any fix or
> maybe workaround?
> 
> https://bugs.launchpad.net/ubuntu/+source/lightdm-gtk-greeter/+bug/1459079

The status is that it doesn't work :)

I've been looking at the overall logic in nouveau's EXA implementation, and it
looks extremely dodgy wrt CPU access -- I think that PrepareAccess should do an
unconditional PUSH_KICK(push) before the nouveau_bo_wait. That'd be good to
test out.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432750837.106f871.13360
Date: Wed, 27 May 2015 18:20:37 +0000
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
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to andrew p. from <a href="show_bug.cgi?id=89730#c19">comment #19</a>)
<span class="quote">&gt; Hi, it's me again. I'm not familiar with all this nouveau stuff, so can you
&gt; tell what is the current status of the bug?
&gt; I received bug reports that look very similar to this. Is there any fix or
&gt; maybe workaround?
&gt; 
&gt; <a href="https://bugs.launchpad.net/ubuntu/+source/lightdm-gtk-greeter/+bug/1459079">https://bugs.launchpad.net/ubuntu/+source/lightdm-gtk-greeter/+bug/1459079</a></span >

The status is that it doesn't work :)

I've been looking at the overall logic in nouveau's EXA implementation, and it
looks extremely dodgy wrt CPU access -- I think that PrepareAccess should do an
unconditional PUSH_KICK(push) before the nouveau_bo_wait. That'd be good to
test out.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432750837.106f871.13360--

--===============1428274688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1428274688==--
