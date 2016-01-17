From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92307] G98/G94/GK106/GM204: WARNING: ... at
 include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90
 [drm_kms_helper]()/
Date: Sun, 17 Jan 2016 19:26:13 +0000
Message-ID: <bug-92307-8800-IT9tcpFafE@http.bugs.freedesktop.org/>
References: <bug-92307-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1848182570=="
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


--===============1848182570==
Content-Type: multipart/alternative; boundary="14530587734.c054b15.23517";
 charset="UTF-8"


--14530587734.c054b15.23517
Date: Sun, 17 Jan 2016 19:26:13 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=92307

--- Comment #28 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

Commit:
"drm/nouveau/kms: take mode_config mutex in connector hotplug path"
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/nouveau/nouveau_connector.c?id=0a882cad
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/patch/drivers/gpu/drm/nouveau/nouveau_connector.c?id=0a882cad

solves only WARNING(s),
everything else is equally broken - "xrandr-ing" with GL(X) compositing.

Tested with 4.5.0-0.rc0.git3.1.fc24.x86_64

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14530587734.c054b15.23517
Date: Sun, 17 Jan 2016 19:26:13 +0000
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
   title="NEW - G98/G94/GK106/GM204: WARNING: ... at include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()/"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92307#c28">Comment # 28</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - G98/G94/GK106/GM204: WARNING: ... at include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()/"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92307">bug 92307</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
Commit:
&quot;drm/nouveau/kms: take mode_config mutex in connector hotplug path&quot;
<a href="https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/nouveau/nouveau_connector.c?id=0a882cad">https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/nouveau/nouveau_connector.c?id=0a882cad</a>
<a href="https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/patch/drivers/gpu/drm/nouveau/nouveau_connector.c?id=0a882cad">https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/patch/drivers/gpu/drm/nouveau/nouveau_connector.c?id=0a882cad</a>

solves only WARNING(s),
everything else is equally broken - &quot;xrandr-ing&quot; with GL(X) compositing.

Tested with 4.5.0-0.rc0.git3.1.fc24.x86_64</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14530587734.c054b15.23517--

--===============1848182570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1848182570==--
