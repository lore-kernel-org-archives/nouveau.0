From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Tue, 20 Jan 2015 19:31:57 +0000
Message-ID: <bug-70354-8800-dIa26Qax1A@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2095398992=="
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


--===============2095398992==
Content-Type: multipart/alternative; boundary="1421782317.12Ae4de5.17670"; charset="UTF-8"


--1421782317.12Ae4de5.17670
Date: Tue, 20 Jan 2015 19:31:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #48 from Karol Herbst <karolherbst-BUHhN+a2lJ4@public.gmane.org> ---
(In reply to Vitaly Torshyn from comment #44)
> (In reply to Karol Herbst from comment #42)
> > at least this patch made it more likely to suceed for me.
> 
> Have you tested it? Are sure it doesn't break other ACPI related stuff?
> It's weird to fix ACPI stuff for our cards.
> Also, please respond if you applied this fix with Ben's fixes.

no, I don't use Ben's fixes, because I wanted to try this patch out allone. The
thing is, that for me nouveau fails most of the time loading my card, but with
this patch it seems to be more likely to succeed, allthough it may be not
related, but it kinda helped me.

On a side note: if it succeeds the kernel moudle is loaded under a second, so
it is far bellow the timeout.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421782317.12Ae4de5.17670
Date: Tue, 20 Jan 2015 19:31:57 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c48">Comment # 48</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:karolherbst&#64;me.com" title="Karol Herbst &lt;karolherbst&#64;me.com&gt;"> <span class="fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Vitaly Torshyn from <a href="show_bug.cgi?id=70354#c44">comment #44</a>)
<span class="quote">&gt; (In reply to Karol Herbst from <a href="show_bug.cgi?id=70354#c42">comment #42</a>)
&gt; &gt; at least this patch made it more likely to suceed for me.
&gt; 
&gt; Have you tested it? Are sure it doesn't break other ACPI related stuff?
&gt; It's weird to fix ACPI stuff for our cards.
&gt; Also, please respond if you applied this fix with Ben's fixes.</span >

no, I don't use Ben's fixes, because I wanted to try this patch out allone. The
thing is, that for me nouveau fails most of the time loading my card, but with
this patch it seems to be more likely to succeed, allthough it may be not
related, but it kinda helped me.

On a side note: if it succeeds the kernel moudle is loaded under a second, so
it is far bellow the timeout.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421782317.12Ae4de5.17670--

--===============2095398992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2095398992==--
