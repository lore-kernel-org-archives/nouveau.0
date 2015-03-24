From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Tue, 24 Mar 2015 09:41:42 +0000
Message-ID: <bug-89558-8800-XdmAHlaJ5j@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1097002016=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89558-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1097002016==
Content-Type: multipart/alternative; boundary="1427190102.6Ad22.3881"; charset="UTF-8"


--1427190102.6Ad22.3881
Date: Tue, 24 Mar 2015 09:41:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89558

--- Comment #23 from SMF <smf.linux-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org> ---
(In reply to SMF from comment #21)
> Using cpu-z on windows the graphics tab shows the Intel device as having 4GB
> and the Nvidia devices is reported as 1GB.

The literature that came with the laptop suggests that the VRAM is 4 GB (NVIDIA
GT840M 4 GB) so I think the answer is YES. My orginal hesitation stems from the
fact that the intel drm is reporting 2GB:

[    0.669881] Linux agpgart interface v0.103
[    0.669993] [drm] Initialized drm 1.1.0 20060810
[    0.670484] [drm] Memory usable by graphics device = 2048M
[    0.670569] [drm] Replacing VGA console driver
[    0.671121] Console: switching to colour dummy device 80x25
[    0.689829] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).

That may be a miscalculion/limitation for this system. Could this be a
consequence of this systems Intel/Nvidia hybrid setup?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427190102.6Ad22.3881
Date: Tue, 24 Mar 2015 09:41:42 +0000
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
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:smf.linux&#64;ntlworld.com" title="SMF &lt;smf.linux&#64;ntlworld.com&gt;"> <span class="fn">SMF</span></a>
</span></b>
        <pre>(In reply to SMF from <a href="show_bug.cgi?id=89558#c21">comment #21</a>)
<span class="quote">&gt; Using cpu-z on windows the graphics tab shows the Intel device as having 4GB
&gt; and the Nvidia devices is reported as 1GB.</span >

The literature that came with the laptop suggests that the VRAM is 4 GB (NVIDIA
GT840M 4 GB) so I think the answer is YES. My orginal hesitation stems from the
fact that the intel drm is reporting 2GB:

[    0.669881] Linux agpgart interface v0.103
[    0.669993] [drm] Initialized drm 1.1.0 20060810
[    0.670484] [drm] Memory usable by graphics device = 2048M
[    0.670569] [drm] Replacing VGA console driver
[    0.671121] Console: switching to colour dummy device 80x25
[    0.689829] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).

That may be a miscalculion/limitation for this system. Could this be a
consequence of this systems Intel/Nvidia hybrid setup?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427190102.6Ad22.3881--

--===============1097002016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1097002016==--
