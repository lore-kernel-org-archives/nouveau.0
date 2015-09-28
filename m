From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91535] [NVE7] Chrome can cause a nouveau 'multiple
 instances of buffer' message when overlaying a menu leading to X lockup
Date: Mon, 28 Sep 2015 21:41:41 +0000
Message-ID: <bug-91535-8800-VqJt6dNHBX@http.bugs.freedesktop.org/>
References: <bug-91535-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1231253205=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91535-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1231253205==
Content-Type: multipart/alternative; boundary="1443476501.E13a3.6415"; charset="UTF-8"


--1443476501.E13a3.6415
Date: Mon, 28 Sep 2015 21:41:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91535

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I've recently pushed some patches which solved this issue in Witcher 2. They
should end up in Mesa 11.0.2 when that is released, but are already at mesa
HEAD:

http://cgit.freedesktop.org/mesa/mesa/commit/?id=d4e650b07bc80075f0d088e7d85df9efa45e11bd
http://cgit.freedesktop.org/mesa/mesa/commit/?id=3a6b9a7830c3df14ffcfbbf57c82ea08bd59ef04
http://cgit.freedesktop.org/mesa/mesa/commit/?id=1d8cba9b51b7a6e7dbf3f0d3f53b5c232fd0b5b2

I have no idea if these will help with the issues you guys see with Chrome,
but... they might!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1443476501.E13a3.6415
Date: Mon, 28 Sep 2015 21:41:41 +0000
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
   title="NEW - [NVE7] Chrome can cause a nouveau 'multiple instances of buffer' message when overlaying a menu leading to X lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91535#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] Chrome can cause a nouveau 'multiple instances of buffer' message when overlaying a menu leading to X lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91535">bug 91535</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I've recently pushed some patches which solved this issue in Witcher 2. They
should end up in Mesa 11.0.2 when that is released, but are already at mesa
HEAD:

<a href="http://cgit.freedesktop.org/mesa/mesa/commit/?id=d4e650b07bc80075f0d088e7d85df9efa45e11bd">http://cgit.freedesktop.org/mesa/mesa/commit/?id=d4e650b07bc80075f0d088e7d85df9efa45e11bd</a>
<a href="http://cgit.freedesktop.org/mesa/mesa/commit/?id=3a6b9a7830c3df14ffcfbbf57c82ea08bd59ef04">http://cgit.freedesktop.org/mesa/mesa/commit/?id=3a6b9a7830c3df14ffcfbbf57c82ea08bd59ef04</a>
<a href="http://cgit.freedesktop.org/mesa/mesa/commit/?id=1d8cba9b51b7a6e7dbf3f0d3f53b5c232fd0b5b2">http://cgit.freedesktop.org/mesa/mesa/commit/?id=1d8cba9b51b7a6e7dbf3f0d3f53b5c232fd0b5b2</a>

I have no idea if these will help with the issues you guys see with Chrome,
but... they might!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443476501.E13a3.6415--

--===============1231253205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1231253205==--
