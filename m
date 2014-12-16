From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87361] [NV4C] GPU lock-up after booting to desktop
 in Fedora 20 & 21 (Nvidia Geforce 6100 IGP)
Date: Tue, 16 Dec 2014 16:30:47 +0000
Message-ID: <bug-87361-8800-Lzf2WmlFVc@http.bugs.freedesktop.org/>
References: <bug-87361-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1266894904=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87361-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1266894904==
Content-Type: multipart/alternative; boundary="1418747447.5F7d8E1.18478"; charset="UTF-8"


--1418747447.5F7d8E1.18478
Date: Tue, 16 Dec 2014 16:30:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87361

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
We did make some wild assumptions that nv4c msi worked like nv4e msi. Perhaps
they were unwarranted. Could you change
drivers/gpu/drm/nouveau/core/engine/device/nv40.c to have

device->oclass[NVDEV_SUBDEV_MC     ] =  nv44_mc_oclass

instead of nv4c_mc_oclass for the 0x4c case? (and remove NvMSI=0 from your
boot)

BTW, to answer some questions from the IRC log:

<4>[    1.628331] nouveau W[     DRM] DCB type 4 not known
<4>[    1.628335] nouveau W[     DRM] Unknown-1 has no encoders, removing

This is just the DVI connector on your motherboard which is implemented as an
external encoder. nouveau doesn't support that, there's a bug open about it.

<3>[   25.103513] nouveau E[    PBUS][0000:00:0d.0] MMIO write of 0x01000001
FAULT at 0x00b000

And the others -- these come from VPE, I have no idea how they happen since I'm
sure you're not even using VPE. But I've seen them on a bunch of people's boot
logs and they appear harmless. If you wanted to disable VPE, you'd boot with
nouveau.config=PMPEG=0. However it's unlikely to have any effect. PVP=0 should
have had literally 0 effect since you don't have a (functioning) VP engine on
those boards (you have VP1, but it's wholly unsupported by nouveau).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418747447.5F7d8E1.18478
Date: Tue, 16 Dec 2014 16:30:47 +0000
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
   title="NEW - [NV4C] GPU lock-up after booting to desktop in Fedora 20 &amp; 21 (Nvidia Geforce 6100 IGP)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87361#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV4C] GPU lock-up after booting to desktop in Fedora 20 &amp; 21 (Nvidia Geforce 6100 IGP)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87361">bug 87361</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>We did make some wild assumptions that nv4c msi worked like nv4e msi. Perhaps
they were unwarranted. Could you change
drivers/gpu/drm/nouveau/core/engine/device/nv40.c to have

device-&gt;oclass[NVDEV_SUBDEV_MC     ] =  nv44_mc_oclass

instead of nv4c_mc_oclass for the 0x4c case? (and remove NvMSI=0 from your
boot)

BTW, to answer some questions from the IRC log:

&lt;4&gt;[    1.628331] nouveau W[     DRM] DCB type 4 not known
&lt;4&gt;[    1.628335] nouveau W[     DRM] Unknown-1 has no encoders, removing

This is just the DVI connector on your motherboard which is implemented as an
external encoder. nouveau doesn't support that, there's a bug open about it.

&lt;3&gt;[   25.103513] nouveau E[    PBUS][0000:00:0d.0] MMIO write of 0x01000001
FAULT at 0x00b000

And the others -- these come from VPE, I have no idea how they happen since I'm
sure you're not even using VPE. But I've seen them on a bunch of people's boot
logs and they appear harmless. If you wanted to disable VPE, you'd boot with
nouveau.config=PMPEG=0. However it's unlikely to have any effect. PVP=0 should
have had literally 0 effect since you don't have a (functioning) VP engine on
those boards (you have VP1, but it's wholly unsupported by nouveau).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418747447.5F7d8E1.18478--

--===============1266894904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1266894904==--
