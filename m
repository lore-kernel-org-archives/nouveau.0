From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Fri, 05 Jun 2015 15:36:06 +0000
Message-ID: <bug-90871-8800-HDj6SU9suG@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1996721916=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90871-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1996721916==
Content-Type: multipart/alternative; boundary="1433518565.B2DBbB61.6645"; charset="UTF-8"


--1433518565.B2DBbB61.6645
Date: Fri, 5 Jun 2015 15:36:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

--- Comment #1 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

- Fedora 21 - working Xfvm4 compositing setup:

xorg-x11-server-Xorg 1.16.3-2.fc21
xorg-x11-drv-nouveau 1.0.11-1.fc21
mesa 10.4.7-1.20150323.fc21
libdrm 2.4.60-1.fc21
libXpresent 1.0.0-1.fc21
xfwm4 4.12.3-3.git20150518.fc21


- Fedora 22 - none working Xfvm4 compositing setup - garbled display:

xorg-x11-server-Xorg 1.17.1-12.fc22
xorg-x11-drv-nouveau 1.0.11-2.fc22
mesa 10.5.4-1.20150505.fc22
libdrm 2.4.61-3.fc22
libXpresent 1.0.0-1.fc22
xfwm4 4.12.3-3.git20150518.fc22

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1433518565.B2DBbB61.6645
Date: Fri, 5 Jun 2015 15:36:05 +0000
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
   title="NEW - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
- Fedora 21 - working Xfvm4 compositing setup:

xorg-x11-server-Xorg 1.16.3-2.fc21
xorg-x11-drv-nouveau 1.0.11-1.fc21
mesa 10.4.7-1.20150323.fc21
libdrm 2.4.60-1.fc21
libXpresent 1.0.0-1.fc21
xfwm4 4.12.3-3.git20150518.fc21


- Fedora 22 - none working Xfvm4 compositing setup - garbled display:

xorg-x11-server-Xorg 1.17.1-12.fc22
xorg-x11-drv-nouveau 1.0.11-2.fc22
mesa 10.5.4-1.20150505.fc22
libdrm 2.4.61-3.fc22
libXpresent 1.0.0-1.fc22
xfwm4 4.12.3-3.git20150518.fc22</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1433518565.B2DBbB61.6645--

--===============1996721916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1996721916==--
