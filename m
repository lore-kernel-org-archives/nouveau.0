From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92306] GL Excess demo renders incorrectly on nv43
Date: Wed, 07 Oct 2015 17:11:38 +0000
Message-ID: <bug-92306-8800-DnpK7Nx0NO@http.bugs.freedesktop.org/>
References: <bug-92306-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1527880496=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92306-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1527880496==
Content-Type: multipart/alternative; boundary="1444237898.bdBbCfF0.23891"; charset="UTF-8"


--1444237898.bdBbCfF0.23891
Date: Wed, 7 Oct 2015 17:11:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92306

--- Comment #6 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
Updating wine (to version 1.7.51-staging, from
http://www.slackware.com/~alien/slackbuilds/wine/pkg/14.1/) resulted in
correctly disabled Vsync, but rendering still broken in the same way.

Moreover, attempt to use latest apitrace (command line: 
~/src/apitrace/apitrace trace /usr/bin/wine GLExcess.exe ) only resulted in
illegal instruction (?!)

----quote----

apitrace: loaded into /usr/bin/wine
apitrace: loaded into /usr/bin/wine-preloader
apitrace: loaded into /usr/bin/wineserver
apitrace: loaded into /usr/bin/wine-preloader
fixme:winediag:start_process Wine Staging 1.7.51 is a testing version
containing experimental patches.
fixme:winediag:start_process Please report bugs at http://bugs.wine-staging.com
(instead of winehq.org).
apitrace: loaded into /usr/bin/wine-preloader
apitrace: loaded into /usr/bin/wine-preloader
apitrace: loaded into /usr/bin/wine-preloader
apitrace: loaded into /usr/bin/wine-preloader
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
apitrace: loaded into /usr/bin/wine-preloader
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
fixme:ole:RemUnknown_QueryInterface No interface for iid
{00000019-0000-0000-c000-000000000046}
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
apitrace: loaded into /usr/bin/wine-preloader
bash-4.2$ Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14:
reading configurations from ~/.fonts.conf is deprecated.
apitrace: loaded into /usr/bin/wine-preloader
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
apitrace: tracing to /home/guest/.wine/drive_c/Program Files/GL
Excess/wine-preloader.trace
apitrace: redirecting dlopen("libGL.so.1", 0x102)
apitrace: redirecting dlopen("libGL.so.1", 0x102)
apitrace: attempting to read configuration file:
/home/guest/.config/apitrace/gltrace.conf
wine: Unhandled illegal instruction at address 0xb75957f2 (thread 002a),
starting debugger...
apitrace: loaded into /usr/bin/wine-preloader
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
Unhandled exception: illegal instruction in 32-bit code (0xb75957f2).
Register dump:
 CS:0073 SS:007b DS:007b ES:007b FS:0033 GS:003b
 EIP:b75957f2 ESP:0033f978 EBP:0033f978 EFLAGS:00210282(  R- --  I S - - - )
 EAX:46240400 EBX:b777ab1c ECX:b777ab1c EDX:b6fdb89d
 ESI:7dffabc0 EDI:00002802
Stack dump:
0x0033f978:  0033f9b8 b74366ab 46240400 00000002
0x0033f988:  00002802 00000000 b778adcc 00001a4f
0x0033f998:  00000004 b777ab1c 7dffabc0 b777ab1c
0x0033f9a8:  0033f9d8 00001a50 b778ad60 7e8f77d0
0x0033f9b8:  0033fa08 7e883727 00000de1 00002802
0x0033f9c8:  46240400 00001a4f cccccccc 7e8f77d0
Backtrace:
=>0 0xb75957f2 (0x0033f978)
  1 0xb74366ab (0x0033f9b8)
  2 0x7e883727 glTexParameterf+0x86() in opengl32 (0x0033fa08)
  3 0x00441a5d in glxsv1.2 (+0x41a5c) (0x0033fa70)
  4 0x00441d01 in glxsv1.2 (+0x41d00) (0x0033fb78)
  5 0x004175f9 in glxsv1.2 (+0x175f8) (0x0033fbd8)
  6 0x0044c0b7 in glxsv1.2 (+0x4c0b6) (0x0033fdd0)
  7 0x004540a3 in glxsv1.2 (+0x540a2) (0x0033fe60)
  8 0x7ed06acc call_process_entry+0xb() in kernel32 (0x0033fe78)
  9 0x7ed07e31 in kernel32 (+0x47e30) (0x0033feb8)
  10 0x7ef91b00 call_thread_func_wrapper+0xb() in ntdll (0x0033fed8)
  11 0x7ef94d1d call_thread_func+0x7c() in ntdll (0x0033ffa8)
  12 0x7ef91ade RtlRaiseException+0x21() in ntdll (0x0033ffc8)
  13 0x7ef65faf in ntdll (+0x45fae) (0x0033ffe8)
  14 0xb720c75d wine_call_on_stack+0x1c() in libwine.so.1 (0x00000000)
  15 0xb720c81b wine_switch_to_stack+0x2a() in libwine.so.1 (0xbfc40d18)
  16 0x7ef6a474 LdrInitializeThunk+0x263() in ntdll (0xbfc40d68)
  17 0x7ed0ea43 __wine_kernel_init+0xa02() in kernel32 (0xbfc41c68)
  18 0x7ef6b45b __wine_process_init+0x19a() in ntdll (0xbfc41cf8)
  19 0xb7209ea8 wine_init+0x2c7() in libwine.so.1 (0xbfc41d58)
  20 0x7bf00fcc main+0x7b() in <wine-loader> (0xbfc421a8)
  21 0xb704c773 __libc_start_main+0xf2() in libc.so.6 (0x00000000)
0xb75957f2: repe (bad)
Modules:
Module  Address                 Debug info      Name (78 modules)
PE        340000-  38f000       Deferred        fmod
PE        400000-  5a7000       Export          glxsv1.2
PE      10000000-10035000       Deferred        glut32
PE      60000000-6005d000       Deferred        ijl15
ELF     7bf00000-7bf03000       Dwarf           <wine-loader>
ELF     7d3a1000-7dacc000       Deferred        nouveau_dri.so
ELF     7ddd0000-7ddd7000       Deferred        libdrm_nouveau.so.2
ELF     7ddd7000-7dde5000       Deferred        libudev.so.0
ELF     7dde5000-7ddef000       Deferred        libxcursor.so.1
ELF     7de21000-7de5a000       Deferred        libfontconfig.so.1
ELF     7de5a000-7de70000       Deferred        libz.so.1
ELF     7de70000-7de9b000       Deferred        libpng14.so.14
ELF     7de9b000-7deac000       Deferred        libbz2.so.1
ELF     7deac000-7df3c000       Deferred        libfreetype.so.6
ELF     7df3c000-7df4b000       Deferred        libxi.so.6
ELF     7df4c000-7df51000       Deferred        libtxc_dxtn.so
ELF     7df6d000-7e002000       Deferred        winex11<elf>
  \-PE  7df80000-7e002000       \               winex11
ELF     7e002000-7e026000       Deferred        imm32<elf>
  \-PE  7e010000-7e026000       \               imm32
ELF     7e026000-7e0aa000       Deferred        rpcrt4<elf>
  \-PE  7e030000-7e0aa000       \               rpcrt4
ELF     7e0aa000-7e1ec000       Deferred        ole32<elf>
  \-PE  7e0c0000-7e1ec000       \               ole32
ELF     7e1ec000-7e29e000       Deferred        msvcrt<elf>
  \-PE  7e200000-7e29e000       \               msvcrt
ELF     7e29e000-7e2c8000       Deferred        msacm32<elf>
  \-PE  7e2a0000-7e2c8000       \               msacm32
ELF     7e2c8000-7e381000       Deferred        winmm<elf>
  \-PE  7e2d0000-7e381000       \               winmm
ELF     7e3b0000-7e3c0000       Deferred        libdrm.so.2
ELF     7e3c0000-7e3c6000       Deferred        libxdmcp.so.6
ELF     7e3c6000-7e3c9000       Deferred        libxau.so.6
ELF     7e3c9000-7e3e9000       Deferred        libxcb.so.1
ELF     7e3e9000-7e3ee000       Deferred        libxxf86vm.so.1
ELF     7e3ee000-7e3f3000       Deferred        libxcb-dri2.so.0
ELF     7e3f3000-7e40a000       Deferred        libxcb-glx.so.0
ELF     7e40a000-7e42f000       Deferred        libglapi.so.0
ELF     7e42f000-7e456000       Deferred        libexpat.so.1
ELF     7e456000-7e472000       Deferred        libgcc_s.so.1
ELF     7e55a000-7e691000       Deferred        libx11.so.6
ELF     7e691000-7e6a3000       Deferred        libxext.so.6
ELF     7e6a3000-7e730000       Deferred        libgl.so.1
ELF     7e730000-7e7a9000       Deferred        libglu.so.1
ELF     7e7ad000-7e7b0000       Deferred        libxcomposite.so.1
ELF     7e7b0000-7e7ba000       Deferred        libxrandr.so.2
ELF     7e7ba000-7e7c4000       Deferred        libxrender.so.1
ELF     7e7c4000-7e7c7000       Deferred        libxinerama.so.1
ELF     7e7c7000-7e7cb000       Deferred        cp1251.so
ELF     7e7cb000-7e7e2000       Deferred        glu32<elf>
  \-PE  7e7d0000-7e7e2000       \               glu32
ELF     7e7e2000-7e900000       Dwarf           opengl32<elf>
  \-PE  7e800000-7e900000       \               opengl32
ELF     7e900000-7e97a000       Deferred        advapi32<elf>
  \-PE  7e910000-7e97a000       \               advapi32
ELF     7e97a000-7ea98000       Deferred        gdi32<elf>
  \-PE  7e990000-7ea98000       \               gdi32
ELF     7ea98000-7ec0d000       Deferred        user32<elf>
  \-PE  7eab0000-7ec0d000       \               user32
ELF     7ec0d000-7ec1a000       Deferred        libnss_files.so.2
ELF     7ec1a000-7ec26000       Deferred        libnss_nis.so.2
ELF     7ec26000-7ec41000       Deferred        libnsl.so.1
ELF     7ec41000-7ec4b000       Deferred        libnss_compat.so.2
ELF     7ec4d000-7ec4f000       Deferred        libx11-xcb.so.1
ELF     7ec4f000-7ec54000       Deferred        libxfixes.so.3
ELF     7ec54000-7ec6d000       Deferred        version<elf>
  \-PE  7ec60000-7ec6d000       \               version
ELF     7eca4000-7ef0e000       Dwarf           kernel32<elf>
  \-PE  7ecc0000-7ef0e000       \               kernel32
ELF     7ef0e000-7f000000       Dwarf           ntdll<elf>
  \-PE  7ef20000-7f000000       \               ntdll
ELF     b6dc0000-b6dc3000       Deferred        libxdamage.so.1
ELF     b6ff1000-b7033000       Deferred        libm.so.6
ELF     b7033000-b71bf000       Dwarf           libc.so.6
ELF     b71bf000-b71c4000       Deferred        libdl.so.2
ELF     b71c4000-b71de000       Deferred        libpthread.so.0
ELF     b7200000-b73c6000       Dwarf           libwine.so.1
ELF     b7793000-b77b6000       Deferred        ld-linux.so.2
Threads:
process  tid      prio (all id:s are in hex)
0000000e services.exe
        00000020    0
        0000001f    0
        00000016    0
        00000012    0
        0000000f    0
00000010 explorer.exe
        00000026    0
        00000025    0
        00000024    0
        00000023    0
        00000011    0
00000014 winedevice.exe
        0000001e    0
        0000001b    0
        0000001a    0
        00000015    0
0000001c plugplay.exe
        00000022    0
        00000021    0
        0000001d    0
00000027 XSconfig.exe
        00000028    0
00000029 (D) C:\Program Files\GL Excess\glxsv1.2.exe
        0000002a    0 <==
System information:
    Wine build: wine-1.7.51 (Staging)
    Platform: i386
    Host system: Linux
    Host version: 4.2.0-i486
apitrace: loaded into /usr/bin/wine-preloader
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
apitrace: loaded into /usr/bin/wine-preloader
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
apitrace: loaded into /usr/bin/konqueror
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
apitrace: loaded into /bin/bash
apitrace: loaded into /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: loaded into /bin/bash
apitrace: loaded into /usr/bin/iceauth
apitrace: unloaded from /usr/bin/iceauth
apitrace: unloaded from /usr/bin/kdeinit
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
kbuildsycoca running...
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/konqueror
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: loaded into /bin/bash
apitrace: loaded into /usr/bin/dcopserver_shutdown
apitrace: loaded into /bin/bash
apitrace: loaded into /usr/bin/iceauth
apitrace: unloaded from /usr/bin/iceauth
apitrace: unloaded from /usr/bin/dcopserver_shutdown
apitrace: unloaded from /usr/bin/kdeinit

----quote end-----

Is there way to dump openGL commands via other method? Gallium-specific, even?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1444237898.bdBbCfF0.23891
Date: Wed, 7 Oct 2015 17:11:38 +0000
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
   title="NEW - GL Excess demo renders incorrectly on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92306#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GL Excess demo renders incorrectly on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92306">bug 92306</a>
              from <span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>Updating wine (to version 1.7.51-staging, from
<a href="http://www.slackware.com/~alien/slackbuilds/wine/pkg/14.1/">http://www.slackware.com/~alien/slackbuilds/wine/pkg/14.1/</a>) resulted in
correctly disabled Vsync, but rendering still broken in the same way.

Moreover, attempt to use latest apitrace (command line: 
~/src/apitrace/apitrace trace /usr/bin/wine GLExcess.exe ) only resulted in
illegal instruction (?!)

----quote----

apitrace: loaded into /usr/bin/wine
apitrace: loaded into /usr/bin/wine-preloader
apitrace: loaded into /usr/bin/wineserver
apitrace: loaded into /usr/bin/wine-preloader
fixme:winediag:start_process Wine Staging 1.7.51 is a testing version
containing experimental patches.
fixme:winediag:start_process Please report bugs at <a href="http://bugs.wine-staging.com">http://bugs.wine-staging.com</a>
(instead of winehq.org).
apitrace: loaded into /usr/bin/wine-preloader
apitrace: loaded into /usr/bin/wine-preloader
apitrace: loaded into /usr/bin/wine-preloader
apitrace: loaded into /usr/bin/wine-preloader
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
apitrace: loaded into /usr/bin/wine-preloader
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
fixme:ole:RemUnknown_QueryInterface No interface for iid
{00000019-0000-0000-c000-000000000046}
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
apitrace: loaded into /usr/bin/wine-preloader
bash-4.2$ Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14:
reading configurations from ~/.fonts.conf is deprecated.
apitrace: loaded into /usr/bin/wine-preloader
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
apitrace: tracing to /home/guest/.wine/drive_c/Program Files/GL
Excess/wine-preloader.trace
apitrace: redirecting dlopen(&quot;libGL.so.1&quot;, 0x102)
apitrace: redirecting dlopen(&quot;libGL.so.1&quot;, 0x102)
apitrace: attempting to read configuration file:
/home/guest/.config/apitrace/gltrace.conf
wine: Unhandled illegal instruction at address 0xb75957f2 (thread 002a),
starting debugger...
apitrace: loaded into /usr/bin/wine-preloader
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
Unhandled exception: illegal instruction in 32-bit code (0xb75957f2).
Register dump:
 CS:0073 SS:007b DS:007b ES:007b FS:0033 GS:003b
 EIP:b75957f2 ESP:0033f978 EBP:0033f978 EFLAGS:00210282(  R- --  I S - - - )
 EAX:46240400 EBX:b777ab1c ECX:b777ab1c EDX:b6fdb89d
 ESI:7dffabc0 EDI:00002802
Stack dump:
0x0033f978:  0033f9b8 b74366ab 46240400 00000002
0x0033f988:  00002802 00000000 b778adcc 00001a4f
0x0033f998:  00000004 b777ab1c 7dffabc0 b777ab1c
0x0033f9a8:  0033f9d8 00001a50 b778ad60 7e8f77d0
0x0033f9b8:  0033fa08 7e883727 00000de1 00002802
0x0033f9c8:  46240400 00001a4f cccccccc 7e8f77d0
Backtrace:
=&gt;0 0xb75957f2 (0x0033f978)
  1 0xb74366ab (0x0033f9b8)
  2 0x7e883727 glTexParameterf+0x86() in opengl32 (0x0033fa08)
  3 0x00441a5d in glxsv1.2 (+0x41a5c) (0x0033fa70)
  4 0x00441d01 in glxsv1.2 (+0x41d00) (0x0033fb78)
  5 0x004175f9 in glxsv1.2 (+0x175f8) (0x0033fbd8)
  6 0x0044c0b7 in glxsv1.2 (+0x4c0b6) (0x0033fdd0)
  7 0x004540a3 in glxsv1.2 (+0x540a2) (0x0033fe60)
  8 0x7ed06acc call_process_entry+0xb() in kernel32 (0x0033fe78)
  9 0x7ed07e31 in kernel32 (+0x47e30) (0x0033feb8)
  10 0x7ef91b00 call_thread_func_wrapper+0xb() in ntdll (0x0033fed8)
  11 0x7ef94d1d call_thread_func+0x7c() in ntdll (0x0033ffa8)
  12 0x7ef91ade RtlRaiseException+0x21() in ntdll (0x0033ffc8)
  13 0x7ef65faf in ntdll (+0x45fae) (0x0033ffe8)
  14 0xb720c75d wine_call_on_stack+0x1c() in libwine.so.1 (0x00000000)
  15 0xb720c81b wine_switch_to_stack+0x2a() in libwine.so.1 (0xbfc40d18)
  16 0x7ef6a474 LdrInitializeThunk+0x263() in ntdll (0xbfc40d68)
  17 0x7ed0ea43 __wine_kernel_init+0xa02() in kernel32 (0xbfc41c68)
  18 0x7ef6b45b __wine_process_init+0x19a() in ntdll (0xbfc41cf8)
  19 0xb7209ea8 wine_init+0x2c7() in libwine.so.1 (0xbfc41d58)
  20 0x7bf00fcc main+0x7b() in &lt;wine-loader&gt; (0xbfc421a8)
  21 0xb704c773 __libc_start_main+0xf2() in libc.so.6 (0x00000000)
0xb75957f2: repe (bad)
Modules:
Module  Address                 Debug info      Name (78 modules)
PE        340000-  38f000       Deferred        fmod
PE        400000-  5a7000       Export          glxsv1.2
PE      10000000-10035000       Deferred        glut32
PE      60000000-6005d000       Deferred        ijl15
ELF     7bf00000-7bf03000       Dwarf           &lt;wine-loader&gt;
ELF     7d3a1000-7dacc000       Deferred        nouveau_dri.so
ELF     7ddd0000-7ddd7000       Deferred        libdrm_nouveau.so.2
ELF     7ddd7000-7dde5000       Deferred        libudev.so.0
ELF     7dde5000-7ddef000       Deferred        libxcursor.so.1
ELF     7de21000-7de5a000       Deferred        libfontconfig.so.1
ELF     7de5a000-7de70000       Deferred        libz.so.1
ELF     7de70000-7de9b000       Deferred        libpng14.so.14
ELF     7de9b000-7deac000       Deferred        libbz2.so.1
ELF     7deac000-7df3c000       Deferred        libfreetype.so.6
ELF     7df3c000-7df4b000       Deferred        libxi.so.6
ELF     7df4c000-7df51000       Deferred        libtxc_dxtn.so
ELF     7df6d000-7e002000       Deferred        winex11&lt;elf&gt;
  \-PE  7df80000-7e002000       \               winex11
ELF     7e002000-7e026000       Deferred        imm32&lt;elf&gt;
  \-PE  7e010000-7e026000       \               imm32
ELF     7e026000-7e0aa000       Deferred        rpcrt4&lt;elf&gt;
  \-PE  7e030000-7e0aa000       \               rpcrt4
ELF     7e0aa000-7e1ec000       Deferred        ole32&lt;elf&gt;
  \-PE  7e0c0000-7e1ec000       \               ole32
ELF     7e1ec000-7e29e000       Deferred        msvcrt&lt;elf&gt;
  \-PE  7e200000-7e29e000       \               msvcrt
ELF     7e29e000-7e2c8000       Deferred        msacm32&lt;elf&gt;
  \-PE  7e2a0000-7e2c8000       \               msacm32
ELF     7e2c8000-7e381000       Deferred        winmm&lt;elf&gt;
  \-PE  7e2d0000-7e381000       \               winmm
ELF     7e3b0000-7e3c0000       Deferred        libdrm.so.2
ELF     7e3c0000-7e3c6000       Deferred        libxdmcp.so.6
ELF     7e3c6000-7e3c9000       Deferred        libxau.so.6
ELF     7e3c9000-7e3e9000       Deferred        libxcb.so.1
ELF     7e3e9000-7e3ee000       Deferred        libxxf86vm.so.1
ELF     7e3ee000-7e3f3000       Deferred        libxcb-dri2.so.0
ELF     7e3f3000-7e40a000       Deferred        libxcb-glx.so.0
ELF     7e40a000-7e42f000       Deferred        libglapi.so.0
ELF     7e42f000-7e456000       Deferred        libexpat.so.1
ELF     7e456000-7e472000       Deferred        libgcc_s.so.1
ELF     7e55a000-7e691000       Deferred        libx11.so.6
ELF     7e691000-7e6a3000       Deferred        libxext.so.6
ELF     7e6a3000-7e730000       Deferred        libgl.so.1
ELF     7e730000-7e7a9000       Deferred        libglu.so.1
ELF     7e7ad000-7e7b0000       Deferred        libxcomposite.so.1
ELF     7e7b0000-7e7ba000       Deferred        libxrandr.so.2
ELF     7e7ba000-7e7c4000       Deferred        libxrender.so.1
ELF     7e7c4000-7e7c7000       Deferred        libxinerama.so.1
ELF     7e7c7000-7e7cb000       Deferred        cp1251.so
ELF     7e7cb000-7e7e2000       Deferred        glu32&lt;elf&gt;
  \-PE  7e7d0000-7e7e2000       \               glu32
ELF     7e7e2000-7e900000       Dwarf           opengl32&lt;elf&gt;
  \-PE  7e800000-7e900000       \               opengl32
ELF     7e900000-7e97a000       Deferred        advapi32&lt;elf&gt;
  \-PE  7e910000-7e97a000       \               advapi32
ELF     7e97a000-7ea98000       Deferred        gdi32&lt;elf&gt;
  \-PE  7e990000-7ea98000       \               gdi32
ELF     7ea98000-7ec0d000       Deferred        user32&lt;elf&gt;
  \-PE  7eab0000-7ec0d000       \               user32
ELF     7ec0d000-7ec1a000       Deferred        libnss_files.so.2
ELF     7ec1a000-7ec26000       Deferred        libnss_nis.so.2
ELF     7ec26000-7ec41000       Deferred        libnsl.so.1
ELF     7ec41000-7ec4b000       Deferred        libnss_compat.so.2
ELF     7ec4d000-7ec4f000       Deferred        libx11-xcb.so.1
ELF     7ec4f000-7ec54000       Deferred        libxfixes.so.3
ELF     7ec54000-7ec6d000       Deferred        version&lt;elf&gt;
  \-PE  7ec60000-7ec6d000       \               version
ELF     7eca4000-7ef0e000       Dwarf           kernel32&lt;elf&gt;
  \-PE  7ecc0000-7ef0e000       \               kernel32
ELF     7ef0e000-7f000000       Dwarf           ntdll&lt;elf&gt;
  \-PE  7ef20000-7f000000       \               ntdll
ELF     b6dc0000-b6dc3000       Deferred        libxdamage.so.1
ELF     b6ff1000-b7033000       Deferred        libm.so.6
ELF     b7033000-b71bf000       Dwarf           libc.so.6
ELF     b71bf000-b71c4000       Deferred        libdl.so.2
ELF     b71c4000-b71de000       Deferred        libpthread.so.0
ELF     b7200000-b73c6000       Dwarf           libwine.so.1
ELF     b7793000-b77b6000       Deferred        ld-linux.so.2
Threads:
process  tid      prio (all id:s are in hex)
0000000e services.exe
        00000020    0
        0000001f    0
        00000016    0
        00000012    0
        0000000f    0
00000010 explorer.exe
        00000026    0
        00000025    0
        00000024    0
        00000023    0
        00000011    0
00000014 winedevice.exe
        0000001e    0
        0000001b    0
        0000001a    0
        00000015    0
0000001c plugplay.exe
        00000022    0
        00000021    0
        0000001d    0
00000027 XSconfig.exe
        00000028    0
00000029 (D) C:\Program Files\GL Excess\glxsv1.2.exe
        0000002a    0 &lt;==
System information:
    Wine build: wine-1.7.51 (Staging)
    Platform: i386
    Host system: Linux
    Host version: 4.2.0-i486
apitrace: loaded into /usr/bin/wine-preloader
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
apitrace: loaded into /usr/bin/wine-preloader
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
apitrace: loaded into /usr/bin/konqueror
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
apitrace: loaded into /bin/bash
apitrace: loaded into /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: loaded into /bin/bash
apitrace: loaded into /usr/bin/iceauth
apitrace: unloaded from /usr/bin/iceauth
apitrace: unloaded from /usr/bin/kdeinit
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
kbuildsycoca running...
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/konqueror
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: unloaded from /usr/bin/kdeinit
apitrace: loaded into /bin/bash
apitrace: loaded into /usr/bin/dcopserver_shutdown
apitrace: loaded into /bin/bash
apitrace: loaded into /usr/bin/iceauth
apitrace: unloaded from /usr/bin/iceauth
apitrace: unloaded from /usr/bin/dcopserver_shutdown
apitrace: unloaded from /usr/bin/kdeinit

----quote end-----

Is there way to dump openGL commands via other method? Gallium-specific, even?</pre>
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

--1444237898.bdBbCfF0.23891--

--===============1527880496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1527880496==--
