From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74648] New: Ultima IX (wine) movie playback crashes
	game
Date: Fri, 07 Feb 2014 06:10:57 +0000
Message-ID: <bug-74648-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0970561454=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0970561454==
Content-Type: multipart/alternative; boundary="1391753458.baBd712.8077"; charset="us-ascii"


--1391753458.baBd712.8077
Date: Fri, 7 Feb 2014 06:10:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74648

          Priority: medium
            Bug ID: 74648
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Ultima IX (wine) movie playback crashes game
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: christopher-XP3JB3hj9piIwRZHo2/mJg@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

I have a game (Ultima IX) which crashes during movie playback in Wine. It's
very likely Wine is passing some incorrect parameters around but the crash is
ultimately in the Nouveau driver.

This is a Dell Latitude D630 using, I believe, the NV86 chipset. I am running
Fedora 20 with the latest updates as of February 6, 2014 which includes
xorg-x11-server version 1.14.4 and Nouveau 1.0.9.

The game also crashes when you quit and the backtrace looks similar: something
happens in Nouveau concerning malloc and gsignal and a crash occurs.

Note the application crashes, does not restore the proper screen resolution,
but the Xorg server runs fine and I can merely open terminal and use "xrandr
--size 1280x800" to fix my resolution.

Here is the backtrace:
Unhandled exception: assertion failed in 32-bit code (0xf773b430).
Register dump:
 CS:0023 SS:002b DS:002b ES:002b FS:0063 GS:006b
 EIP:f773b430 ESP:0032e334 EBP:0032e5f8 EFLAGS:00000296(   - --  I S -A-P- )
 EAX:00000000 EBX:000018fe ECX:000018fe EDX:00000006
 ESI:00000046 EDI:f7523000
Stack dump:
0x0032e334:  0032e5f8 00000006 000018fe f7397b96
0x0032e344:  f7523000 0032e3e4 f73993d3 00000006
0x0032e354:  0032e364 00000000 61333062 61383464
0x0032e364:  00000020 00000000 00000000 00000000
0x0032e374:  00000000 00000000 00000000 00000000
0x0032e384:  00000000 00000000 00000000 00000000
Backtrace:
=>0 0xf773b430 __kernel_vsyscall+0x10() in [vdso].so (0x0032e5f8)
  1 0xf7397b96 gsignal+0x45() in libc.so.6 (0x0032e5f8)
  2 0xf73993d3 abort+0x142() in libc.so.6 (0x0032e5f8)
  3 0xf73d72f8 __libc_message+0x297() in libc.so.6 (0x0032e5f8)
  4 0xf73ddb24 malloc_printerr+0xe3() in libc.so.6 (0x0032e624)
  5 0xf73deec0 _int_free+0x6bf() in libc.so.6 (0x7bfa6c58)
  6 0x7ca2fe69 in nouveau_dri.so (+0x1e8e68) (0x7d154698)
  7 0x7ca2fe4b in nouveau_dri.so (+0x1e8e4a) (0x7d154698)
  8 0x7c9a832b in nouveau_dri.so (+0x16132a) (0x7d154698)
  9 0x7c9b5e34 in nouveau_dri.so (+0x16ee33) (0x7d154698)
  10 0x7c99ed2e in nouveau_dri.so (+0x157d2d) (0x7d154698)
  11 0x7ca4eab9 in nouveau_dri.so (+0x207ab8) (0x7d154698)
  12 0x7c92a092 in nouveau_dri.so (+0xe3091) (0x7d154698)
  13 0x7c92a569 in nouveau_dri.so (+0xe3568) (0x7d154698)
  14 0x7c92a5b5 in nouveau_dri.so (+0xe35b4) (0x0032e838)
  15 0x7c92a2a0 in nouveau_dri.so (+0xe329f) (0x0032e838)
  16 0x7c9276ff in nouveau_dri.so (+0xe06fe) (0x0032e8b8)
  17 0x7d423e66 shared_dispatch_stub_650+0x25() in libglapi.so.0 (0x0032e8b8)
  18 0x7e7d8d0a in wined3d (+0x68d09) (0x0032e8b8)
  19 0x7e7d92a9 in wined3d (+0x692a8) (0x0032e8d8)
  20 0x7e7d93cd in wined3d (+0x693cc) (0x0032e908)
  21 0x7e7cb1d3 in wined3d (+0x5b1d2) (0x0032e938)
  22 0x7e7b2586 wined3d_device_uninit_3d+0x155() in wined3d (0x0032e988)
  23 0x7d8e9a93 in d3d9 (+0x19a92) (0x0032e9d8)
