From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92307] G98/G94/GK106/GM204/GF119: WARNING: ... at
 include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90
 [drm_kms_helper]()
Date: Wed, 20 Jan 2016 14:09:24 +0000
Message-ID: <bug-92307-8800-C5cIBMd6wk@http.bugs.freedesktop.org/>
References: <bug-92307-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0074297190=="
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


--===============0074297190==
Content-Type: multipart/alternative; boundary="14532989654.2DfAbDa.20718";
 charset="UTF-8"


--14532989654.2DfAbDa.20718
Date: Wed, 20 Jan 2016 14:09:25 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=92307

--- Comment #31 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

While GL(X) compositing,

not only that DRI3 introduces cca. 1 sec lag,
i.e. slowdown as reported here:
https://bugs.freedesktop.org/show_bug.cgi?id=92271

but it breaks overall "xrandr --rotate ..." routine.

Tested with Latest n' Greatest on Rawhide - Xfce, GNOME and KDE.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14532989654.2DfAbDa.20718
Date: Wed, 20 Jan 2016 14:09:25 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - G98/G94/GK106/GM204/GF119: WARNING: ... at include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92307#c31">Comment # 31</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - G98/G94/GK106/GM204/GF119: WARNING: ... at include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92307">bug 92307</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
While GL(X) compositing,

not only that DRI3 introduces cca. 1 sec lag,
i.e. slowdown as reported here:
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Unusably slow OpenGL performance on nouveau (GeForce 9600 GT) with rotated output under DRI 3"
   href="show_bug.cgi?id=92271">https://bugs.freedesktop.org/show_bug.cgi?id=92271</a>

but it breaks overall &quot;xrandr --rotate ...&quot; routine.

Tested with Latest n' Greatest on Rawhide - Xfce, GNOME and KDE.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14532989654.2DfAbDa.20718--

--===============0074297190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0074297190==--
