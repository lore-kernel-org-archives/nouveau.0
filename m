From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91738] [NV117] NULL deref in
 nvkm_i2c_try_acquire_pad, kernel 4.1
Date: Mon, 28 Sep 2015 02:26:17 +0000
Message-ID: <bug-91738-8800-xjMN0A8M3n@http.bugs.freedesktop.org/>
References: <bug-91738-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0327991335=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91738-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0327991335==
Content-Type: multipart/alternative; boundary="1443407177.47D51.6160"; charset="UTF-8"


--1443407177.47D51.6160
Date: Mon, 28 Sep 2015 02:26:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91738

--- Comment #20 from ryanpcmcquen <ryan.q-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org> ---
Linux 4.3-rc3 will not compile either, here is the error:

  GEN     arch/x86/lib/inat-tables.c
  CC      arch/x86/lib/inat.o
  CC      arch/x86/lib/insn.o
  AS      arch/x86/lib/memcpy_64.o
  AS      arch/x86/lib/memmove_64.o
  AS      arch/x86/lib/memset_64.o
  CC      arch/x86/lib/misc.o
  AS      arch/x86/lib/putuser.o
  AS      arch/x86/lib/rwsem.o
  CC      arch/x86/lib/usercopy.o
  CC      arch/x86/lib/usercopy_64.o
  AR      arch/x86/lib/lib.a
  LINK    vmlinux
  LD      vmlinux.o
  MODPOST vmlinux.o
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  LD      init/built-in.o
arch/x86/built-in.o: In function `hv_machine_crash_shutdown':
mshyperv.c:(.text+0x31dcf): undefined reference to
`native_machine_crash_shutdown'
make: *** [vmlinux] Error 1

http://sprunge.us/dPJQ

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1443407177.47D51.6160
Date: Mon, 28 Sep 2015 02:26:17 +0000
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
          bz_status_UNCONFIRMED "
   title="UNCONFIRMED - [NV117] NULL deref in nvkm_i2c_try_acquire_pad, kernel 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_UNCONFIRMED "
   title="UNCONFIRMED - [NV117] NULL deref in nvkm_i2c_try_acquire_pad, kernel 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738">bug 91738</a>
              from <span class="vcard"><a class="email" href="mailto:ryan.q&#64;linux.com" title="ryanpcmcquen &lt;ryan.q&#64;linux.com&gt;"> <span class="fn">ryanpcmcquen</span></a>
</span></b>
        <pre>Linux 4.3-rc3 will not compile either, here is the error:

  GEN     arch/x86/lib/inat-tables.c
  CC      arch/x86/lib/inat.o
  CC      arch/x86/lib/insn.o
  AS      arch/x86/lib/memcpy_64.o
  AS      arch/x86/lib/memmove_64.o
  AS      arch/x86/lib/memset_64.o
  CC      arch/x86/lib/misc.o
  AS      arch/x86/lib/putuser.o
  AS      arch/x86/lib/rwsem.o
  CC      arch/x86/lib/usercopy.o
  CC      arch/x86/lib/usercopy_64.o
  AR      arch/x86/lib/lib.a
  LINK    vmlinux
  LD      vmlinux.o
  MODPOST vmlinux.o
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  LD      init/built-in.o
arch/x86/built-in.o: In function `hv_machine_crash_shutdown':
mshyperv.c:(.text+0x31dcf): undefined reference to
`native_machine_crash_shutdown'
make: *** [vmlinux] Error 1

<a href="http://sprunge.us/dPJQ">http://sprunge.us/dPJQ</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443407177.47D51.6160--

--===============0327991335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0327991335==--
