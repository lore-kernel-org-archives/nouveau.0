From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73459] New: nv10 get_rt_format: Assertion `0' failed.
Date: Fri, 10 Jan 2014 03:39:35 +0000
Message-ID: <bug-73459-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1888761538=="
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


--===============1888761538==
Content-Type: multipart/alternative; boundary="1389325175.8bc18f8A0.7028"; charset="us-ascii"


--1389325175.8bc18f8A0.7028
Date: Fri, 10 Jan 2014 03:39:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73459

          Priority: medium
            Bug ID: 73459
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nv10 get_rt_format: Assertion `0' failed.
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: dnietoc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 91805
  --> https://bugs.freedesktop.org/attachment.cgi?id=91805&action=edit
Test program which reproduces the crash

I found this error when trying to run DirectX programs in wine. During
initialization the following error is reported:

----------------------------------------------------
    nv10_state_fb.c:51: get_rt_format: Assertion `0' failed.
----------------------------------------------------

Wine shows the following stack trace:

----------------------------------------------------
    Backtrace:
    =>0 0xb77c7424 __kernel_vsyscall+0x10() in [vdso].so (0x7c83e5f0)
      1 0xb742b5f6 gsignal+0x45() in libc.so.6 (0x7c83e5f0)
      2 0xb742cd83 abort+0x142() in libc.so.6 (0x7c83e5f0)
      3 0xb7424877 __assert_fail_base+0x156() in libc.so.6 (0x7c83e5f0)
      4 0xb7424927 __assert_fail+0x56() in libc.so.6 (0x7c83e5f0)
      5 0x7d77b664 nv10_emit_framebuffer+0x683() in nouveau_vieux_dri.so
(0x7c83e5f0)
      6 0x7d76ec47 nouveau_state_emit+0x46() in nouveau_vieux_dri.so
(0x7ca39ee8)
      7 0x7d4b0646 _mesa_update_state_locked+0x195() in nouveau_vieux_dri.so
(0x00c10008)
      8 0x7d4b0ce4 _mesa_update_state+0x23() in nouveau_vieux_dri.so
(0x00000000)
      9 0x7d429cd8 _mesa_Clear+0x257() in nouveau_vieux_dri.so (0x00000000)
      10 0x7e0db196 check_fbo_compat+0xacc(gl_info=0x1251a0, format=0x12eacc)
[/home/diego/floss/wine/dlls/wined3d/utils.c:1204] in wined3d (0x0032f748)
      11 0x7e0dc625 init_format_fbo_compat_info+0x69a(gl_info=0x1251a0)
[/home/diego/floss/wine/dlls/wined3d/utils.c:1438] in wined3d (0x0032f7e8)
      12 0x7e0de6c7 wined3d_adapter_init_format_info+0x7e(adapter=0x125190)
[/home/diego/floss/wine/dlls/wined3d/utils.c:1984] in wined3d (0x0032f818)
      13 0x7e043952 wined3d_adapter_init+0x49f(adapter=0x125190, ordinal=0)
[/home/diego/floss/wine/dlls/wined3d/directx.c:5115] in wined3d (0x0032fc28)
      14 0x7e043d87 wined3d_init+0xbc(wined3d=0x125180, version=0x8, flags=0x5)
[/home/diego/floss/wine/dlls/wined3d/directx.c:5190] in wined3d (0x0032fc58)
      15 0x7e0ec0ca wined3d_create+0xd0(version=<couldn't compute location>,
flags=<couldn't compute location>)
[/home/diego/floss/wine/dlls/wined3d/wined3d_main.c:105] in wined3d
(0x0032fcc8)
      16 0x7e162fdd d3d8_init+0x45(d3d8=0x122578)
[/home/diego/floss/wine/dlls/d3d8/directx.c:413] in d3d8 (0x0032fd08)
      17 0x7e1575d1 Direct3DCreate8+0xb6(sdk_version=<couldn't compute
location>) [/home/diego/floss/wine/dlls/d3d8/d3d8_main.c:47] in d3d8
(0x0032fd68)
      18 0x0042a55f in crimsonland (+0x2a55e) (0x0032fe20)
      19 0x7b86353c call_process_entry+0xb() in kernel32 (0x0032fe38)
      20 0x7b863689 start_process+0x14a(peb=<couldn't compute location>)
[/home/diego/floss/wine/dlls/kernel32/process.c:1097] in kernel32 (0x0032fe98)
      21 0x7bc8557c call_thread_func_wrapper+0xb() in ntdll (0x0032feb8)
      22 0x7bc855c5 call_thread_func+0x3e(entry=0x7b86353e, arg=0x7ffdf000,
frame=0x32ffb8) [/home/diego/floss/wine/dlls/ntdll/signal_i386.c:2602] in ntdll
(0x0032ff98)
      23 0x7bc8555a call_thread_entry_point+0x11() in ntdll (0x0032ffb8)
      24 0x7bc58ff6 start_process+0x23(kernel_start=0x7b86353e)
[/home/diego/floss/wine/dlls/ntdll/loader.c:2762] in ntdll (0x0032ffe8)
      25 0xb75f6f8d wine_call_on_stack+0x1c() in libwine.so.1 (0x00000000)
      26 0xb75f6f6b wine_switch_to_stack+0x2a(func=0x7bc58fd2, arg=0x7b86353e,
stack=0x330000) [/home/diego/floss/wine/libs/wine/port.c:59] in libwine.so.1
(0xbfb7d9c8)
      27 0x7bc59323 LdrInitializeThunk+0x32c(kernel_start=<couldn't compute
location>, unknown2=<couldn't compute location>, unknown3=<couldn't compute
location>, unknown4=<couldn't compute location>)
[/home/diego/floss/wine/dlls/ntdll/loader.c:2818] in ntdll (0xbfb7da58)
      28 0x7b863ecc __wine_kernel_init+0x67d()
[/home/diego/floss/wine/dlls/kernel32/process.c:1269] in kernel32 (0xbfb7e918)
      29 0x7bc59b05 __wine_process_init+0x156()
[/home/diego/floss/wine/dlls/ntdll/loader.c:3027] in ntdll (0xbfb7e978)
      30 0xb75f5800 wine_init+0x140(argc=0x2, argv=0xbfb7ee84, error="",
error_size=0x400) [/home/diego/floss/wine/libs/wine/loader.c:952] in
libwine.so.1 (0xbfb7e9b8)
      31 0x7bf01144 main+0x11e(argc=0x2, argv=0xbfb7ee84)
[/home/diego/floss/wine/loader/main.c:237] in <wine-loader> (0xbfb7ede8)
      32 0xb7416993 __libc_start_main+0xf2() in libc.so.6 (0x00000000)
----------------------------------------------------

To get some information about how get_rt_format was called I applied the
following patch to mesa:

----------------------------------------------------
    commit ccd7c55c5ea814a431d592865de490527528ba51
    Author: Diego Nieto Cid <dnietoc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    Date:   Thu Dec 19 19:21:22 2013 -0300

        Print format before assert.

    diff --git a/src/mesa/drivers/dri/nouveau/nv10_state_fb.c
b/src/mesa/drivers/dri/nouveau/nv10_state_fb.c
    index 87ae1d6..91b4ee7 100644
    --- a/src/mesa/drivers/dri/nouveau/nv10_state_fb.c
    +++ b/src/mesa/drivers/dri/nouveau/nv10_state_fb.c
    @@ -47,6 +47,7 @@ get_rt_format(gl_format format)
            case MESA_FORMAT_Z24_S8:
                    return NV10_3D_RT_FORMAT_DEPTH_Z24S8;
            default:
    +               printf("Unsupported format %d\n", format);
                    assert(0);
            }
     }
----------------------------------------------------

The output after running wine with the patched libraries now includes the
following line:

----------------------------------------------------
    Unsupported format 16
----------------------------------------------------

Debugging wine I was able to get a trace of GL calls and I wrote a little GLUT
program which succesfully reproduce the crash. It's source file is attached to
the bug report.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389325175.8bc18f8A0.7028
Date: Fri, 10 Jan 2014 03:39:35 +0000
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
   title="NEW --- - nv10 get_rt_format: Assertion `0' failed."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73459">73459</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nv10 get_rt_format: Assertion `0' failed.
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
          <td>dnietoc&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=91805" name="attach_91805" title="Test program which reproduces the crash">attachment 91805</a> <a href="attachment.cgi?id=91805&amp;action=edit" title="Test program which reproduces the crash">[details]</a></span>
