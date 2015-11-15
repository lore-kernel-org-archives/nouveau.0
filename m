From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92307] G98/GM206: WARNING: ... at
 include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90
 [drm_kms_helper]()
Date: Sun, 15 Nov 2015 10:07:21 +0000
Message-ID: <bug-92307-8800-NqizHC1TiR@http.bugs.freedesktop.org/>
References: <bug-92307-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1104712772=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92307-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1104712772==
Content-Type: multipart/alternative; boundary="1447582041.abDAD1.19906"; charset="UTF-8"


--1447582041.abDAD1.19906
Date: Sun, 15 Nov 2015 10:07:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92307

--- Comment #14 from Don O <japhack-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> ---
(In reply to poma from comment #13)
>...
> Conclusion:
> In this regard, it does not change anything - with or without
> ~darktama/nouveau update, with or without patch.

Do you have nouveau set up as built-in or module?

If you have it built-in then creating a module won't have any effect as the
system will never use that.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447582041.abDAD1.19906
Date: Sun, 15 Nov 2015 10:07:21 +0000
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
   title="NEW - G98/GM206: WARNING: ... at include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92307#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - G98/GM206: WARNING: ... at include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92307">bug 92307</a>
              from <span class="vcard"><a class="email" href="mailto:japhack&#64;yahoo.com" title="Don O &lt;japhack&#64;yahoo.com&gt;"> <span class="fn">Don O</span></a>
</span></b>
        <pre>(In reply to poma from <a href="show_bug.cgi?id=92307#c13">comment #13</a>)
<span class="quote">&gt;...
&gt; Conclusion:
&gt; In this regard, it does not change anything - with or without
&gt; ~darktama/nouveau update, with or without patch.</span >

Do you have nouveau set up as built-in or module?

If you have it built-in then creating a module won't have any effect as the
system will never use that.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447582041.abDAD1.19906--

--===============1104712772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1104712772==--