0xf773b430 __kernel_vsyscall+0x10 in [vdso].so: popl    %ebp
Modules:
Module    Address            Debug info    Name (120 modules)
PE      400000- 1338000    Deferred        u9
PE     7900000- 7b18000    Deferred        3dfxspl2
PE    10000000-16791000    Export          glide2x
ELF    7a212000-7b800000    Deferred        libllvm-3.3.so
ELF    7b800000-7ba5e000    Deferred        kernel32<elf>
  \-PE    7b810000-7ba5e000    \               kernel32
ELF    7bc00000-7bce3000    Deferred        ntdll<elf>
  \-PE    7bc10000-7bce3000    \               ntdll
ELF    7bf00000-7bf04000    Deferred        <wine-loader>
ELF    7c086000-7c09f000    Deferred        libresolv.so.2
ELF    7c09f000-7c0cc000    Deferred        libvorbis.so.0
ELF    7c0cc000-7c157000    Deferred        libvorbisenc.so.2
ELF    7c157000-7c1a1000    Deferred        libflac.so.8
ELF    7c1a1000-7c1bb000    Deferred        libnsl.so.1
ELF    7c1bb000-7c225000    Deferred        libsndfile.so.1
ELF    7c406000-7c453000    Deferred        libdbus-1.so.3
ELF    7c453000-7c4c7000    Deferred        libpulsecommon-4.0.so
ELF    7c847000-7d0a7000    Dwarf           nouveau_dri.so
ELF    7d16e000-7d174000    Deferred        libattr.so.1
ELF    7d174000-7d181000    Deferred        libgsm.so.1
ELF    7d201000-7d21e000    Deferred        libgcc_s.so.1
ELF    7d30a000-7d312000    Deferred        libdrm_nouveau.so.2
ELF    7d312000-7d319000    Deferred        libffi.so.6
ELF    7d319000-7d342000    Deferred        liblzma.so.5
ELF    7d342000-7d3ad000    Deferred        libpcre.so.1
ELF    7d3ad000-7d3d1000    Deferred        libselinux.so.1
ELF    7d3d1000-7d3df000    Deferred        libdrm.so.2
ELF    7d3df000-7d3e5000    Deferred        libxcb-dri2.so.0
ELF    7d3e5000-7d400000    Deferred        libxcb-glx.so.0
ELF    7d400000-7d403000    Deferred        libx11-xcb.so.1
ELF    7d403000-7d407000    Deferred        libxdamage.so.1
ELF    7d407000-7d445000    Dwarf           libglapi.so.0
ELF    7d445000-7d4c0000    Deferred        libgl.so.1
ELF    7d4c4000-7d4cc000    Deferred        libogg.so.0
ELF    7d4cc000-7d4d2000    Deferred        libuuid.so.1
ELF    7d4d2000-7d4db000    Deferred        librt.so.1
ELF    7d4db000-7d4e2000    Deferred        libasyncns.so.0
ELF    7d4e2000-7d4ec000    Deferred        libwrap.so.0
ELF    7d4ec000-7d4f3000    Deferred        libxtst.so.6
ELF    7d4f3000-7d50d000    Deferred        libice.so.6
ELF    7d50d000-7d55e000    Deferred        libpulse.so.0
ELF    7d57e000-7d5a6000    Deferred        winepulse<elf>
  \-PE    7d580000-7d5a6000    \               winepulse
ELF    7d5a6000-7d5c9000    Deferred        mmdevapi<elf>
  \-PE    7d5b0000-7d5c9000    \               mmdevapi
