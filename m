From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Mon, 02 Nov 2015 23:34:11 +0000
Message-ID: <bug-70354-8800-phw9AEvml0@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0354797220=="
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


--===============0354797220==
Content-Type: multipart/alternative; boundary="1446507251.12Ed1.29430"; charset="UTF-8"


--1446507251.12Ed1.29430
Date: Mon, 2 Nov 2015 23:34:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #83 from Julien Isorce <julien.isorce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #82) 
> You should see the following print:
> 
> nvkm_info(&pmu->subdev, "hw bug workaround enabled\n");
> 
> in your kernel log. You need to be running Linux 4.3-rcN for that code to
> exist in the driver (or a driver built from Ben's repo).

Thx for the info. I do not see this trace and actually it seems that the code
around the workaround is not called. Is it possible that it fails before ?
"timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1478/gf100_gr_init_ctxctl"

It timeouts from gf100.c and the trace you pointed is in gk104.c, if it helps.
I added more traces in gk104_pmu_pgob and it does not print. 
(I set: echo 9 | sudo tee /sys/module/drm/parameters/debug   and  added some
nvkm_error,   nothing about "workaround" in /var/logs/kern.log")

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446507251.12Ed1.29430
Date: Mon, 2 Nov 2015 23:34:11 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c83">Comment # 83</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:julien.isorce&#64;gmail.com" title="Julien Isorce &lt;julien.isorce&#64;gmail.com&gt;"> <span class="fn">Julien Isorce</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=70354#c82">comment #82</a>) 
<span class="quote">&gt; You should see the following print:
&gt; 
&gt; nvkm_info(&amp;pmu-&gt;subdev, &quot;hw bug workaround enabled\n&quot;);
&gt; 
&gt; in your kernel log. You need to be running Linux 4.3-rcN for that code to
&gt; exist in the driver (or a driver built from Ben's repo).</span >

Thx for the info. I do not see this trace and actually it seems that the code
around the workaround is not called. Is it possible that it fails before ?
&quot;timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1478/gf100_gr_init_ctxctl&quot;

It timeouts from gf100.c and the trace you pointed is in gk104.c, if it helps.
I added more traces in gk104_pmu_pgob and it does not print. 
(I set: echo 9 | sudo tee /sys/module/drm/parameters/debug   and  added some
nvkm_error,   nothing about &quot;workaround&quot; in /var/logs/kern.log&quot;)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446507251.12Ed1.29430--

--===============0354797220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0354797220==--
