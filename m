From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58784] Nouveau on NVCE,
	reclocking: memory type not supported?
Date: Sun, 01 Feb 2015 00:24:19 +0000
Message-ID: <bug-58784-8800-FHImGxizou@http.bugs.freedesktop.org/>
References: <bug-58784-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2025821731=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58784-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2025821731==
Content-Type: multipart/alternative; boundary="1422750259.E65EfD3.4989"; charset="UTF-8"


--1422750259.E65EfD3.4989
Date: Sun, 1 Feb 2015 00:24:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58784

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Tobias Klausmann from comment #1)
> is this still a problem with newer version of the kernel while booting with
> the _experimental_ nouveau.pstate=1 and change the clocks at the pstate file
> "echo 0f /sys/class/drm/{nvidia_card}/device/pstate" ?

Yes, it is. There's no reclocking support on nvc0.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422750259.E65EfD3.4989
Date: Sun, 1 Feb 2015 00:24:19 +0000
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
   title="NEW - Nouveau on NVCE, reclocking: memory type not supported?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58784#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau on NVCE, reclocking: memory type not supported?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58784">bug 58784</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Tobias Klausmann from <a href="show_bug.cgi?id=58784#c1">comment #1</a>)
<span class="quote">&gt; is this still a problem with newer version of the kernel while booting with
&gt; the _experimental_ nouveau.pstate=1 and change the clocks at the pstate file
&gt; &quot;echo 0f /sys/class/drm/{nvidia_card}/device/pstate&quot; ?</span >

Yes, it is. There's no reclocking support on nvc0.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422750259.E65EfD3.4989--

--===============2025821731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2025821731==--
