From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85160] [NV94] INVALID_STATE error,
 X fails to start on GeForce 9600 GT with dual monitors,
 kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards
Date: Wed, 12 Nov 2014 06:37:24 +0000
Message-ID: <bug-85160-8800-ipPmz091DH@http.bugs.freedesktop.org/>
References: <bug-85160-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0152350396=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85160-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0152350396==
Content-Type: multipart/alternative; boundary="1415774244.dbbfb2.21402"; charset="UTF-8"


--1415774244.dbbfb2.21402
Date: Wed, 12 Nov 2014 06:37:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85160

--- Comment #26 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

Combination also tested, works OK:
http://koji.fedoraproject.org/koji/buildinfo?buildID=592269
&
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=ae69cfb

$ modinfo nouveau -n
/lib/modules/3.18.0-0.rc4.git0.2.fc22.x86_64/updates/nouveau.ko

Thanks guys.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.

--1415774244.dbbfb2.21402
Date: Wed, 12 Nov 2014 06:37:24 +0000
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
          bz_status_ASSIGNED "
   title="ASSIGNED - [NV94] INVALID_STATE error, X fails to start on GeForce 9600 GT with dual monitors, kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85160#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - [NV94] INVALID_STATE error, X fails to start on GeForce 9600 GT with dual monitors, kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85160">bug 85160</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
Combination also tested, works OK:
<a href="http://koji.fedoraproject.org/koji/buildinfo?buildID=592269">http://koji.fedoraproject.org/koji/buildinfo?buildID=592269</a>
&amp;
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=ae69cfb">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=ae69cfb</a>

$ modinfo nouveau -n
/lib/modules/3.18.0-0.rc4.git0.2.fc22.x86_64/updates/nouveau.ko

Thanks guys.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>

--1415774244.dbbfb2.21402--

--===============0152350396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0152350396==--
