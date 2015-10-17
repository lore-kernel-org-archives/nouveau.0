From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92504] [NVA5] Corruption in Plasma 5 on resume after
 changing screen configuration
Date: Sat, 17 Oct 2015 18:52:53 +0000
Message-ID: <bug-92504-8800-NyMxmaUCyU@http.bugs.freedesktop.org/>
References: <bug-92504-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2080227588=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92504-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2080227588==
Content-Type: multipart/alternative; boundary="1445107973.D0cADE5A1.11656"; charset="UTF-8"


--1445107973.D0cADE5A1.11656
Date: Sat, 17 Oct 2015 18:52:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92504

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Alexander Schlarb from comment #13)
> I hope this is more useful :-)

*MUCH* more useful.

[   91.919550] bo valid domains: 2
[   91.919557] valid domains:    4
[   91.919559] read domains:     0
[   91.919560] write domains:    4
[   91.919565] nouveau 0000:01:00.0: plasmashell[2578]: fail set_domain
[   91.919569] nouveau 0000:01:00.0: plasmashell[2578]: validating bo list
[   91.919587] nouveau 0000:01:00.0: plasmashell[2578]: validate: -22

So bo->valid_domains == VRAM, but we're trying to write to it via GART. Hmmmm.

I'm going to try to come up with a patch that figures out the gpu va of the bo
in question... hopefully that will provide further hints in conjunction with
the pushbuf dump.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445107973.D0cADE5A1.11656
Date: Sat, 17 Oct 2015 18:52:53 +0000
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
   title="NEW - [NVA5] Corruption in Plasma 5 on resume after changing screen configuration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92504#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA5] Corruption in Plasma 5 on resume after changing screen configuration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92504">bug 92504</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Alexander Schlarb from <a href="show_bug.cgi?id=92504#c13">comment #13</a>)
<span class="quote">&gt; I hope this is more useful :-)</span >

*MUCH* more useful.

[   91.919550] bo valid domains: 2
[   91.919557] valid domains:    4
[   91.919559] read domains:     0
[   91.919560] write domains:    4
[   91.919565] nouveau 0000:01:00.0: plasmashell[2578]: fail set_domain
[   91.919569] nouveau 0000:01:00.0: plasmashell[2578]: validating bo list
[   91.919587] nouveau 0000:01:00.0: plasmashell[2578]: validate: -22

So bo-&gt;valid_domains == VRAM, but we're trying to write to it via GART. Hmmmm.

I'm going to try to come up with a patch that figures out the gpu va of the bo
in question... hopefully that will provide further hints in conjunction with
the pushbuf dump.</pre>
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

--1445107973.D0cADE5A1.11656--

--===============2080227588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2080227588==--
