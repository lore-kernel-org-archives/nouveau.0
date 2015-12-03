From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93004] Guild Wars 2 crash on nouveau DX11 cards
Date: Thu, 03 Dec 2015 17:57:34 +0000
Message-ID: <bug-93004-8800-GchPZ0dems@http.bugs.freedesktop.org/>
References: <bug-93004-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1224133777=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93004-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1224133777==
Content-Type: multipart/alternative; boundary="1449165454.e12d66f0.12927"; charset="UTF-8"


--1449165454.e12d66f0.12927
Date: Thu, 3 Dec 2015 17:57:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93004

--- Comment #5 from Patrick Rudolph <siro-afHDD34IFkZrovVCs/uTlw@public.gmane.org> ---
For the first crash when calling nvc0_clear(), it crashes here:
in file
nvc_context.c

in function
void nvc0_bufctx_fence(struct nvc0_context *nvc0, struct nouveau_bufctx
*bufctx, bool on_flush)

in line
403:    if (res)
404:        nvc0_resource_validate(res, (unsigned)ref->priv_data);

as the pipe_resource res is pointing to has been already freed.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1449165454.e12d66f0.12927
Date: Thu, 3 Dec 2015 17:57:34 +0000
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
   title="NEW - Guild Wars 2 crash on nouveau DX11 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93004#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Guild Wars 2 crash on nouveau DX11 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93004">bug 93004</a>
              from <span class="vcard"><a class="email" href="mailto:siro&#64;das-labor.org" title="Patrick Rudolph &lt;siro&#64;das-labor.org&gt;"> <span class="fn">Patrick Rudolph</span></a>
</span></b>
        <pre>For the first crash when calling nvc0_clear(), it crashes here:
in file
nvc_context.c

in function
void nvc0_bufctx_fence(struct nvc0_context *nvc0, struct nouveau_bufctx
*bufctx, bool on_flush)

in line
403:    if (res)
404:        nvc0_resource_validate(res, (unsigned)ref-&gt;priv_data);

as the pipe_resource res is pointing to has been already freed.</pre>
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

--1449165454.e12d66f0.12927--

--===============1224133777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1224133777==--
