From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92504] [NVA5] Corruption in Plasma 5 on resume after
 changing screen configuration
Date: Sat, 17 Oct 2015 14:02:20 +0000
Message-ID: <bug-92504-8800-kFavAZdd6S@http.bugs.freedesktop.org/>
References: <bug-92504-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1377994498=="
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


--===============1377994498==
Content-Type: multipart/alternative; boundary="1445090539.c245cd0.24188"; charset="UTF-8"


--1445090539.c245cd0.24188
Date: Sat, 17 Oct 2015 14:02:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92504

--- Comment #9 from Alexander Schlarb <alexander-fd-Bd8g6ntRJIRxuZdfhUSrJg@public.gmane.org> ---
I now have also noted that the first "fail set_domain" messages already appear
during the first suspend (including the plasmashell nouveau dump and even some
of the corruption). How could I have not noticed this? :-/

Anyway, here we go:

I patched Linux 4.3.0-rc5-next-20151016+ (cd685d8558) with these lines:

    diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
b/drivers/gpu/drm/nouveau/nouveau_gem.c
    index 2c99815..caff0e0 100644
    --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
    +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
    @@ -291,7 +291,10 @@ nouveau_gem_set_domain(struct drm_gem_object *gem,
uint32_t read_domains,
            uint32_t domains = valid_domains & nvbo->valid_domains &
                    (write_domains ? write_domains : read_domains);
            uint32_t pref_flags = 0, valid_flags = 0;
    -
    +       printk("nouveau_gem_set_domain - drm_gem_object: 0x%08p\n", gem);
    +       printk("nouveau_gem_set_domain - read_domains:   0x%08x\n",
read_domains);
    +       printk("nouveau_gem_set_domain - write_domains:  0x%08x\n",
write_domains);                                                                 
    +       printk("nouveau_gem_set_domain - valid_domains:  0x%08x\n",
valid_domains);                                                                 
            if (!domains)                                                       
                    return -EINVAL;

The I booted the kernel and reproduced the issue.

Some relevant lines:

Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000004                                                               
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000000                                                               
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004                                                               
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8800c5b832e8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8800c9b0cae8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8800c4990ae8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau 0000:01:00.0:
kscreenlocker_g[3146]: fail set_domain
Okt 17 15:15:07 Alexander-NB kernel: nouveau 0000:01:00.0:
kscreenlocker_g[3146]: validating bo list
Okt 17 15:15:07 Alexander-NB kernel: nouveau 0000:01:00.0:
kscreenlocker_g[3146]: validate: -22
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8800bf085ae8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000002
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000002
--
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8801a383eee8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8800c5918ee8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8800cab47ae8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau 0000:01:00.0: plasmashell[2575]:
fail set_domain
Okt 17 15:15:07 Alexander-NB kernel: nouveau 0000:01:00.0: plasmashell[2575]:
validating bo list
Okt 17 15:15:07 Alexander-NB kernel: nouveau 0000:01:00.0: plasmashell[2575]:
validate: -22
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8800ca083ae8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000002
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000002
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000002

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445090539.c245cd0.24188
Date: Sat, 17 Oct 2015 14:02:19 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92504#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA5] Corruption in Plasma 5 on resume after changing screen configuration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92504">bug 92504</a>
              from <span class="vcard"><a class="email" href="mailto:alexander-fd&#64;xmine128.tk" title="Alexander Schlarb &lt;alexander-fd&#64;xmine128.tk&gt;"> <span class="fn">Alexander Schlarb</span></a>
</span></b>
        <pre>I now have also noted that the first &quot;fail set_domain&quot; messages already appear
during the first suspend (including the plasmashell nouveau dump and even some
of the corruption). How could I have not noticed this? :-/

Anyway, here we go:

I patched Linux 4.3.0-rc5-next-20151016+ (cd685d8558) with these lines:

    diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
b/drivers/gpu/drm/nouveau/nouveau_gem.c
    index 2c99815..caff0e0 100644
    --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
    +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
    &#64;&#64; -291,7 +291,10 &#64;&#64; nouveau_gem_set_domain(struct drm_gem_object *gem,
uint32_t read_domains,
            uint32_t domains = valid_domains &amp; nvbo-&gt;valid_domains &amp;
                    (write_domains ? write_domains : read_domains);
            uint32_t pref_flags = 0, valid_flags = 0;
    -
    +       printk(&quot;nouveau_gem_set_domain - drm_gem_object: 0x%08p\n&quot;, gem);
    +       printk(&quot;nouveau_gem_set_domain - read_domains:   0x%08x\n&quot;,
read_domains);
    +       printk(&quot;nouveau_gem_set_domain - write_domains:  0x%08x\n&quot;,
write_domains);                                                                 
    +       printk(&quot;nouveau_gem_set_domain - valid_domains:  0x%08x\n&quot;,
valid_domains);                                                                 
            if (!domains)                                                       
                    return -EINVAL;

The I booted the kernel and reproduced the issue.

Some relevant lines:

Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000004                                                               
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000000                                                               
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004                                                               
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8800c5b832e8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8800c9b0cae8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8800c4990ae8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau 0000:01:00.0:
kscreenlocker_g[3146]: fail set_domain
Okt 17 15:15:07 Alexander-NB kernel: nouveau 0000:01:00.0:
kscreenlocker_g[3146]: validating bo list
Okt 17 15:15:07 Alexander-NB kernel: nouveau 0000:01:00.0:
kscreenlocker_g[3146]: validate: -22
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8800bf085ae8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000002
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000002
--
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8801a383eee8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8800c5918ee8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8800cab47ae8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000000
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000004
Okt 17 15:15:07 Alexander-NB kernel: nouveau 0000:01:00.0: plasmashell[2575]:
fail set_domain
Okt 17 15:15:07 Alexander-NB kernel: nouveau 0000:01:00.0: plasmashell[2575]:
validating bo list
Okt 17 15:15:07 Alexander-NB kernel: nouveau 0000:01:00.0: plasmashell[2575]:
validate: -22
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - drm_gem_object:
0xffff8800ca083ae8
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - read_domains:  
0x00000002
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - write_domains: 
0x00000002
Okt 17 15:15:07 Alexander-NB kernel: nouveau_gem_set_domain - valid_domains: 
0x00000002</pre>
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

--1445090539.c245cd0.24188--

--===============1377994498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1377994498==--
