From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70972] [NV67] Modesetting failure at 1280x800
Date: Mon, 23 Feb 2015 15:51:01 +0000
Message-ID: <bug-70972-8800-HGG4li8vIL@http.bugs.freedesktop.org/>
References: <bug-70972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0186852475=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70972-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0186852475==
Content-Type: multipart/alternative; boundary="1424706661.F1a32.22658"; charset="UTF-8"


--1424706661.F1a32.22658
Date: Mon, 23 Feb 2015 15:51:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70972

--- Comment #11 from ade <adloconwy+freebug-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I also have an NVIDIA GeForce 7150m / nForce 630m and I am also experiencing
this problem. The screen is garbled in both X and the console.

I noticed that xrandr detects a load on TV-1 even though nothing is connected
to this port. I have tried setting the video=TV-1:d and nouveau.tv_disable=1
kernel options, but neither of these have any effect.

I can get a clear image if I set the resolution to 1024x768, but this is not
ideal as this is not my monitor's native resolution.

I am wondering if the cause of the garbled screen could be TV-out misdetection?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424706661.F1a32.22658
Date: Mon, 23 Feb 2015 15:51:01 +0000
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
   title="NEW - [NV67] Modesetting failure at 1280x800"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70972#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV67] Modesetting failure at 1280x800"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70972">bug 70972</a>
              from <span class="vcard"><a class="email" href="mailto:adloconwy+freebug&#64;gmail.com" title="ade &lt;adloconwy+freebug&#64;gmail.com&gt;"> <span class="fn">ade</span></a>
</span></b>
        <pre>I also have an NVIDIA GeForce 7150m / nForce 630m and I am also experiencing
this problem. The screen is garbled in both X and the console.

I noticed that xrandr detects a load on TV-1 even though nothing is connected
to this port. I have tried setting the video=TV-1:d and nouveau.tv_disable=1
kernel options, but neither of these have any effect.

I can get a clear image if I set the resolution to 1024x768, but this is not
ideal as this is not my monitor's native resolution.

I am wondering if the cause of the garbled screen could be TV-out misdetection?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424706661.F1a32.22658--

--===============0186852475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0186852475==--
