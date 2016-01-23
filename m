From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93405] nouveau: Xorg crashes sooner or later in
	3840x2160 mode
Date: Sat, 23 Jan 2016 10:40:02 +0000
Message-ID: <bug-93405-8800-OULFZMZo6z@http.bugs.freedesktop.org/>
References: <bug-93405-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2044567829=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93405-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2044567829==
Content-Type: multipart/alternative; boundary="14535456012.4A4b8dD0.9151";
 charset="UTF-8"


--14535456012.4A4b8dD0.9151
Date: Sat, 23 Jan 2016 10:40:01 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93405

--- Comment #13 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Just did a small search on NVIDIA's website: only Kepler+ cards support 4K,
with the notice for Kepler cards at least, that

>  3840x2160 at 30Hz or 4096x2160 at 24Hz supported over HDMI. 4096x2160 (including 3840x2160) at 60Hz supported over Displayport. Support for 4k tiled MST displays requires 326.19 driver or later.

Tesla and Fermi cards are advertised of having a "Maximum Digital Resolution"
of 2560x1600, so no, 3840x2160 won't work on your G96M, sorry.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14535456012.4A4b8dD0.9151
Date: Sat, 23 Jan 2016 10:40:01 +0000
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
   title="NEW - nouveau: Xorg crashes sooner or later in 3840x2160 mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93405#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau: Xorg crashes sooner or later in 3840x2160 mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93405">bug 93405</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Just did a small search on NVIDIA's website: only Kepler+ cards support 4K,
with the notice for Kepler cards at least, that

<span class="quote">&gt;  3840x2160 at 30Hz or 4096x2160 at 24Hz supported over HDMI. 4096x2160 (including 3840x2160) at 60Hz supported over Displayport. Support for 4k tiled MST displays requires 326.19 driver or later.</span >

Tesla and Fermi cards are advertised of having a &quot;Maximum Digital Resolution&quot;
of 2560x1600, so no, 3840x2160 won't work on your G96M, sorry.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14535456012.4A4b8dD0.9151--

--===============2044567829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2044567829==--
