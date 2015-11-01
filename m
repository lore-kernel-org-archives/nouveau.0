From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref when running the
 android emulator (qemu) on nv50
Date: Sun, 01 Nov 2015 07:32:12 +0000
Message-ID: <bug-92438-8800-gJunpX9lYw@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1181055803=="
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


--===============1181055803==
Content-Type: multipart/alternative; boundary="1446363132.Dada32541.4818"; charset="UTF-8"


--1446363132.Dada32541.4818
Date: Sun, 1 Nov 2015 07:32:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

--- Comment #26 from Jim Blandy <jimb-bqtBzms/kfRWk0Htik3J/w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #24)
> Hmmm... looks like rust isn't quite ready for prime-time -- there is no
> 'cargo' gentoo ebuild. (Apparently cargo can't be built hermetically?) So I
> can't repro.

You really should try the tarballs on rust-lang.org. It's not as nice as a
package, but it's straightforward enough for a one-shot activity like this.

(In reply to Ilia Mirkin from comment #25)
> I believe this is now possible with ARB_direct_state_access. While I add
> support for this and add some asserts so that this doesn't happen in the
> future, would either of you mind retesting with
> 
> MESA_EXTENSION_OVERRIDE=-GL_ARB_direct_state_access
> 
> which should prevent those endpoints from appearing? I somewhat doubt that
> this is the b2g issue though, that seems to be using GLES2 which doesn't
> have anything like this.

Thanks for looking into this! I still get segfaults. The entry in
extension_table for GL_ARB_direct_state_access is:

   { "GL_ARB_draw_buffers", o(dummy_true), GL, 2002 },

so I don't think that env var setting will do anything, just stick the name in
cant_disable_extensions. I infer from the error message in
get_extension_override that it's a permanently enabled extension.

(OT: I think in many ways Rust is ready for prime time, but the project has
only begun to try to take into account distributions' needs. Check this out:
https://internals.rust-lang.org/t/perfecting-rust-packaging/2623)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1446363132.Dada32541.4818
Date: Sun, 1 Nov 2015 07:32:12 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">bug 92438</a>
              from <span class="vcard"><a class="email" href="mailto:jimb&#64;red-bean.com" title="Jim Blandy &lt;jimb&#64;red-bean.com&gt;"> <span class="fn">Jim Blandy</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=92438#c24">comment #24</a>)
<span class="quote">&gt; Hmmm... looks like rust isn't quite ready for prime-time -- there is no
&gt; 'cargo' gentoo ebuild. (Apparently cargo can't be built hermetically?) So I
&gt; can't repro.</span >

You really should try the tarballs on rust-lang.org. It's not as nice as a
package, but it's straightforward enough for a one-shot activity like this.

(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=92438#c25">comment #25</a>)
<span class="quote">&gt; I believe this is now possible with ARB_direct_state_access. While I add
&gt; support for this and add some asserts so that this doesn't happen in the
&gt; future, would either of you mind retesting with
&gt; 
&gt; MESA_EXTENSION_OVERRIDE=-GL_ARB_direct_state_access
&gt; 
&gt; which should prevent those endpoints from appearing? I somewhat doubt that
&gt; this is the b2g issue though, that seems to be using GLES2 which doesn't
&gt; have anything like this.</span >

Thanks for looking into this! I still get segfaults. The entry in
extension_table for GL_ARB_direct_state_access is:

   { &quot;GL_ARB_draw_buffers&quot;, o(dummy_true), GL, 2002 },

so I don't think that env var setting will do anything, just stick the name in
cant_disable_extensions. I infer from the error message in
get_extension_override that it's a permanently enabled extension.

(OT: I think in many ways Rust is ready for prime time, but the project has
only begun to try to take into account distributions' needs. Check this out:
<a href="https://internals.rust-lang.org/t/perfecting-rust-packaging/2623">https://internals.rust-lang.org/t/perfecting-rust-packaging/2623</a>)</pre>
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

--1446363132.Dada32541.4818--

--===============1181055803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1181055803==--
