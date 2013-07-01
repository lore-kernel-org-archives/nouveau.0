From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 65310] [regression] failure in building nvc0_vbo.lo:
 /tmp/cclDjdRp.s:1270: Error: missing or invalid displacement expression
 `-8589934576
Date: Mon, 01 Jul 2013 18:10:03 +0000
Message-ID: <bug-65310-8800-jsaMTQyvrw@http.bugs.freedesktop.org/>
References: <bug-65310-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0609416124=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-65310-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0609416124==
Content-Type: multipart/alternative; boundary="1372702203.ceb2a7ec1.29692"; charset="us-ascii"


--1372702203.ceb2a7ec1.29692
Date: Mon, 1 Jul 2013 18:10:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=65310

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Cannot seem to reproduce

$ export CFLAGS="-march=native -msse2 -mfpmath=sse -O3 -ffast-math
-funroll-loops -fomit-frame-pointer -floop-interchange -floop-strip-mine
-floop-block"
export CXXFLAGS="$CFLAGS"

# Build mesa with Gallium3D hardware drivers
$ ./autogen.sh --prefix=/usr --with-dri-drivers= --with-state-trackers=dri
--disable-egl --with-gallium-drivers=nouveau --disable-gallium-llvm

Note added "--with-dri-drivers=" to prevent compilation of intel dri module

Can you ensure
* you are using ./autogen.sh ... rather than ./configure
* the source folder is clean - git clean -fxd

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372702203.ceb2a7ec1.29692
Date: Mon, 1 Jul 2013 18:10:03 +0000
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
   title="NEW --- - [regression] failure in building nvc0_vbo.lo: /tmp/cclDjdRp.s:1270: Error: missing or invalid displacement expression `-8589934576"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65310#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression] failure in building nvc0_vbo.lo: /tmp/cclDjdRp.s:1270: Error: missing or invalid displacement expression `-8589934576"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65310">bug 65310</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Cannot seem to reproduce

$ export CFLAGS=&quot;-march=native -msse2 -mfpmath=sse -O3 -ffast-math
-funroll-loops -fomit-frame-pointer -floop-interchange -floop-strip-mine
-floop-block&quot;
export CXXFLAGS=&quot;$CFLAGS&quot;

# Build mesa with Gallium3D hardware drivers
$ ./autogen.sh --prefix=/usr --with-dri-drivers= --with-state-trackers=dri
--disable-egl --with-gallium-drivers=nouveau --disable-gallium-llvm

Note added &quot;--with-dri-drivers=&quot; to prevent compilation of intel dri module

Can you ensure
* you are using ./autogen.sh ... rather than ./configure
* the source folder is clean - git clean -fxd</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372702203.ceb2a7ec1.29692--

--===============0609416124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0609416124==--