ELF    7d868000-7d86e000    Deferred        libcap.so.2
ELF    7d86e000-7d877000    Deferred        libsm.so.6
ELF    7d877000-7d882000    Deferred        libjson-c.so.2
ELF    7d8a8000-7d8cd000    Deferred        imm32<elf>
  \-PE    7d8b0000-7d8cd000    \               imm32
ELF    7d8cd000-7d90b000    Dwarf           d3d9<elf>
  \-PE    7d8d0000-7d90b000    \               d3d9
ELF    7d92f000-7d966000    Deferred        uxtheme<elf>
  \-PE    7d940000-7d966000    \               uxtheme
ELF    7d988000-7d98e000    Deferred        libxfixes.so.3
ELF    7d98e000-7d99a000    Deferred        libxcursor.so.1
ELF    7d99a000-7d9ab000    Deferred        libxi.so.6
ELF    7d9ab000-7d9b6000    Deferred        libxrender.so.1
ELF    7d9b6000-7d9bc000    Deferred        libxxf86vm.so.1
ELF    7d9bc000-7d9c0000    Deferred        libxau.so.6
ELF    7d9c0000-7d9e4000    Deferred        libxcb.so.1
ELF    7d9e4000-7db20000    Deferred        libx11.so.6
ELF    7db20000-7db33000    Deferred        libxext.so.6
ELF    7db53000-7dbe9000    Deferred        winex11<elf>
  \-PE    7db60000-7dbe9000    \               winex11
ELF    7dc11000-7dc3a000    Deferred        libexpat.so.1
ELF    7dc3a000-7dc77000    Deferred        libfontconfig.so.1
ELF    7dc77000-7dcae000    Deferred        libpng16.so.16
ELF    7dcae000-7dcc5000    Deferred        libz.so.1
ELF    7dcc5000-7dd67000    Deferred        libfreetype.so.6
ELF    7dd67000-7dd89000    Deferred        libtinfo.so.5
ELF    7dd89000-7ddb1000    Deferred        libncurses.so.5
ELF    7ddd1000-7de14000    Deferred        winspool<elf>
  \-PE    7dde0000-7de14000    \               winspool
ELF    7de14000-7e04c000    Deferred        shell32<elf>
  \-PE    7de20000-7e04c000    \               shell32
ELF    7e04c000-7e138000    Deferred        comdlg32<elf>
  \-PE    7e050000-7e138000    \               comdlg32
ELF    7e138000-7e1b4000    Deferred        shlwapi<elf>
  \-PE    7e150000-7e1b4000    \               shlwapi
ELF    7e1b4000-7e2ed000    Deferred        oleaut32<elf>
  \-PE    7e1d0000-7e2ed000    \               oleaut32
ELF    7e2ed000-7e3f8000    Deferred        comctl32<elf>
  \-PE    7e2f0000-7e3f8000    \               comctl32
ELF    7e3f8000-7e424000    Deferred        msvfw32<elf>
  \-PE    7e400000-7e424000    \               msvfw32
ELF    7e424000-7e51e000    Deferred        quartz<elf>
  \-PE    7e440000-7e51e000    \               quartz
ELF    7e51e000-7e549000    Deferred        msacm32<elf>
  \-PE    7e520000-7e549000    \               msacm32
ELF    7e549000-7e602000    Deferred        winmm<elf>
  \-PE    7e550000-7e602000    \               winmm
ELF    7e602000-7e64d000    Deferred        dsound<elf>
  \-PE    7e610000-7e64d000    \               dsound
ELF    7e64d000-7e75d000    Deferred        opengl32<elf>
  \-PE    7e670000-7e75d000    \               opengl32
ELF    7e75d000-7e89f000    Dwarf           wined3d<elf>
  \-PE    7e770000-7e89f000    \               wined3d
ELF    7e89f000-7e916000    Deferred        ddraw<elf>
  \-PE    7e8b0000-7e916000    \               ddraw
ELF    7e916000-7e99b000    Deferred        rpcrt4<elf>
  \-PE    7e920000-7e99b000    \               rpcrt4
