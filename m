From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92307] G98/GM206: WARNING: ... at
 include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90
 [drm_kms_helper]()
Date: Wed, 02 Dec 2015 12:38:28 +0000
Message-ID: <bug-92307-8800-uysqcqK0jR@http.bugs.freedesktop.org/>
References: <bug-92307-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0782451443=="
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


--===============0782451443==
Content-Type: multipart/alternative; boundary="1449059908.DbAEE42.12797"; charset="UTF-8"


--1449059908.DbAEE42.12797
Date: Wed, 2 Dec 2015 12:38:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92307

--- Comment #16 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

Tested kernels:
4.4.0-0.rc3.git0.1.fc24.x86_64+debug
&
4.4.0-0.rc3.git0.1.fc24.x86_64+debug with updated nouveau from
http://cgit.freedesktop.org/~darktama/nouveau - up to commit 115ed46

- dmesg:
[  242.712518] WARNING: CPU: 2 PID: 2742 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  242.713194] WARNING: CPU: 2 PID: 2742 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  243.410428] WARNING: CPU: 2 PID: 2742 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  243.411084] WARNING: CPU: 2 PID: 2742 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  429.026360] WARNING: CPU: 2 PID: 2742 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  429.027127] WARNING: CPU: 2 PID: 2742 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  429.725127] WARNING: CPU: 2 PID: 308 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  429.725408] WARNING: CPU: 2 PID: 308 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  605.195250] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  605.195586] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  605.893962] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  605.894735] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  650.065838] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  650.066627] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  650.764764] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  650.765550] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[ 1258.081495] WARNING: CPU: 2 PID: 1879 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[ 1258.082210] WARNING: CPU: 2 PID: 1879 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[ 1258.780213] WARNING: CPU: 2 PID: 1879 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[ 1258.780934] WARNING: CPU: 2 PID: 1879 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
...

Although warnings are still here,
during S3 RESUME connected output/display -IS- enabled.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1449059908.DbAEE42.12797
Date: Wed, 2 Dec 2015 12:38:28 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92307#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - G98/GM206: WARNING: ... at include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92307">bug 92307</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
Tested kernels:
4.4.0-0.rc3.git0.1.fc24.x86_64+debug
&amp;
4.4.0-0.rc3.git0.1.fc24.x86_64+debug with updated nouveau from
<a href="http://cgit.freedesktop.org/~darktama/nouveau">http://cgit.freedesktop.org/~darktama/nouveau</a> - up to commit 115ed46

- dmesg:
[  242.712518] WARNING: CPU: 2 PID: 2742 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  242.713194] WARNING: CPU: 2 PID: 2742 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  243.410428] WARNING: CPU: 2 PID: 2742 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  243.411084] WARNING: CPU: 2 PID: 2742 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  429.026360] WARNING: CPU: 2 PID: 2742 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  429.027127] WARNING: CPU: 2 PID: 2742 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  429.725127] WARNING: CPU: 2 PID: 308 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  429.725408] WARNING: CPU: 2 PID: 308 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  605.195250] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  605.195586] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  605.893962] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  605.894735] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  650.065838] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  650.066627] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[  650.764764] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[  650.765550] WARNING: CPU: 2 PID: 50 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[ 1258.081495] WARNING: CPU: 2 PID: 1879 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[ 1258.082210] WARNING: CPU: 2 PID: 1879 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
[ 1258.780213] WARNING: CPU: 2 PID: 1879 at include/drm/drm_crtc.h:1565
drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()
[ 1258.780934] WARNING: CPU: 2 PID: 1879 at include/drm/drm_crtc.h:1565
drm_helper_choose_crtc_dpms+0x93/0xa0 [drm_kms_helper]()
...

Although warnings are still here,
during S3 RESUME connected output/display -IS- enabled.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1449059908.DbAEE42.12797--

--===============0782451443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0782451443==--