Test program which reproduces the crash

I found this error when trying to run DirectX programs in wine. During
initialization the following error is reported:

----------------------------------------------------
    nv10_state_fb.c:51: get_rt_format: Assertion `0' failed.
----------------------------------------------------

Wine shows the following stack trace:

----------------------------------------------------
    Backtrace:
    =&gt;0 0xb77c7424 __kernel_vsyscall+0x10() in [vdso].so (0x7c83e5f0)
      1 0xb742b5f6 gsignal+0x45() in libc.so.6 (0x7c83e5f0)
      2 0xb742cd83 abort+0x142() in libc.so.6 (0x7c83e5f0)
      3 0xb7424877 __assert_fail_base+0x156() in libc.so.6 (0x7c83e5f0)
      4 0xb7424927 __assert_fail+0x56() in libc.so.6 (0x7c83e5f0)
      5 0x7d77b664 nv10_emit_framebuffer+0x683() in nouveau_vieux_dri.so
(0x7c83e5f0)
      6 0x7d76ec47 nouveau_state_emit+0x46() in nouveau_vieux_dri.so
(0x7ca39ee8)
      7 0x7d4b0646 _mesa_update_state_locked+0x195() in nouveau_vieux_dri.so
(0x00c10008)
      8 0x7d4b0ce4 _mesa_update_state+0x23() in nouveau_vieux_dri.so
(0x00000000)
      9 0x7d429cd8 _mesa_Clear+0x257() in nouveau_vieux_dri.so (0x00000000)
      10 0x7e0db196 check_fbo_compat+0xacc(gl_info=0x1251a0, format=0x12eacc)
[/home/diego/floss/wine/dlls/wined3d/utils.c:1204] in wined3d (0x0032f748)
      11 0x7e0dc625 init_format_fbo_compat_info+0x69a(gl_info=0x1251a0)
[/home/diego/floss/wine/dlls/wined3d/utils.c:1438] in wined3d (0x0032f7e8)
      12 0x7e0de6c7 wined3d_adapter_init_format_info+0x7e(adapter=0x125190)
[/home/diego/floss/wine/dlls/wined3d/utils.c:1984] in wined3d (0x0032f818)
      13 0x7e043952 wined3d_adapter_init+0x49f(adapter=0x125190, ordinal=0)
[/home/diego/floss/wine/dlls/wined3d/directx.c:5115] in wined3d (0x0032fc28)
      14 0x7e043d87 wined3d_init+0xbc(wined3d=0x125180, version=0x8, flags=0x5)
[/home/diego/floss/wine/dlls/wined3d/directx.c:5190] in wined3d (0x0032fc58)
      15 0x7e0ec0ca wined3d_create+0xd0(version=&lt;couldn't compute location&gt;,
flags=&lt;couldn't compute location&gt;)
[/home/diego/floss/wine/dlls/wined3d/wined3d_main.c:105] in wined3d
(0x0032fcc8)
      16 0x7e162fdd d3d8_init+0x45(d3d8=0x122578)
[/home/diego/floss/wine/dlls/d3d8/directx.c:413] in d3d8 (0x0032fd08)
      17 0x7e1575d1 Direct3DCreate8+0xb6(sdk_version=&lt;couldn't compute
location&gt;) [/home/diego/floss/wine/dlls/d3d8/d3d8_main.c:47] in d3d8
(0x0032fd68)
      18 0x0042a55f in crimsonland (+0x2a55e) (0x0032fe20)
      19 0x7b86353c call_process_entry+0xb() in kernel32 (0x0032fe38)
      20 0x7b863689 start_process+0x14a(peb=&lt;couldn't compute location&gt;)
[/home/diego/floss/wine/dlls/kernel32/process.c:1097] in kernel32 (0x0032fe98)
      21 0x7bc8557c call_thread_func_wrapper+0xb() in ntdll (0x0032feb8)
      22 0x7bc855c5 call_thread_func+0x3e(entry=0x7b86353e, arg=0x7ffdf000,
frame=0x32ffb8) [/home/diego/floss/wine/dlls/ntdll/signal_i386.c:2602] in ntdll
(0x0032ff98)
      23 0x7bc8555a call_thread_entry_point+0x11() in ntdll (0x0032ffb8)
      24 0x7bc58ff6 start_process+0x23(kernel_start=0x7b86353e)
[/home/diego/floss/wine/dlls/ntdll/loader.c:2762] in ntdll (0x0032ffe8)
      25 0xb75f6f8d wine_call_on_stack+0x1c() in libwine.so.1 (0x00000000)
      26 0xb75f6f6b wine_switch_to_stack+0x2a(func=0x7bc58fd2, arg=0x7b86353e,
stack=0x330000) [/home/diego/floss/wine/libs/wine/port.c:59] in libwine.so.1
(0xbfb7d9c8)
      27 0x7bc59323 LdrInitializeThunk+0x32c(kernel_start=&lt;couldn't compute
location&gt;, unknown2=&lt;couldn't compute location&gt;, unknown3=&lt;couldn't compute
location&gt;, unknown4=&lt;couldn't compute location&gt;)
[/home/diego/floss/wine/dlls/ntdll/loader.c:2818] in ntdll (0xbfb7da58)
      28 0x7b863ecc __wine_kernel_init+0x67d()
[/home/diego/floss/wine/dlls/kernel32/process.c:1269] in kernel32 (0xbfb7e918)
      29 0x7bc59b05 __wine_process_init+0x156()
[/home/diego/floss/wine/dlls/ntdll/loader.c:3027] in ntdll (0xbfb7e978)
      30 0xb75f5800 wine_init+0x140(argc=0x2, argv=0xbfb7ee84, error=&quot;&quot;,
error_size=0x400) [/home/diego/floss/wine/libs/wine/loader.c:952] in
libwine.so.1 (0xbfb7e9b8)
      31 0x7bf01144 main+0x11e(argc=0x2, argv=0xbfb7ee84)
[/home/diego/floss/wine/loader/main.c:237] in &lt;wine-loader&gt; (0xbfb7ede8)
      32 0xb7416993 __libc_start_main+0xf2() in libc.so.6 (0x00000000)
----------------------------------------------------

To get some information about how get_rt_format was called I applied the
following patch to mesa:

----------------------------------------------------
    commit ccd7c55c5ea814a431d592865de490527528ba51
    Author: Diego Nieto Cid &lt;<a href="mailto:dnietoc&#64;gmail.com">dnietoc&#64;gmail.com</a>&gt;
    Date:   Thu Dec 19 19:21:22 2013 -0300

        Print format before assert.

    diff --git a/src/mesa/drivers/dri/nouveau/nv10_state_fb.c
b/src/mesa/drivers/dri/nouveau/nv10_state_fb.c
    index 87ae1d6..91b4ee7 100644
    --- a/src/mesa/drivers/dri/nouveau/nv10_state_fb.c
    +++ b/src/mesa/drivers/dri/nouveau/nv10_state_fb.c
    &#64;&#64; -47,6 +47,7 &#64;&#64; get_rt_format(gl_format format)
            case MESA_FORMAT_Z24_S8:
                    return NV10_3D_RT_FORMAT_DEPTH_Z24S8;
            default:
    +               printf(&quot;Unsupported format %d\n&quot;, format);
                    assert(0);
            }
     }
----------------------------------------------------

The output after running wine with the patched libraries now includes the
following line:

----------------------------------------------------
    Unsupported format 16
----------------------------------------------------

Debugging wine I was able to get a trace of GL calls and I wrote a little GLUT
program which succesfully reproduce the crash. It's source file is attached to
the bug report.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389325175.8bc18f8A0.7028--

--===============1888761538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1888761538==--
