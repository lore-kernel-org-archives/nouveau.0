From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93004] Guild Wars 2 crash on nouveau DX11 cards
Date: Tue, 01 Dec 2015 08:23:04 +0000
Message-ID: <bug-93004-8800-eLb5HLnTKO@http.bugs.freedesktop.org/>
References: <bug-93004-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0313751723=="
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


--===============0313751723==
Content-Type: multipart/alternative; boundary="1448958184.82bE0.23630"; charset="UTF-8"


--1448958184.82bE0.23630
Date: Tue, 1 Dec 2015 08:23:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93004

--- Comment #4 from Patrick Rudolph <siro-afHDD34IFkZrovVCs/uTlw@public.gmane.org> ---
For the second crash I found I simple solution:
It crashes in nvc0_vbo.c:static void nvc0_validate_vertex_buffers_shared(struct
nvc0_context *nvc0), as buf is NULL:

396:    buf = nv04_resource(vb->buffer);
397:    offset = vb->buffer_offset;
398:    limit = buf->base.width0 - 1;

I'm not sure why it is possible to get to this point with a NULL vertex buffer
and a NULL user_buffer. Nine seems to take care and only sets non NULL buffers.
For some reason nvc0->num_vtxbufs always includes an additional NULL vb...

I fixed this problem by adding:

396:    buf = nv04_resource(vb->buffer);
        if (!buf) continue;
397:    offset = vb->buffer_offset;
398:    limit = buf->base.width0 - 1;

With this fixed Guild Wars 2 doesn't crash in every pipe->draw_vbo.
I was able to play the game for a few minutes.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1448958184.82bE0.23630
Date: Tue, 1 Dec 2015 08:23:04 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93004#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Guild Wars 2 crash on nouveau DX11 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93004">bug 93004</a>
              from <span class="vcard"><a class="email" href="mailto:siro&#64;das-labor.org" title="Patrick Rudolph &lt;siro&#64;das-labor.org&gt;"> <span class="fn">Patrick Rudolph</span></a>
</span></b>
        <pre>For the second crash I found I simple solution:
It crashes in nvc0_vbo.c:static void nvc0_validate_vertex_buffers_shared(struct
nvc0_context *nvc0), as buf is NULL:

396:    buf = nv04_resource(vb-&gt;buffer);
397:    offset = vb-&gt;buffer_offset;
398:    limit = buf-&gt;base.width0 - 1;

I'm not sure why it is possible to get to this point with a NULL vertex buffer
and a NULL user_buffer. Nine seems to take care and only sets non NULL buffers.
For some reason nvc0-&gt;num_vtxbufs always includes an additional NULL vb...

I fixed this problem by adding:

396:    buf = nv04_resource(vb-&gt;buffer);
        if (!buf) continue;
397:    offset = vb-&gt;buffer_offset;
398:    limit = buf-&gt;base.width0 - 1;

With this fixed Guild Wars 2 doesn't crash in every pipe-&gt;draw_vbo.
I was able to play the game for a few minutes.</pre>
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

--1448958184.82bE0.23630--

--===============0313751723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0313751723==--
