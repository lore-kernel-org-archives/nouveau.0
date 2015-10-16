From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92504] [NVA5] Corruption in Plasma 5 on resume after
 changing screen configuration
Date: Fri, 16 Oct 2015 20:08:50 +0000
Message-ID: <bug-92504-8800-sG7CbxqXSi@http.bugs.freedesktop.org/>
References: <bug-92504-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0740074643=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92504-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0740074643==
Content-Type: multipart/alternative; boundary="1445026130.5252Ca61.22293"; charset="UTF-8"


--1445026130.5252Ca61.22293
Date: Fri, 16 Oct 2015 20:08:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92504

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Actually the issue is most likely due to

[20351.450000] nouveau E[plasmashell[13570]] fail set_domain
[20351.450006] nouveau E[plasmashell[13570]] validating bo list
[20351.450015] nouveau E[plasmashell[13570]] validate: -22

Which is... odd. This happens when

        uint32_t domains = valid_domains & nvbo->valid_domains &
                (write_domains ? write_domains : read_domains);

        if (!domains)
                return -EINVAL;

Which means that unless nvbo->valid_domains had something funny in it, this is
all good. Hmmm....

        nvbo->valid_domains = NOUVEAU_GEM_DOMAIN_VRAM |
                              NOUVEAU_GEM_DOMAIN_GART;
        if (drm->device.info.family >= NV_DEVICE_INFO_V0_TESLA)
                nvbo->valid_domains &= domain;

So if we ever supply a valid/read/write domains that's not the same as the
domain we created the bo with, then this will fail. However after some scouring
of the code, I don't where we'd be messing this up. And unfortunately nothing
that libdrm prints will help this. I'm also unsure of 

If you can, could you patch 
drivers/gpu/drm/nouveau/nouveau_gem.c:nouveau_gem_set_domain to have a print of
all 4 inputs to domains to see why it's coming out as 0?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445026130.5252Ca61.22293
Date: Fri, 16 Oct 2015 20:08:50 +0000
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
   title="NEW - [NVA5] Corruption in Plasma 5 on resume after changing screen configuration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92504#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA5] Corruption in Plasma 5 on resume after changing screen configuration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92504">bug 92504</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Actually the issue is most likely due to

[20351.450000] nouveau E[plasmashell[13570]] fail set_domain
[20351.450006] nouveau E[plasmashell[13570]] validating bo list
[20351.450015] nouveau E[plasmashell[13570]] validate: -22

Which is... odd. This happens when

        uint32_t domains = valid_domains &amp; nvbo-&gt;valid_domains &amp;
                (write_domains ? write_domains : read_domains);

        if (!domains)
                return -EINVAL;

Which means that unless nvbo-&gt;valid_domains had something funny in it, this is
all good. Hmmm....

        nvbo-&gt;valid_domains = NOUVEAU_GEM_DOMAIN_VRAM |
                              NOUVEAU_GEM_DOMAIN_GART;
        if (drm-&gt;device.info.family &gt;= NV_DEVICE_INFO_V0_TESLA)
                nvbo-&gt;valid_domains &amp;= domain;

So if we ever supply a valid/read/write domains that's not the same as the
domain we created the bo with, then this will fail. However after some scouring
of the code, I don't where we'd be messing this up. And unfortunately nothing
that libdrm prints will help this. I'm also unsure of 

If you can, could you patch 
drivers/gpu/drm/nouveau/nouveau_gem.c:nouveau_gem_set_domain to have a print of
all 4 inputs to domains to see why it's coming out as 0?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445026130.5252Ca61.22293--

--===============0740074643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0740074643==--
