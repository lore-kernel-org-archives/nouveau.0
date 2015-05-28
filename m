From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Thu, 28 May 2015 18:22:19 +0000
Message-ID: <bug-89730-8800-VRuNffapFT@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1380315333=="
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


--===============1380315333==
Content-Type: multipart/alternative; boundary="1432837339.4d7FA8e61.32490"; charset="UTF-8"


--1432837339.4d7FA8e61.32490
Date: Thu, 28 May 2015 18:22:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #25 from andrew p. <pan.pav.7c5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #24)
> It's good that it does that.
Is it so good that newest nouveau version will resolve this bug?

About xtrace, for poma:
> Guys, if any of you know how to x[11]trace lightdm-gtk-greeter?
You need to modify "greeter-wrapper" script to run xtrace. Default path for
ubuntu: /usr/lib/lightdm/lightdm-greeter-session

Replace launching command:
    exec $@ &
with xtrace command:
    exec xtrace -b -o /tmp/xtrace.log $@ &

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432837339.4d7FA8e61.32490
Date: Thu, 28 May 2015 18:22:19 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:pan.pav.7c5&#64;gmail.com" title="andrew p. &lt;pan.pav.7c5&#64;gmail.com&gt;"> <span class="fn">andrew p.</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=89730#c24">comment #24</a>)
<span class="quote">&gt; It's good that it does that.</span >
Is it so good that newest nouveau version will resolve this bug?

About xtrace, for poma:
<span class="quote">&gt; Guys, if any of you know how to x[11]trace lightdm-gtk-greeter?</span >
You need to modify &quot;greeter-wrapper&quot; script to run xtrace. Default path for
ubuntu: /usr/lib/lightdm/lightdm-greeter-session

Replace launching command:
    exec $&#64; &amp;
with xtrace command:
    exec xtrace -b -o /tmp/xtrace.log $&#64; &amp;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432837339.4d7FA8e61.32490--

--===============1380315333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1380315333==--
