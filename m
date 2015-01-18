From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Sun, 18 Jan 2015 13:37:12 +0000
Message-ID: <bug-70354-8800-yg3W8VQv86@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0396090969=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0396090969==
Content-Type: multipart/alternative; boundary="1421588232.8C1dAd5.26514"; charset="UTF-8"


--1421588232.8C1dAd5.26514
Date: Sun, 18 Jan 2015 13:37:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #39 from Vitaly Torshyn <vitaly.torshyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi folks,
Please see previously attached dmesg and xorg logs.
I was using Ben's git repo to apply a patch for 3.18.2 kernel.
Actually, the patch is only removed INIT HUB error. In addition, X was managed
to start with AIGLX enabled but nouveau crashed on start any GL enabled
application.
Please note, the same behavior with SLI enabled. 
HW is Lenovo Y510P with dual GT 755M video.

Please, feel free to request additional information.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421588232.8C1dAd5.26514
Date: Sun, 18 Jan 2015 13:37:12 +0000
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
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c39">Comment # 39</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:vitaly.torshyn&#64;gmail.com" title="Vitaly Torshyn &lt;vitaly.torshyn&#64;gmail.com&gt;"> <span class="fn">Vitaly Torshyn</span></a>
</span></b>
        <pre>Hi folks,
Please see previously attached dmesg and xorg logs.
I was using Ben's git repo to apply a patch for 3.18.2 kernel.
Actually, the patch is only removed INIT HUB error. In addition, X was managed
to start with AIGLX enabled but nouveau crashed on start any GL enabled
application.
Please note, the same behavior with SLI enabled. 
HW is Lenovo Y510P with dual GT 755M video.

Please, feel free to request additional information.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421588232.8C1dAd5.26514--

--===============0396090969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0396090969==--
