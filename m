From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92892] [NVA8/NV98] KDE Plasma locks up: Nouveau
 reports error "resource sanity check" "unable to handle kernel paging
 request"
Date: Wed, 03 Feb 2016 05:23:01 +0000
Message-ID: <bug-92892-8800-MSZrA1QRmH@http.bugs.freedesktop.org/>
References: <bug-92892-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2045684445=="
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


--===============2045684445==
Content-Type: multipart/alternative; boundary="14544769803.D1dAbb.13234";
 charset="UTF-8"


--14544769803.D1dAbb.13234
Date: Wed, 3 Feb 2016 05:23:00 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=92892

--- Comment #14 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

After upgrade to:
$ rpm --query --file /usr/lib64/libQt5Qml.so.5.6.0
qt5-qtdeclarative-5.6.0-0.8.beta.fc24.x86_64
KDE5 starts without hassle


Ref.
- Info: qt5-qtdeclarative-5.6.0-0.8.beta.fc24
  http://koji.fedoraproject.org/koji/buildinfo?buildID=715479
  "build with -fno-delete-null-pointer-checks to workaround gcc6-related
runtime crashes (#1303643)"

- "qt5-qtdeclarative-5.6.0-0.7.beta.fc24 broken"
  https://bugzilla.redhat.com/show_bug.cgi?id=1303643

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14544769803.D1dAbb.13234
Date: Wed, 3 Feb 2016 05:23:00 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92892#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA8/NV98] KDE Plasma locks up: Nouveau reports error &quot;resource sanity check&quot; &quot;unable to handle kernel paging request&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92892">bug 92892</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
After upgrade to:
$ rpm --query --file /usr/lib64/libQt5Qml.so.5.6.0
qt5-qtdeclarative-5.6.0-0.8.beta.fc24.x86_64
KDE5 starts without hassle


Ref.
- Info: qt5-qtdeclarative-5.6.0-0.8.beta.fc24
  <a href="http://koji.fedoraproject.org/koji/buildinfo?buildID=715479">http://koji.fedoraproject.org/koji/buildinfo?buildID=715479</a>
  &quot;build with -fno-delete-null-pointer-checks to workaround gcc6-related
runtime crashes (#1303643)&quot;

- &quot;qt5-qtdeclarative-5.6.0-0.7.beta.fc24 broken&quot;
  <a href="https://bugzilla.redhat.com/show_bug.cgi?id=1303643">https://bugzilla.redhat.com/show_bug.cgi?id=1303643</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>
--14544769803.D1dAbb.13234--

--===============2045684445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2045684445==--
