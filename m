From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92892] [NVA8/NV98] KDE Plasma locks up: Nouveau
 reports error "resource sanity check" "unable to handle kernel paging
 request"
Date: Wed, 03 Feb 2016 03:29:54 +0000
Message-ID: <bug-92892-8800-28EzFShFqX@http.bugs.freedesktop.org/>
References: <bug-92892-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0134859797=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92892-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0134859797==
Content-Type: multipart/alternative; boundary="14544701940.44aE.31144";
 charset="UTF-8"


--14544701940.44aE.31144
Date: Wed, 3 Feb 2016 03:29:54 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=92892

--- Comment #13 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 121479
  --> https://bugs.freedesktop.org/attachment.cgi?id=121479&action=edit
dmesg 4.5.0-0.rc2.git0.1.fc24.x86_64 nouveau KDE5


SW:
kernel-modules-4.5.0-0.rc2.git0.1.fc24.x86_64
libdrm-2.4.66-1.fc24.x86_64
xorg-x11-server-Xorg-1.18.0-5.fc24.x86_64
xorg-x11-drv-nouveau-1.0.12-1.fc24.x86_64
mesa-dri-drivers-11.2.0-0.devel.8.24ea81a.fc24.x86_64
plasma-workspace-5.5.4-1.fc24.x86_64
qt5-qtdeclarative-5.6.0-0.7.beta.fc24.x86_64

HW:
NVIDIA G98

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14544701940.44aE.31144
Date: Wed, 3 Feb 2016 03:29:54 +0000
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
   title="NEW - [NVA8/NV98] KDE Plasma locks up: Nouveau reports error &quot;resource sanity check&quot; &quot;unable to handle kernel paging request&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92892#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA8/NV98] KDE Plasma locks up: Nouveau reports error &quot;resource sanity check&quot; &quot;unable to handle kernel paging request&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92892">bug 92892</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=121479" name="attach_121479" title="dmesg 4.5.0-0.rc2.git0.1.fc24.x86_64 nouveau KDE5">attachment 121479</a> <a href="attachment.cgi?id=121479&amp;action=edit" title="dmesg 4.5.0-0.rc2.git0.1.fc24.x86_64 nouveau KDE5">[details]</a></span>
dmesg 4.5.0-0.rc2.git0.1.fc24.x86_64 nouveau KDE5


SW:
kernel-modules-4.5.0-0.rc2.git0.1.fc24.x86_64
libdrm-2.4.66-1.fc24.x86_64
xorg-x11-server-Xorg-1.18.0-5.fc24.x86_64
xorg-x11-drv-nouveau-1.0.12-1.fc24.x86_64
mesa-dri-drivers-11.2.0-0.devel.8.24ea81a.fc24.x86_64
plasma-workspace-5.5.4-1.fc24.x86_64
qt5-qtdeclarative-5.6.0-0.7.beta.fc24.x86_64

HW:
NVIDIA G98</pre>
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
--14544701940.44aE.31144--

--===============0134859797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0134859797==--