ELF    7e99b000-7eabe000    Deferred        gdi32<elf>
  \-PE    7e9b0000-7eabe000    \               gdi32
ELF    7eabe000-7ec1d000    Deferred        user32<elf>
  \-PE    7ead0000-7ec1d000    \               user32
ELF    7ec1d000-7ec91000    Deferred        advapi32<elf>
  \-PE    7ec30000-7ec91000    \               advapi32
ELF    7ec91000-7edd3000    Deferred        ole32<elf>
  \-PE    7ecb0000-7edd3000    \               ole32
ELF    7efd3000-7efe0000    Deferred        libnss_files.so.2
ELF    7efe6000-7f000000    Deferred        version<elf>
  \-PE    7eff0000-7f000000    \               version
ELF    f731c000-f7363000    Deferred        libm.so.6
ELF    f7364000-f7369000    Deferred        libdl.so.2
ELF    f7369000-f7527000    Dwarf           libc.so.6
ELF    f7527000-f7542000    Deferred        libpthread.so.0
ELF    f7542000-f76f8000    Dwarf           libwine.so.1
ELF    f7719000-f773b000    Deferred        ld-linux.so.2
ELF    f773b000-f773c000    Dwarf           [vdso].so
Threads:
process  tid      prio (all id:s are in hex)
00000008 (D) C:\GOG Games\Ultima IX - Ascension\u9.exe
    00000027   15
    00000025   15
    00000024    0
    00000023    0
    00000009    0 <==
0000000e services.exe
    0000001e    0
    0000001d    0
    00000014    0
    00000010    0
    0000000f    0
00000012 winedevice.exe
    0000001a    0
    00000019    0
    00000017    0
    00000013    0
0000001b plugplay.exe
    00000020    0
    0000001f    0
    0000001c    0
00000021 explorer.exe
    00000022    0
System information:
    Wine build: wine-1.7.8
    Platform: i386 (WOW64)
    Host system: Linux
    Host version: 3.12.8-300.fc20.x86_64

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391753458.baBd712.8077
Date: Fri, 7 Feb 2014 06:10:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Ultima IX (wine) movie playback crashes game"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74648">74648</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Ultima IX (wine) movie playback crashes game
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>christopher&#64;thielen.co
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have a game (Ultima IX) which crashes during movie playback in Wine. It's
very likely Wine is passing some incorrect parameters around but the crash is
ultimately in the Nouveau driver.

This is a Dell Latitude D630 using, I believe, the NV86 chipset. I am running
Fedora 20 with the latest updates as of February 6, 2014 which includes
xorg-x11-server version 1.14.4 and Nouveau 1.0.9.

The game also crashes when you quit and the backtrace looks similar: something
happens in Nouveau concerning malloc and gsignal and a crash occurs.

Note the application crashes, does not restore the proper screen resolution,
but the Xorg server runs fine and I can merely open terminal and use &quot;xrandr
--size 1280x800&quot; to fix my resolution.

Here is the backtrace:
Unhandled exception: assertion failed in 32-bit code (0xf773b430).
Register dump:
 CS:0023 SS:002b DS:002b ES:002b FS:0063 GS:006b
 EIP:f773b430 ESP:0032e334 EBP:0032e5f8 EFLAGS:00000296(   - --  I S -A-P- )
 EAX:00000000 EBX:000018fe ECX:000018fe EDX:00000006
 ESI:00000046 EDI:f7523000
