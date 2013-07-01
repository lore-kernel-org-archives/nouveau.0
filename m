From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 65310] [regression] failure in building nvc0_vbo.lo:
 /tmp/cclDjdRp.s:1270: Error: missing or invalid displacement expression
 `-8589934576
Date: Mon, 01 Jul 2013 18:13:03 +0000
Message-ID: <bug-65310-8800-2MrZrUa7a1@http.bugs.freedesktop.org/>
References: <bug-65310-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1488054295=="
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


--===============1488054295==
Content-Type: multipart/alternative; boundary="1372702383.5C6068C1.30089"; charset="us-ascii"


--1372702383.5C6068C1.30089
Date: Mon, 1 Jul 2013 18:13:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=65310

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #5 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Using gcc 4.8.1

$ gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.1/lto-wrapper
Target: x86_64-unknown-linux-gnu
Configured with: /build/gcc-multilib/src/gcc-4.8.1/configure --prefix=/usr
--libdir=/usr/lib --libexecdir=/usr/lib --mandir=/usr/share/man
--infodir=/usr/share/info --with-bugurl=https://bugs.archlinux.org/
--enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++ --enable-shared
--enable-threads=posix --with-system-zlib --enable-__cxa_atexit
--disable-libunwind-exceptions --enable-clocale=gnu --disable-libstdcxx-pch
--enable-gnu-unique-object --enable-linker-build-id --enable-cloog-backend=isl
--disable-cloog-version-check --enable-lto --enable-gold --enable-ld=default
--enable-plugin --with-plugin-ld=ld.gold --with-linker-hash-style=gnu
--disable-install-libiberty --enable-multilib --disable-libssp --disable-werror
--enable-checking=release
Thread model: posix
gcc version 4.8.1 (GCC) 

Are you using ccache or distcc ?
Ideally attach/link your SlackBuild

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372702383.5C6068C1.30089
Date: Mon, 1 Jul 2013 18:13:03 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [regression] failure in building nvc0_vbo.lo: /tmp/cclDjdRp.s:1270: Error: missing or invalid displacement expression `-8589934576"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65310">bug 65310</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>NEEDINFO
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [regression] failure in building nvc0_vbo.lo: /tmp/cclDjdRp.s:1270: Error: missing or invalid displacement expression `-8589934576"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65310#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [regression] failure in building nvc0_vbo.lo: /tmp/cclDjdRp.s:1270: Error: missing or invalid displacement expression `-8589934576"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65310">bug 65310</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Using gcc 4.8.1

$ gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.1/lto-wrapper
Target: x86_64-unknown-linux-gnu
Configured with: /build/gcc-multilib/src/gcc-4.8.1/configure --prefix=/usr
--libdir=/usr/lib --libexecdir=/usr/lib --mandir=/usr/share/man
--infodir=/usr/share/info --with-bugurl=<a href="https://bugs.archlinux.org/">https://bugs.archlinux.org/</a>
--enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++ --enable-shared
--enable-threads=posix --with-system-zlib --enable-__cxa_atexit
--disable-libunwind-exceptions --enable-clocale=gnu --disable-libstdcxx-pch
--enable-gnu-unique-object --enable-linker-build-id --enable-cloog-backend=isl
--disable-cloog-version-check --enable-lto --enable-gold --enable-ld=default
--enable-plugin --with-plugin-ld=ld.gold --with-linker-hash-style=gnu
--disable-install-libiberty --enable-multilib --disable-libssp --disable-werror
--enable-checking=release
Thread model: posix
gcc version 4.8.1 (GCC) 

Are you using ccache or distcc ?
Ideally attach/link your SlackBuild</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372702383.5C6068C1.30089--

--===============1488054295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1488054295==--
