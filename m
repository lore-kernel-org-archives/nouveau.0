From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91170] World of Zoo (in Wine) has rendering issues
Date: Fri, 03 Jul 2015 16:06:15 +0000
Message-ID: <bug-91170-8800-zKByi9h15X@http.bugs.freedesktop.org/>
References: <bug-91170-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1659254158=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91170-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1659254158==
Content-Type: multipart/alternative; boundary="1435939575.D7Bd1.2758"; charset="UTF-8"


--1435939575.D7Bd1.2758
Date: Fri, 3 Jul 2015 16:06:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91170

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 116925
  --> https://bugs.freedesktop.org/attachment.cgi?id=116925&action=edit
another bs fix

This is very worrying... emitting more fences seems to fix it. Another place
where it helped was in nouveau_transfer_write. The joke of it is that emitting
a fence doesn't even kick the pushbuf, just writes the commands.

But since I'm not actually changing *which* fences are attached, I really don't
see how this changes anything. Waiting on fence instead of fence_wr doesn't
seem to affect it either.

What this game does is totally NUTS btw. It has a 512KB vertex buffer, and
every time it maps it is with GL_MAP_INVALIDATE_BUFFER_BIT and writes all 512KB
each time. Which is fine, just... inefficient (probably).

It also has a 128KB index buffer, of which it maps the whole range with 
GL_MAP_READ_BIT | GL_MAP_WRITE_BIT | GL_MAP_FLUSH_EXPLICIT_BIT. And then draws,
immediately maps it again, draws, etc. This is like the definition of how not
to use these buffers. Anyways, this forces the creation of a staging bo (in
GART), which receives a copy of the old 128KB of data, and returns a pointer to
that. Then the program updates the 12 or whatever bytes of data, and flushes
them, so *just* those 12 bytes get written. [I'm not kidding, it literally
updates 12 bytes a lot of the time.]

I tried adding kicks in copy_data & co, but that (expectedly) didn't help.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1435939575.D7Bd1.2758
Date: Fri, 3 Jul 2015 16:06:15 +0000
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
   title="NEW - World of Zoo (in Wine) has rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91170#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - World of Zoo (in Wine) has rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91170">bug 91170</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=116925" name="attach_116925" title="another bs fix">attachment 116925</a> <a href="attachment.cgi?id=116925&amp;action=edit" title="another bs fix">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=91170&amp;attachment=116925'>[review]</a>
another bs fix

This is very worrying... emitting more fences seems to fix it. Another place
where it helped was in nouveau_transfer_write. The joke of it is that emitting
a fence doesn't even kick the pushbuf, just writes the commands.

But since I'm not actually changing *which* fences are attached, I really don't
see how this changes anything. Waiting on fence instead of fence_wr doesn't
seem to affect it either.

What this game does is totally NUTS btw. It has a 512KB vertex buffer, and
every time it maps it is with GL_MAP_INVALIDATE_BUFFER_BIT and writes all 512KB
each time. Which is fine, just... inefficient (probably).

It also has a 128KB index buffer, of which it maps the whole range with 
GL_MAP_READ_BIT | GL_MAP_WRITE_BIT | GL_MAP_FLUSH_EXPLICIT_BIT. And then draws,
immediately maps it again, draws, etc. This is like the definition of how not
to use these buffers. Anyways, this forces the creation of a staging bo (in
GART), which receives a copy of the old 128KB of data, and returns a pointer to
that. Then the program updates the 12 or whatever bytes of data, and flushes
them, so *just* those 12 bytes get written. [I'm not kidding, it literally
updates 12 bytes a lot of the time.]

I tried adding kicks in copy_data &amp; co, but that (expectedly) didn't help.</pre>
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

--1435939575.D7Bd1.2758--

--===============1659254158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1659254158==--
