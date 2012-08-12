From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 53402] New: nouveau_bo.c:463:3: error: implicit
 declaration of function 'ttm_agp_tt_create'
Date: Sun, 12 Aug 2012 11:08:50 +0000
Message-ID: <bug-53402-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

https://bugs.freedesktop.org/show_bug.cgi?id=53402

             Bug #: 53402
           Summary: nouveau_bo.c:463:3: error: implicit declaration of
                    function 'ttm_agp_tt_create'
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hello nouveau developers and community,
I'm having issue's compiling latest HEAD (as of right now): 088fba1c7c7

CC drivers/gpu/drm/nouveau/nouveau_bo.o
drivers/gpu/drm/nouveau/nouveau_bo.c: In function 'nouveau_ttm_tt_create':
drivers/gpu/drm/nouveau/nouveau_bo.c:463:3: error: implicit declaration of
function 'ttm_agp_tt_create'
drivers/gpu/drm/nouveau/nouveau_bo.c:463:3: attention: return makes pointer
from integer without a cast

$ cat .config | grep NOUVEAU
CONFIG_DRM_NOUVEAU=y
CONFIG_NOUVEAU_DEBUG=5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3
CONFIG_DRM_NOUVEAU_BACKLIGHT=y
I have posted my full .config @ http://pastebin.com/YuHnMnH4

Reverting commit d5ef81 (drm/nouveau: port remainder of drm code, and rip out
compat layer) makes compilation go past this point. However, it crashes later
because other bits and pieces rely on this specific commit.

Using Gentoo Hardened with GCC:

gebruiker@Charlie ~ $ gcc -v 
Builtin specs are being used.
COLLECT_GCC=/usr/x86_64-pc-linux-gnu/gcc-bin/4.5.3/gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-pc-linux-gnu/4.5.3/lto-wrapper
Target: x86_64-pc-linux-gnu
Configured with:
/var/tmp/portage/sys-devel/gcc-4.5.3-r2/work/gcc-4.5.3/configure --prefix=/usr
--bindir=/usr/x86_64-pc-linux-gnu/gcc-bin/4.5.3
--includedir=/usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include
--datadir=/usr/share/gcc-data/x86_64-pc-linux-gnu/4.5.3
--mandir=/usr/share/gcc-data/x86_64-pc-linux-gnu/4.5.3/man
--infodir=/usr/share/gcc-data/x86_64-pc-linux-gnu/4.5.3/info
--with-gxx-include-dir=/usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include/g++-v4
--host=x86_64-pc-linux-gnu --build=x86_64-pc-linux-gnu --disable-altivec
--disable-fixed-point --with-ppl --with-cloog --disable-ppl-version-check
--with-cloog-include=/usr/include/cloog-ppl --disable-lto --enable-nls
--without-included-gettext --with-system-zlib --disable-werror
--enable-secureplt --enable-multilib --enable-libmudflap --disable-libssp
--enable-esp --disable-libgomp
--with-python-dir=/share/gcc-data/x86_64-pc-linux-gnu/4.5.3/python
--enable-checking=release --disable-libgcj --enable-languages=c,c++
--enable-shared --enable-threads=posix --enable-__cxa_atexit
--enable-clocale=gnu --enable-targets=all --with-bugurl=http://bugs.gentoo.org/
--with-pkgversion='Gentoo Hardened 4.5.3-r2 p1.1, pie-0.4.7'
Thread model: posix
gcc version 4.5.3 (Gentoo Hardened 4.5.3-r2 p1.1, pie-0.4.7)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
