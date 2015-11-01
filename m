From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref when running the
 android emulator (qemu) on nv50
Date: Sun, 01 Nov 2015 21:44:17 +0000
Message-ID: <bug-92438-8800-9T3Ldpm8zo@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1560981901=="
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


--===============1560981901==
Content-Type: multipart/alternative; boundary="1446414257.41401.1807"; charset="UTF-8"


--1446414257.41401.1807
Date: Sun, 1 Nov 2015 21:44:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

--- Comment #30 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Jim Blandy from comment #29)
> (In reply to Ilia Mirkin from comment #27)
> > Created attachment 119323 [details]
> > deal with bind == 0
> > 
> > Oh blast, you're right. Can't disable GL_ARB_direct_state_access, since it's
> > o(dummy_true). Try this mesa patch, which should fix it (but might break
> > things on nv30... need to figure that out).
> 
> Okay, cool. Building Mesa from source isn't something I can dive into right
> now, but I'm hoping I'll have more time for this project in the near future.
> (I tried just whacking the domain value into *buffer with GDB and seeing if
> the code could proceed, but optimized code foiled me.)

You can change your application to pretend that GL_ARB_direct_state_access
isn't enabled, which should prevent it from using glCreateBuffers() and the
glNamedBuffer* calls.

Should be easy enough to modify src/context/extensions.rs by e.g. introducing a
typo into the GL_ARB_direct_state_access string. Or doing a fixup
after-the-fact.

[As an aside, in src/buffer/alloc.rs, you appear to have at least one instance
that only checks for GL4.5 and not the ext as well... oops? I'd personally
recommend never checking for explicit GL versions and only looking at the exts.
You can also set the ext bools based on the GL versions.

    if ctxt.version >= &Version(Api::Gl, 4, 5) {
        ctxt.gl.NamedBufferSubData(self.id, offset_bytes as ...

]

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1446414257.41401.1807
Date: Sun, 1 Nov 2015 21:44:17 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438#c30">Comment # 30</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">bug 92438</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Jim Blandy from <a href="show_bug.cgi?id=92438#c29">comment #29</a>)
<span class="quote">&gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=92438#c27">comment #27</a>)
&gt; &gt; Created <span class=""><a href="attachment.cgi?id=119323" name="attach_119323" title="deal with bind == 0">attachment 119323</a> <a href="attachment.cgi?id=119323&amp;action=edit" title="deal with bind == 0">[details]</a></span>
&gt; &gt; deal with bind == 0
&gt; &gt; 
&gt; &gt; Oh blast, you're right. Can't disable GL_ARB_direct_state_access, since it's
&gt; &gt; o(dummy_true). Try this mesa patch, which should fix it (but might break
&gt; &gt; things on nv30... need to figure that out).
&gt; 
&gt; Okay, cool. Building Mesa from source isn't something I can dive into right
&gt; now, but I'm hoping I'll have more time for this project in the near future.
&gt; (I tried just whacking the domain value into *buffer with GDB and seeing if
&gt; the code could proceed, but optimized code foiled me.)</span >

You can change your application to pretend that GL_ARB_direct_state_access
isn't enabled, which should prevent it from using glCreateBuffers() and the
glNamedBuffer* calls.

Should be easy enough to modify src/context/extensions.rs by e.g. introducing a
typo into the GL_ARB_direct_state_access string. Or doing a fixup
after-the-fact.

[As an aside, in src/buffer/alloc.rs, you appear to have at least one instance
that only checks for GL4.5 and not the ext as well... oops? I'd personally
recommend never checking for explicit GL versions and only looking at the exts.
You can also set the ext bools based on the GL versions.

    if ctxt.version &gt;= &amp;Version(Api::Gl, 4, 5) {
        ctxt.gl.NamedBufferSubData(self.id, offset_bytes as ...

]</pre>
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

--1446414257.41401.1807--

--===============1560981901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1560981901==--