Stack dump:
0x0032e334:  0032e5f8 00000006 000018fe f7397b96
0x0032e344:  f7523000 0032e3e4 f73993d3 00000006
0x0032e354:  0032e364 00000000 61333062 61383464
0x0032e364:  00000020 00000000 00000000 00000000
0x0032e374:  00000000 00000000 00000000 00000000
0x0032e384:  00000000 00000000 00000000 00000000
Backtrace:
=&gt;0 0xf773b430 __kernel_vsyscall+0x10() in [vdso].so (0x0032e5f8)
  1 0xf7397b96 gsignal+0x45() in libc.so.6 (0x0032e5f8)
  2 0xf73993d3 abort+0x142() in libc.so.6 (0x0032e5f8)
  3 0xf73d72f8 __libc_message+0x297() in libc.so.6 (0x0032e5f8)
  4 0xf73ddb24 malloc_printerr+0xe3() in libc.so.6 (0x0032e624)
  5 0xf73deec0 _int_free+0x6bf() in libc.so.6 (0x7bfa6c58)
  6 0x7ca2fe69 in nouveau_dri.so (+0x1e8e68) (0x7d154698)
  7 0x7ca2fe4b in nouveau_dri.so (+0x1e8e4a) (0x7d154698)
  8 0x7c9a832b in nouveau_dri.so (+0x16132a) (0x7d154698)
  9 0x7c9b5e34 in nouveau_dri.so (+0x16ee33) (0x7d154698)
  10 0x7c99ed2e in nouveau_dri.so (+0x157d2d) (0x7d154698)
  11 0x7ca4eab9 in nouveau_dri.so (+0x207ab8) (0x7d154698)
  12 0x7c92a092 in nouveau_dri.so (+0xe3091) (0x7d154698)
  13 0x7c92a569 in nouveau_dri.so (+0xe3568) (0x7d154698)
  14 0x7c92a5b5 in nouveau_dri.so (+0xe35b4) (0x0032e838)
  15 0x7c92a2a0 in nouveau_dri.so (+0xe329f) (0x0032e838)
  16 0x7c9276ff in nouveau_dri.so (+0xe06fe) (0x0032e8b8)
  17 0x7d423e66 shared_dispatch_stub_650+0x25() in libglapi.so.0 (0x0032e8b8)
  18 0x7e7d8d0a in wined3d (+0x68d09) (0x0032e8b8)
  19 0x7e7d92a9 in wined3d (+0x692a8) (0x0032e8d8)
  20 0x7e7d93cd in wined3d (+0x693cc) (0x0032e908)
  21 0x7e7cb1d3 in wined3d (+0x5b1d2) (0x0032e938)
  22 0x7e7b2586 wined3d_device_uninit_3d+0x155() in wined3d (0x0032e988)
  23 0x7d8e9a93 in d3d9 (+0x19a92) (0x0032e9d8)
0xf773b430 __kernel_vsyscall+0x10 in [vdso].so: popl    %ebp
Modules:
Module    Address            Debug info    Name (120 modules)
PE      400000- 1338000    Deferred        u9
PE     7900000- 7b18000    Deferred        3dfxspl2
PE    10000000-16791000    Export          glide2x
ELF    7a212000-7b800000    Deferred        libllvm-3.3.so
ELF    7b800000-7ba5e000    Deferred        kernel32&lt;elf&gt;
  \-PE    7b810000-7ba5e000    \               kernel32
ELF    7bc00000-7bce3000    Deferred        ntdll&lt;elf&gt;
  \-PE    7bc10000-7bce3000    \               ntdll
