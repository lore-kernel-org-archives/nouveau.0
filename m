From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Wed, 04 Nov 2015 00:58:32 +0000
Message-ID: <bug-70354-8800-EcAa4mogeV@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0394019669=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0394019669==
Content-Type: multipart/alternative; boundary="1446598712.51C8741.1086"; charset="UTF-8"


--1446598712.51C8741.1086
Date: Wed, 4 Nov 2015 00:58:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #86 from Julien Isorce <julien.isorce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #85)
> (In reply to Julien Isorce from comment #84)
> > Any idea ? Thx
> 
> You have a GK107. It probably needs the PGOB fix as well as another user on
> this bug needed it. See
> http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-4.
> 4&id=3c9aca318150ba1152e957a37473ff67d8ebba30 -- should be on its way to
> linux 4.4.

Thx I can confirm it resolved my problem. I thought I was testing with darktama
branch few weeks ago but maybe not. Anyway I applied the patch you pointed in
the kernel tree directly (today git master). After a fresh build and install I
can confirm it works. HW decoding too :)

I only tested with patch+workaround, but maybe "patch" is enough. I can try to
confirm tomorrow. Thx!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446598712.51C8741.1086
Date: Wed, 4 Nov 2015 00:58:32 +0000
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
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c86">Comment # 86</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:julien.isorce&#64;gmail.com" title="Julien Isorce &lt;julien.isorce&#64;gmail.com&gt;"> <span class="fn">Julien Isorce</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=70354#c85">comment #85</a>)
<span class="quote">&gt; (In reply to Julien Isorce from <a href="show_bug.cgi?id=70354#c84">comment #84</a>)
&gt; &gt; Any idea ? Thx
&gt; 
&gt; You have a GK107. It probably needs the PGOB fix as well as another user on
&gt; this bug needed it. See
&gt; <a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-4">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-4</a>.
&gt; 4&amp;id=3c9aca318150ba1152e957a37473ff67d8ebba30 -- should be on its way to
&gt; linux 4.4.</span >

Thx I can confirm it resolved my problem. I thought I was testing with darktama
branch few weeks ago but maybe not. Anyway I applied the patch you pointed in
the kernel tree directly (today git master). After a fresh build and install I
can confirm it works. HW decoding too :)

I only tested with patch+workaround, but maybe &quot;patch&quot; is enough. I can try to
confirm tomorrow. Thx!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446598712.51C8741.1086--

--===============0394019669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0394019669==--
