From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92307] G98/GM206: WARNING: ... at
 include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90
 [drm_kms_helper]()
Date: Sat, 24 Oct 2015 11:31:15 +0000
Message-ID: <bug-92307-8800-SBTpftkveG@http.bugs.freedesktop.org/>
References: <bug-92307-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0255302088=="
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


--===============0255302088==
Content-Type: multipart/alternative; boundary="1445686274.cD0fBB101.9635"; charset="UTF-8"


--1445686274.cD0fBB101.9635
Date: Sat, 24 Oct 2015 11:31:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92307

--- Comment #6 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

$ dmesg | egrep WARNING\|kworker
[  131.880586] WARNING: CPU: 2 PID: 4017 at include/drm/drm_crtc.h:1577
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  131.880889] CPU: 2 PID: 4017 Comm: kworker/2:4 Tainted: G           OE  
4.3.0-0.rc6.git2.1.fc24.x86_64 #1
[  131.881373] WARNING: CPU: 2 PID: 4017 at include/drm/drm_crtc.h:1577
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  131.881589] CPU: 2 PID: 4017 Comm: kworker/2:4 Tainted: G        W  OE  
4.3.0-0.rc6.git2.1.fc24.x86_64 #1
[  132.578315] WARNING: CPU: 2 PID: 23 at include/drm/drm_crtc.h:1577
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  132.578383] CPU: 2 PID: 23 Comm: kworker/2:0 Tainted: G        W  OE  
4.3.0-0.rc6.git2.1.fc24.x86_64 #1
[  132.578517] WARNING: CPU: 2 PID: 23 at include/drm/drm_crtc.h:1577
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  132.578567] CPU: 2 PID: 23 Comm: kworker/2:0 Tainted: G        W  OE  
4.3.0-0.rc6.git2.1.fc24.x86_64 #1


$ modinfo -n nouveau
/lib/modules/4.3.0-0.rc6.git2.1.fc24.x86_64/updates/nouveau.ko


$ git log -1
commit 6b471ec900ba70fa72fddeb144fcf9ce59e80dfb
Author: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Date:   Wed Sep 30 00:23:52 2015 +0100

    clk/g84: Enable reclocking for GDDR3 G94-G200

    Your milage may vary, as it's only been tested on a single G94 and one G96.

    Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
    Tested-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445686274.cD0fBB101.9635
Date: Sat, 24 Oct 2015 11:31:14 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92307#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - G98/GM206: WARNING: ... at include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92307">bug 92307</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
$ dmesg | egrep WARNING\|kworker
[  131.880586] WARNING: CPU: 2 PID: 4017 at include/drm/drm_crtc.h:1577
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  131.880889] CPU: 2 PID: 4017 Comm: kworker/2:4 Tainted: G           OE  
4.3.0-0.rc6.git2.1.fc24.x86_64 #1
[  131.881373] WARNING: CPU: 2 PID: 4017 at include/drm/drm_crtc.h:1577
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  131.881589] CPU: 2 PID: 4017 Comm: kworker/2:4 Tainted: G        W  OE  
4.3.0-0.rc6.git2.1.fc24.x86_64 #1
[  132.578315] WARNING: CPU: 2 PID: 23 at include/drm/drm_crtc.h:1577
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  132.578383] CPU: 2 PID: 23 Comm: kworker/2:0 Tainted: G        W  OE  
4.3.0-0.rc6.git2.1.fc24.x86_64 #1
[  132.578517] WARNING: CPU: 2 PID: 23 at include/drm/drm_crtc.h:1577
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  132.578567] CPU: 2 PID: 23 Comm: kworker/2:0 Tainted: G        W  OE  
4.3.0-0.rc6.git2.1.fc24.x86_64 #1


$ modinfo -n nouveau
/lib/modules/4.3.0-0.rc6.git2.1.fc24.x86_64/updates/nouveau.ko


$ git log -1
commit 6b471ec900ba70fa72fddeb144fcf9ce59e80dfb
Author: Roy Spliet &lt;<a href="mailto:rspliet&#64;eclipso.eu">rspliet&#64;eclipso.eu</a>&gt;
Date:   Wed Sep 30 00:23:52 2015 +0100

    clk/g84: Enable reclocking for GDDR3 G94-G200

    Your milage may vary, as it's only been tested on a single G94 and one G96.

    Signed-off-by: Roy Spliet &lt;<a href="mailto:rspliet&#64;eclipso.eu">rspliet&#64;eclipso.eu</a>&gt;
    Tested-by: Pierre Moreau &lt;<a href="mailto:pierre.morrow&#64;free.fr">pierre.morrow&#64;free.fr</a>&gt;
    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445686274.cD0fBB101.9635--

--===============0255302088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0255302088==--