ELF    7bf00000-7bf04000    Deferred        &lt;wine-loader&gt;
ELF    7c086000-7c09f000    Deferred        libresolv.so.2
ELF    7c09f000-7c0cc000    Deferred        libvorbis.so.0
ELF    7c0cc000-7c157000    Deferred        libvorbisenc.so.2
ELF    7c157000-7c1a1000    Deferred        libflac.so.8
ELF    7c1a1000-7c1bb000    Deferred        libnsl.so.1
ELF    7c1bb000-7c225000    Deferred        libsndfile.so.1
ELF    7c406000-7c453000    Deferred        libdbus-1.so.3
ELF    7c453000-7c4c7000    Deferred        libpulsecommon-4.0.so
ELF    7c847000-7d0a7000    Dwarf           nouveau_dri.so
ELF    7d16e000-7d174000    Deferred        libattr.so.1
ELF    7d174000-7d181000    Deferred        libgsm.so.1
ELF    7d201000-7d21e000    Deferred        libgcc_s.so.1
ELF    7d30a000-7d312000    Deferred        libdrm_nouveau.so.2
ELF    7d312000-7d319000    Deferred        libffi.so.6
ELF    7d319000-7d342000    Deferred        liblzma.so.5
ELF    7d342000-7d3ad000    Deferred        libpcre.so.1
ELF    7d3ad000-7d3d1000    Deferred        libselinux.so.1
ELF    7d3d1000-7d3df000    Deferred        libdrm.so.2
ELF    7d3df000-7d3e5000    Deferred        libxcb-dri2.so.0
ELF    7d3e5000-7d400000    Deferred        libxcb-glx.so.0
ELF    7d400000-7d403000    Deferred        libx11-xcb.so.1
ELF    7d403000-7d407000    Deferred        libxdamage.so.1
ELF    7d407000-7d445000    Dwarf           libglapi.so.0
ELF    7d445000-7d4c0000    Deferred        libgl.so.1
ELF    7d4c4000-7d4cc000    Deferred        libogg.so.0
ELF    7d4cc000-7d4d2000    Deferred        libuuid.so.1
ELF    7d4d2000-7d4db000    Deferred        librt.so.1
ELF    7d4db000-7d4e2000    Deferred        libasyncns.so.0
ELF    7d4e2000-7d4ec000    Deferred        libwrap.so.0
ELF    7d4ec000-7d4f3000    Deferred        libxtst.so.6
ELF    7d4f3000-7d50d000    Deferred        libice.so.6
ELF    7d50d000-7d55e000    Deferred        libpulse.so.0
ELF    7d57e000-7d5a6000    Deferred        winepulse&lt;elf&gt;
  \-PE    7d580000-7d5a6000    \               winepulse
ELF    7d5a6000-7d5c9000    Deferred        mmdevapi&lt;elf&gt;
  \-PE    7d5b0000-7d5c9000    \               mmdevapi
ELF    7d868000-7d86e000    Deferred        libcap.so.2
ELF    7d86e000-7d877000    Deferred        libsm.so.6
ELF    7d877000-7d882000    Deferred        libjson-c.so.2
ELF    7d8a8000-7d8cd000    Deferred        imm32&lt;elf&gt;
  \-PE    7d8b0000-7d8cd000    \               imm32
ELF    7d8cd000-7d90b000    Dwarf           d3d9&lt;elf&gt;
  \-PE    7d8d0000-7d90b000    \               d3d9
ELF    7d92f000-7d966000    Deferred        uxtheme&lt;elf&gt;
  \-PE    7d940000-7d966000    \               uxtheme
ELF    7d988000-7d98e000    Deferred        libxfixes.so.3
ELF    7d98e000-7d99a000    Deferred        libxcursor.so.1
ELF    7d99a000-7d9ab000    Deferred        libxi.so.6
ELF    7d9ab000-7d9b6000    Deferred        libxrender.so.1
ELF    7d9b6000-7d9bc000    Deferred        libxxf86vm.so.1
ELF    7d9bc000-7d9c0000    Deferred        libxau.so.6
ELF    7d9c0000-7d9e4000    Deferred        libxcb.so.1
ELF    7d9e4000-7db20000    Deferred        libx11.so.6
ELF    7db20000-7db33000    Deferred        libxext.so.6
ELF    7db53000-7dbe9000    Deferred        winex11&lt;elf&gt;
  \-PE    7db60000-7dbe9000    \               winex11
ELF    7dc11000-7dc3a000    Deferred        libexpat.so.1
ELF    7dc3a000-7dc77000    Deferred        libfontconfig.so.1
ELF    7dc77000-7dcae000    Deferred        libpng16.so.16
ELF    7dcae000-7dcc5000    Deferred        libz.so.1
ELF    7dcc5000-7dd67000    Deferred        libfreetype.so.6
ELF    7dd67000-7dd89000    Deferred        libtinfo.so.5
ELF    7dd89000-7ddb1000    Deferred        libncurses.so.5
ELF    7ddd1000-7de14000    Deferred        winspool&lt;elf&gt;
  \-PE    7dde0000-7de14000    \               winspool
ELF    7de14000-7e04c000    Deferred        shell32&lt;elf&gt;
  \-PE    7de20000-7e04c000    \               shell32
