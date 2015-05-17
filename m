From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90435] [NV46] moving 3D objects drawn static
Date: Sun, 17 May 2015 13:59:05 +0000
Message-ID: <bug-90435-8800-hXeYg565hW@http.bugs.freedesktop.org/>
References: <bug-90435-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1064027386=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90435-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1064027386==
Content-Type: multipart/alternative; boundary="1431871144.DbEeCc1.16384"; charset="UTF-8"


--1431871144.DbEeCc1.16384
Date: Sun, 17 May 2015 13:59:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90435

--- Comment #4 from Ilya <dikiy_evrej-S0/GAf8tV78@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #3)
> OK, well at one point or another (like mesa 10.0), glxgears definitely
> worked on my NV43 and NV44 (which cover both 3d classes available in the
> nv4x family). Could be that there's something funky about NV46 specifically,
> or worse, something funky about *your* nv46.

So, I tried Mesa 10.4 - same behaviour. Then I tried Mesa 10.0 - glxgears
works! But then I tried to start my simple program - and I catch a hangup fo
X-server.

program code (shadow.c) is in attach.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431871144.DbEeCc1.16384
Date: Sun, 17 May 2015 13:59:04 +0000
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
   title="NEW - [NV46] moving 3D objects drawn static"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90435#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] moving 3D objects drawn static"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90435">bug 90435</a>
              from <span class="vcard"><a class="email" href="mailto:dikiy_evrej&#64;web.de" title="Ilya &lt;dikiy_evrej&#64;web.de&gt;"> <span class="fn">Ilya</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90435#c3">comment #3</a>)
<span class="quote">&gt; OK, well at one point or another (like mesa 10.0), glxgears definitely
&gt; worked on my NV43 and NV44 (which cover both 3d classes available in the
&gt; nv4x family). Could be that there's something funky about NV46 specifically,
&gt; or worse, something funky about *your* nv46.</span >

So, I tried Mesa 10.4 - same behaviour. Then I tried Mesa 10.0 - glxgears
works! But then I tried to start my simple program - and I catch a hangup fo
X-server.

program code (shadow.c) is in attach.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431871144.DbEeCc1.16384--

--===============1064027386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1064027386==--
