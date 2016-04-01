From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94725] Nouveau driver fails to poweron GPU on GM204
 after dynamic poweroff
Date: Fri, 01 Apr 2016 03:13:31 +0000
Message-ID: <bug-94725-8800-FDkJG3SfRM@http.bugs.freedesktop.org/>
References: <bug-94725-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1114044132=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94725-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1114044132==
Content-Type: multipart/alternative; boundary="14594804113.84BD5DeE2.20676";
 charset="UTF-8"


--14594804113.84BD5DeE2.20676
Date: Fri, 1 Apr 2016 03:13:31 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94725

--- Comment #6 from Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Maybe these messages are pointing to the root of the problem:

[   51.608479] nouveau 0000:01:00.0: Refused to change power state, currently
in D3
[   51.683924] nouveau 0000:01:00.0: Refused to change power state, currently
in D3
[   51.700020] nouveau 0000:01:00.0: Refused to change power state, currently
in D3

If the device is still in D3 when we resume it, then accessing registers would
understandably result in a freeze. Devinit comes early enough in the resume
chain to make this plausible.

FWIW I can successfully suspend/resume (echo mem >/sys/power/state) a GTX 960,
but runtime PM works slightly differently.

I would like to enable runtime PM on my desktop GTX960 to repro this, but for
some reason I am failing - despite loading nouveau with "modeset=2 runpm=1", I
cannot see runtime PM kicking in and /sys/class/drm/card0/power/runtime_status
says "unsupported". What am I doing wrong?

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14594804113.84BD5DeE2.20676
Date: Fri, 1 Apr 2016 03:13:31 +0000
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
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725">bug 94725</a>
              from <span class="vcard"><a class="email" href="mailto:gnurou&#64;gmail.com" title="Alexandre Courbot &lt;gnurou&#64;gmail.com&gt;"> <span class="fn">Alexandre Courbot</span></a>
</span></b>
        <pre>Maybe these messages are pointing to the root of the problem:

[   51.608479] nouveau 0000:01:00.0: Refused to change power state, currently
in D3
[   51.683924] nouveau 0000:01:00.0: Refused to change power state, currently
in D3
[   51.700020] nouveau 0000:01:00.0: Refused to change power state, currently
in D3

If the device is still in D3 when we resume it, then accessing registers would
understandably result in a freeze. Devinit comes early enough in the resume
chain to make this plausible.

FWIW I can successfully suspend/resume (echo mem &gt;/sys/power/state) a GTX 960,
but runtime PM works slightly differently.

I would like to enable runtime PM on my desktop GTX960 to repro this, but for
some reason I am failing - despite loading nouveau with &quot;modeset=2 runpm=1&quot;, I
cannot see runtime PM kicking in and /sys/class/drm/card0/power/runtime_status
says &quot;unsupported&quot;. What am I doing wrong?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14594804113.84BD5DeE2.20676--

--===============1114044132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1114044132==--