ELF    7e04c000-7e138000    Deferred        comdlg32&lt;elf&gt;
  \-PE    7e050000-7e138000    \               comdlg32
ELF    7e138000-7e1b4000    Deferred        shlwapi&lt;elf&gt;
  \-PE    7e150000-7e1b4000    \               shlwapi
ELF    7e1b4000-7e2ed000    Deferred        oleaut32&lt;elf&gt;
  \-PE    7e1d0000-7e2ed000    \               oleaut32
ELF    7e2ed000-7e3f8000    Deferred        comctl32&lt;elf&gt;
  \-PE    7e2f0000-7e3f8000    \               comctl32
ELF    7e3f8000-7e424000    Deferred        msvfw32&lt;elf&gt;
  \-PE    7e400000-7e424000    \               msvfw32
ELF    7e424000-7e51e000    Deferred        quartz&lt;elf&gt;
  \-PE    7e440000-7e51e000    \               quartz
ELF    7e51e000-7e549000    Deferred        msacm32&lt;elf&gt;
  \-PE    7e520000-7e549000    \               msacm32
ELF    7e549000-7e602000    Deferred        winmm&lt;elf&gt;
  \-PE    7e550000-7e602000    \               winmm
ELF    7e602000-7e64d000    Deferred        dsound&lt;elf&gt;
  \-PE    7e610000-7e64d000    \               dsound
ELF    7e64d000-7e75d000    Deferred        opengl32&lt;elf&gt;
  \-PE    7e670000-7e75d000    \               opengl32
ELF    7e75d000-7e89f000    Dwarf           wined3d&lt;elf&gt;
  \-PE    7e770000-7e89f000    \               wined3d
ELF    7e89f000-7e916000    Deferred        ddraw&lt;elf&gt;
  \-PE    7e8b0000-7e916000    \               ddraw
ELF    7e916000-7e99b000    Deferred        rpcrt4&lt;elf&gt;
  \-PE    7e920000-7e99b000    \               rpcrt4
ELF    7e99b000-7eabe000    Deferred        gdi32&lt;elf&gt;
  \-PE    7e9b0000-7eabe000    \               gdi32
ELF    7eabe000-7ec1d000    Deferred        user32&lt;elf&gt;
  \-PE    7ead0000-7ec1d000    \               user32
ELF    7ec1d000-7ec91000    Deferred        advapi32&lt;elf&gt;
  \-PE    7ec30000-7ec91000    \               advapi32
ELF    7ec91000-7edd3000    Deferred        ole32&lt;elf&gt;
  \-PE    7ecb0000-7edd3000    \               ole32
ELF    7efd3000-7efe0000    Deferred        libnss_files.so.2
ELF    7efe6000-7f000000    Deferred        version&lt;elf&gt;
  \-PE    7eff0000-7f000000    \               version
ELF    f731c000-f7363000    Deferred        libm.so.6
ELF    f7364000-f7369000    Deferred        libdl.so.2
ELF    f7369000-f7527000    Dwarf           libc.so.6
ELF    f7527000-f7542000    Deferred        libpthread.so.0
ELF    f7542000-f76f8000    Dwarf           libwine.so.1
ELF    f7719000-f773b000    Deferred        ld-linux.so.2
ELF    f773b000-f773c000    Dwarf           [vdso].so
Threads:
process  tid      prio (all id:s are in hex)
00000008 (D) C:\GOG Games\Ultima IX - Ascension\u9.exe
    00000027   15
    00000025   15
    00000024    0
    00000023    0
    00000009    0 &lt;==
0000000e services.exe
    0000001e    0
    0000001d    0
    00000014    0
    00000010    0
    0000000f    0
00000012 winedevice.exe
    0000001a    0
    00000019    0
    00000017    0
    00000013    0
0000001b plugplay.exe
    00000020    0
    0000001f    0
    0000001c    0
00000021 explorer.exe
    00000022    0
System information:
    Wine build: wine-1.7.8
    Platform: i386 (WOW64)
    Host system: Linux
    Host version: 3.12.8-300.fc20.x86_64</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391753458.baBd712.8077--

--===============0970561454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0970561454==--
