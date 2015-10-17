From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92504] [NVA5] Corruption in Plasma 5 on resume after
 changing screen configuration
Date: Sat, 17 Oct 2015 17:32:35 +0000
Message-ID: <bug-92504-8800-kimfvTpyvs@http.bugs.freedesktop.org/>
References: <bug-92504-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1941055796=="
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


--===============1941055796==
Content-Type: multipart/alternative; boundary="1445103155.5b50071.29841"; charset="UTF-8"


--1445103155.5b50071.29841
Date: Sat, 17 Oct 2015 17:32:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92504

--- Comment #11 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Alexander Schlarb from comment #9)
> I now have also noted that the first "fail set_domain" messages already
> appear during the first suspend (including the plasmashell nouveau dump and
> even some of the corruption). How could I have not noticed this? :-/
> 
> Anyway, here we go:
> 
> I patched Linux 4.3.0-rc5-next-20151016+ (cd685d8558) with these lines:
> 
>     diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>     index 2c99815..caff0e0 100644
>     --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>     +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>     @@ -291,7 +291,10 @@ nouveau_gem_set_domain(struct drm_gem_object *gem,
> uint32_t read_domains,
>             uint32_t domains = valid_domains & nvbo->valid_domains &
>                     (write_domains ? write_domains : read_domains);
>             uint32_t pref_flags = 0, valid_flags = 0;
>     -
>     +       printk("nouveau_gem_set_domain - drm_gem_object: 0x%08p\n", gem);
>     +       printk("nouveau_gem_set_domain - read_domains:   0x%08x\n",
> read_domains);
>     +       printk("nouveau_gem_set_domain - write_domains:  0x%08x\n",
> write_domains);                                                             
> 
>     +       printk("nouveau_gem_set_domain - valid_domains:  0x%08x\n",
> valid_domains);                                                             
> 
>             if (!domains)                                                   
> 
>                     return -EINVAL;

I should have been more explicit. You need to move that into if (!domains), and
also print nvbo->valid_domains. So e.g.

if (!domains) {
  printk("bo valid domains: %x\n", nvbo->valid_domains);
  printk("valid domains: %x\n", valid_domains);
  printk("read domains: %x\n", read_domains);
  printk("write domains: %x\n", write_domains);
  return -EINVAL;
}

This should provide with the relevant info for the failing gem object.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445103155.5b50071.29841
Date: Sat, 17 Oct 2015 17:32:35 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92504#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA5] Corruption in Plasma 5 on resume after changing screen configuration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92504">bug 92504</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Alexander Schlarb from <a href="show_bug.cgi?id=92504#c9">comment #9</a>)
<span class="quote">&gt; I now have also noted that the first &quot;fail set_domain&quot; messages already
&gt; appear during the first suspend (including the plasmashell nouveau dump and
&gt; even some of the corruption). How could I have not noticed this? :-/
&gt; 
&gt; Anyway, here we go:
&gt; 
&gt; I patched Linux 4.3.0-rc5-next-20151016+ (cd685d8558) with these lines:
&gt; 
&gt;     diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
&gt; b/drivers/gpu/drm/nouveau/nouveau_gem.c
&gt;     index 2c99815..caff0e0 100644
&gt;     --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
&gt;     +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
&gt;     &#64;&#64; -291,7 +291,10 &#64;&#64; nouveau_gem_set_domain(struct drm_gem_object *gem,
&gt; uint32_t read_domains,
&gt;             uint32_t domains = valid_domains &amp; nvbo-&gt;valid_domains &amp;
&gt;                     (write_domains ? write_domains : read_domains);
&gt;             uint32_t pref_flags = 0, valid_flags = 0;
&gt;     -
&gt;     +       printk(&quot;nouveau_gem_set_domain - drm_gem_object: 0x%08p\n&quot;, gem);
&gt;     +       printk(&quot;nouveau_gem_set_domain - read_domains:   0x%08x\n&quot;,
&gt; read_domains);
&gt;     +       printk(&quot;nouveau_gem_set_domain - write_domains:  0x%08x\n&quot;,
&gt; write_domains);                                                             
&gt; 
&gt;     +       printk(&quot;nouveau_gem_set_domain - valid_domains:  0x%08x\n&quot;,
&gt; valid_domains);                                                             
&gt; 
&gt;             if (!domains)                                                   
&gt; 
&gt;                     return -EINVAL;</span >

I should have been more explicit. You need to move that into if (!domains), and
also print nvbo-&gt;valid_domains. So e.g.

if (!domains) {
  printk(&quot;bo valid domains: %x\n&quot;, nvbo-&gt;valid_domains);
  printk(&quot;valid domains: %x\n&quot;, valid_domains);
  printk(&quot;read domains: %x\n&quot;, read_domains);
  printk(&quot;write domains: %x\n&quot;, write_domains);
  return -EINVAL;
}

This should provide with the relevant info for the failing gem object.</pre>
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

--1445103155.5b50071.29841--

--===============1941055796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1941055796==--
