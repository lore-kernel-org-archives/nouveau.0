From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89247] [NVE7] short display freeze on xrandr --query
Date: Tue, 05 May 2015 21:47:52 +0000
Message-ID: <bug-89247-8800-FwT2avjeVt@http.bugs.freedesktop.org/>
References: <bug-89247-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1481314776=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89247-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1481314776==
Content-Type: multipart/alternative; boundary="1430862472.166Bf2f2.12883"; charset="UTF-8"


--1430862472.166Bf2f2.12883
Date: Tue, 5 May 2015 21:47:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89247

--- Comment #18 from Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #17)
> Just for the record, that is *not* expected to happen -- xrandr -q always
> returns ~instantly for me.

For me as well and i have and nve7 as well

> 
> Can you try booting with nouveau.debug=debug drm.debug=0xe hopefully that'll
> provide some info as to where the time is going.

as an addition: maybe "perf top" can visually aid here, as it really must be
stuck in some cycle inside the nouveau kernel module...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1430862472.166Bf2f2.12883
Date: Tue, 5 May 2015 21:47:52 +0000
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
   title="NEW - [NVE7] short display freeze on xrandr --query"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89247#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] short display freeze on xrandr --query"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89247">bug 89247</a>
              from <span class="vcard"><a class="email" href="mailto:tobias.klausmann&#64;mni.thm.de" title="Tobias Klausmann &lt;tobias.klausmann&#64;mni.thm.de&gt;"> <span class="fn">Tobias Klausmann</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=89247#c17">comment #17</a>)
<span class="quote">&gt; Just for the record, that is *not* expected to happen -- xrandr -q always
&gt; returns ~instantly for me.</span >

For me as well and i have and nve7 as well

<span class="quote">&gt; 
&gt; Can you try booting with nouveau.debug=debug drm.debug=0xe hopefully that'll
&gt; provide some info as to where the time is going.</span >

as an addition: maybe &quot;perf top&quot; can visually aid here, as it really must be
stuck in some cycle inside the nouveau kernel module...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1430862472.166Bf2f2.12883--

--===============1481314776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1481314776==--
