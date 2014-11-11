From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Tue, 11 Nov 2014 18:27:36 +0000
Message-ID: <bug-54700-8800-3rywmRykyZ@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0381322751=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0381322751==
Content-Type: multipart/alternative; boundary="1415730456.0ad8Da3.2209"; charset="UTF-8"


--1415730456.0ad8Da3.2209
Date: Tue, 11 Nov 2014 18:27:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #69 from r.ductor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Hi, I do not know if it may be still relevant after nv28m dicoveries but here's
some quick info (with a debian testing fully updated a month ago).

Booting with plain nouveau (agp v2 4x): distorted mouse, nothing new here :(

I tried to boot the following kernel command lines:

* nouveau.vram_pushbuf=1 TTY and X screwed up.

* nouveau.agpmode=2 -->distorted mouse

* nouveau.agpmode=1 mouse OK, NO apparent problems. Then I tried then a
glxgears that gave a GPU lockup, alas.

* nouveau.agpmode=0 mouse OK, NO apparent problems (yet).

cheers
ric

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1415730456.0ad8Da3.2209
Date: Tue, 11 Nov 2014 18:27:36 +0000
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
   title="NEW - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c69">Comment # 69</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:r.ductor&#64;gmail.com" title="r.ductor&#64;gmail.com">r.ductor&#64;gmail.com</a>
</span></b>
        <pre>Hi, I do not know if it may be still relevant after nv28m dicoveries but here's
some quick info (with a debian testing fully updated a month ago).

Booting with plain nouveau (agp v2 4x): distorted mouse, nothing new here :(

I tried to boot the following kernel command lines:

* nouveau.vram_pushbuf=1 TTY and X screwed up.

* nouveau.agpmode=2 --&gt;distorted mouse

* nouveau.agpmode=1 mouse OK, NO apparent problems. Then I tried then a
glxgears that gave a GPU lockup, alas.

* nouveau.agpmode=0 mouse OK, NO apparent problems (yet).

cheers
ric</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1415730456.0ad8Da3.2209--

--===============0381322751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0381322751==--
