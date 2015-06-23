From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90932] gm107 font glitches with kernel 4.1rc
Date: Tue, 23 Jun 2015 14:17:16 +0000
Message-ID: <bug-90932-8800-VTjFEa7z0g@http.bugs.freedesktop.org/>
References: <bug-90932-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0757555246=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90932-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0757555246==
Content-Type: multipart/alternative; boundary="1435069036.27fa2.15959"; charset="UTF-8"


--1435069036.27fa2.15959
Date: Tue, 23 Jun 2015 14:17:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90932

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Marcus Moeller from comment #7)
> Shouln't this be fixed in nouveau instead of moving to another driver? Or is
> this just a suggestion for a workaround?

The fix in nouveau will be "remove glamor integration" and "fail to load for
GM107+". But we haven't fully decided on that *quite* yet. And I have an EXA
impl in the works for GM107, so perhaps we'll use that. TBD.

The problem that you're seeing is with glamor, and they changed the way font
rendering was done in X 1.17, which is why I'm suggesting you use that.

Separate from that, nouveau's integration with glamor is totally fubar'd and
should be removed, as per the above, but that has nothing to do with any
misrendering you might see. For example perhaps you might observe the lack of a
GLX_ARB_create_context_profile. This is a symptom of DRI2 support basically
missing, which is going to cause major problems.

Since nouveau's integration with glamor would be no different from
modesetting's integration with glamor, might as well just use that directly...
[There are one or two things nouveau can still do that modesetting can't, but
those differences are in the process of being eliminated.]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1435069036.27fa2.15959
Date: Tue, 23 Jun 2015 14:17:16 +0000
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
   title="NEW - gm107 font glitches with kernel 4.1rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90932#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - gm107 font glitches with kernel 4.1rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90932">bug 90932</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Marcus Moeller from <a href="show_bug.cgi?id=90932#c7">comment #7</a>)
<span class="quote">&gt; Shouln't this be fixed in nouveau instead of moving to another driver? Or is
&gt; this just a suggestion for a workaround?</span >

The fix in nouveau will be &quot;remove glamor integration&quot; and &quot;fail to load for
GM107+&quot;. But we haven't fully decided on that *quite* yet. And I have an EXA
impl in the works for GM107, so perhaps we'll use that. TBD.

The problem that you're seeing is with glamor, and they changed the way font
rendering was done in X 1.17, which is why I'm suggesting you use that.

Separate from that, nouveau's integration with glamor is totally fubar'd and
should be removed, as per the above, but that has nothing to do with any
misrendering you might see. For example perhaps you might observe the lack of a
GLX_ARB_create_context_profile. This is a symptom of DRI2 support basically
missing, which is going to cause major problems.

Since nouveau's integration with glamor would be no different from
modesetting's integration with glamor, might as well just use that directly...
[There are one or two things nouveau can still do that modesetting can't, but
those differences are in the process of being eliminated.]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1435069036.27fa2.15959--

--===============0757555246==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0757555246==--
