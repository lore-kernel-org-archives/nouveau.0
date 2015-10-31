From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref when running the
 android emulator (qemu) on nv50
Date: Sat, 31 Oct 2015 17:18:01 +0000
Message-ID: <bug-92438-8800-Ys0sE4ZH0Q@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1303598064=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1303598064==
Content-Type: multipart/alternative; boundary="1446311881.ddD31.23545"; charset="UTF-8"


--1446311881.ddD31.23545
Date: Sat, 31 Oct 2015 17:18:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

--- Comment #23 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Jim Blandy from comment #21)
> I have no idea what this code is supposed to be doing, but here's what I can
> infer:
> 
> The call to pushbuf_kref crashes because the `struct nouveau_bo *bo`
> argument is NULL, and cli_push_get tries to use it. The caller of
> pushbuf_kref, pushbuf_validate, is iterating over a list of brefs; the
> current bref's bo field is NULL.
> 
> This bref was created by nouveau_bufctx_refn, which was passed a NULL `bo`
> argument. Its caller is nvc0_add_resident, which was passed a `struct
> nv04_resource *` whose `bo` field is NULL.
> 
> This nv04_resource was created by a call to nouveau_buffer_create in which
> buffer->domain is never set to anything other than 0. Looking at
> nouveau_buffer_allocate, it seems like a domain of zero is a legitimate
> value; the last branch of the if-else chain asserts that this is the case.
> Since that path doesn't set buf->bo, it seems it's legitimate for buf->bo to
> be NULL.
> 
> pushbuf_kref seems adamant that bo should be non-NULL; both cli_push_get and
> cli_kref_get require it. At this point I'm lost: should nouveau_bufctx_refn
> never be passed a NULL bo? Should such a bufref never make it onto the list
> that pushbuf_validate sees? I'm not sure.
> 
> Here's the stack trace at the call to nouveau_bufctx_refn:
> 
> #0  nouveau_bufctx_refn (bctx=0x555555b3eea0, bin=bin@entry=1, bo=0x0,
> flags=256) at bufctx.c:126
> #1  0x00007ffff0c33154 in nvc0_add_resident (flags=256, res=0x555555bf4800,
> bin=1, bufctx=<optimized out>) at nvc0/nvc0_winsys.h:29
> #2  nvc0_validate_vertex_buffers_shared (nvc0=0x555555b3cf30) at
> nvc0/nvc0_vbo.c:407

Whoa, great analysis! And makes a *ton* more sense than my thought, which was
that the GPU hung and we ran out of GEM handles making pushbufs.

So this is one of those idiotic bo-less resources. Ugh. Will check if your
repro makes it happen for me too.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1446311881.ddD31.23545
Date: Sat, 31 Oct 2015 17:18:01 +0000
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
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">bug 92438</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Jim Blandy from <a href="show_bug.cgi?id=92438#c21">comment #21</a>)
<span class="quote">&gt; I have no idea what this code is supposed to be doing, but here's what I can
&gt; infer:
&gt; 
&gt; The call to pushbuf_kref crashes because the `struct nouveau_bo *bo`
&gt; argument is NULL, and cli_push_get tries to use it. The caller of
&gt; pushbuf_kref, pushbuf_validate, is iterating over a list of brefs; the
&gt; current bref's bo field is NULL.
&gt; 
&gt; This bref was created by nouveau_bufctx_refn, which was passed a NULL `bo`
&gt; argument. Its caller is nvc0_add_resident, which was passed a `struct
&gt; nv04_resource *` whose `bo` field is NULL.
&gt; 
&gt; This nv04_resource was created by a call to nouveau_buffer_create in which
&gt; buffer-&gt;domain is never set to anything other than 0. Looking at
&gt; nouveau_buffer_allocate, it seems like a domain of zero is a legitimate
&gt; value; the last branch of the if-else chain asserts that this is the case.
&gt; Since that path doesn't set buf-&gt;bo, it seems it's legitimate for buf-&gt;bo to
&gt; be NULL.
&gt; 
&gt; pushbuf_kref seems adamant that bo should be non-NULL; both cli_push_get and
&gt; cli_kref_get require it. At this point I'm lost: should nouveau_bufctx_refn
&gt; never be passed a NULL bo? Should such a bufref never make it onto the list
&gt; that pushbuf_validate sees? I'm not sure.
&gt; 
&gt; Here's the stack trace at the call to nouveau_bufctx_refn:
&gt; 
&gt; #0  nouveau_bufctx_refn (bctx=0x555555b3eea0, bin=bin&#64;entry=1, bo=0x0,
&gt; flags=256) at bufctx.c:126
&gt; #1  0x00007ffff0c33154 in nvc0_add_resident (flags=256, res=0x555555bf4800,
&gt; bin=1, bufctx=&lt;optimized out&gt;) at nvc0/nvc0_winsys.h:29
&gt; #2  nvc0_validate_vertex_buffers_shared (nvc0=0x555555b3cf30) at
&gt; nvc0/nvc0_vbo.c:407</span >

Whoa, great analysis! And makes a *ton* more sense than my thought, which was
that the GPU hung and we ran out of GEM handles making pushbufs.

So this is one of those idiotic bo-less resources. Ugh. Will check if your
repro makes it happen for me too.</pre>
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

--1446311881.ddD31.23545--

--===============1303598064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1303598064==--
