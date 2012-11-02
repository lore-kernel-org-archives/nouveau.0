From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56535] Resident evil 4 with wine: crash
Date: Fri, 02 Nov 2012 13:26:49 +0000
Message-ID: <bug-56535-8800-Wu4p3gMQFB@http.bugs.freedesktop.org/>
References: <bug-56535-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1895899182=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56535-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1895899182==
Content-Type: multipart/alternative; boundary="1351862808.8a1cE830.31050"; charset="us-ascii"


--1351862808.8a1cE830.31050
Date: Fri, 2 Nov 2012 13:26:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56535

--- Comment #5 from KinG-InFeT <king.infet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
err:winediag:SECUR32_initNTLMSP ntlm_auth was not found or is outdated. Make
sure that ntlm_auth >= 3.0.25 is in your path. Usually, you can find it in the
winbind package of your distribution.
fixme:iphlpapi:NotifyAddrChange (Handle 0xffe8b0, overlapped 0xffe8bc): stub
wine: configuration in '/root/.wine' has been updated.
0035:0036: create process 'C:\Program Files\CAPCOM\resident evil
4\game.exe'/0x110738 @0x7a72ea0 (0<0>)
0035:0036: create thread I @0x7a72ea0
GNU gdb (GDB) 7.5
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i686-pc-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
0035:0036: loads DLL C:\windows\system32\KERNEL32.dll @0x7b810000 (0<0>)
0035:0036: loads DLL C:\windows\system32\ntdll.dll @0x7bc10000 (0<0>)
0035:0036: loads DLL C:\windows\system32\advapi32.dll @0x7e9b0000 (0<0>)
0035:0036: loads DLL C:\windows\system32\gdi32.dll @0x7ea20000 (0<0>)
0035:0036: loads DLL C:\windows\system32\version.dll @0x7eff0000 (0<0>)
0035:0036: loads DLL C:\windows\system32\user32.dll @0x7eb40000 (0<0>)
0035:0036: loads DLL C:\windows\system32\comctl32.dll @0x7ec90000 (0<0>)
0035:0036: loads DLL C:\windows\system32\shlwapi.dll @0x7e610000 (0<0>)
0035:0036: loads DLL C:\windows\system32\shell32.dll @0x7e690000 (0<0>)
0035:0036: loads DLL C:\windows\system32\winspool.drv @0x7e5d0000 (0<0>)
0035:0036: loads DLL C:\windows\system32\comdlg32.dll @0x7e8c0000 (0<0>)
0035:0036: loads DLL C:\windows\system32\wined3d.dll @0x7e450000 (0<0>)
0035:0036: loads DLL C:\windows\system32\d3d9.dll @0x7e590000 (0<0>)
0035:0036: loads DLL C:\windows\system32\d3dx9_30.dll @0x7e430000 (0<0>)
0035:0036: loads DLL C:\windows\system32\d3dcompiler_43.dll @0x7e330000 (0<0>)
0035:0036: loads DLL C:\windows\system32\d3dxof.dll @0x7e310000 (0<0>)
0035:0036: loads DLL C:\windows\system32\rpcrt4.dll @0x7e150000 (0<0>)
0035:0036: loads DLL C:\windows\system32\ole32.dll @0x7e1e0000 (0<0>)
0035:0036: loads DLL C:\windows\system32\d3dx9_36.dll @0x7e3b0000 (0<0>)
0035:0036: loads DLL C:\windows\system32\winex11.drv @0x7dfd0000 (0<0>)
0035:0036: loads DLL C:\windows\system32\dinput8.dll @0x7dda0000 (0<0>)
0035:0036: loads DLL C:\windows\system32\msacm32.dll @0x7dc50000 (0<0>)
0035:0036: loads DLL C:\windows\system32\winmm.dll @0x7dc80000 (0<0>)
0035:0036: loads DLL C:\windows\system32\dsound.dll @0x7dd30000 (0<0>)
0035:0036: loads DLL C:\windows\system32\imm32.dll @0x7dc30000 (0<0>)
0035:0036: loads DLL C:\windows\system32\oleaut32.dll @0x7db00000 (0<0>)
0035:0036: loads DLL C:\windows\system32\uxtheme.dll @0x7dac0000 (0<0>)
00000035:00000036: exception code=0x80000003
warning: Could not load shared library symbols for linux-gate.so.1.
Do you need "set solib-search-path" or "set sysroot"?
0x7b860bff in ExitProcess () from /usr/bin/../lib/wine/kernel32.dll.so
trace: 98 => 80
Wine-gdb> Continuing.
wine client error:39: write: Descrittore di file errato
[Inferior 1 (Remote target) exited normally]
Wine-gdb> quit

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351862808.8a1cE830.31050
Date: Fri, 2 Nov 2012 13:26:48 +0000
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
   title="NEW --- - Resident evil 4 with wine: crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56535#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Resident evil 4 with wine: crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56535">bug 56535</a>
              from <span class="vcard"><a class="email" href="mailto:king.infet&#64;gmail.com" title="KinG-InFeT &lt;king.infet&#64;gmail.com&gt;"> <span class="fn">KinG-InFeT</span></a>
</span></b>
        <pre>err:winediag:SECUR32_initNTLMSP ntlm_auth was not found or is outdated. Make
sure that ntlm_auth &gt;= 3.0.25 is in your path. Usually, you can find it in the
winbind package of your distribution.
fixme:iphlpapi:NotifyAddrChange (Handle 0xffe8b0, overlapped 0xffe8bc): stub
wine: configuration in '/root/.wine' has been updated.
0035:0036: create process 'C:\Program Files\CAPCOM\resident evil
4\game.exe'/0x110738 &#64;0x7a72ea0 (0&lt;0&gt;)
0035:0036: create thread I &#64;0x7a72ea0
GNU gdb (GDB) 7.5
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later &lt;<a href="http://gnu.org/licenses/gpl.html">http://gnu.org/licenses/gpl.html</a>&gt;
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type &quot;show copying&quot;
and &quot;show warranty&quot; for details.
This GDB was configured as &quot;i686-pc-linux-gnu&quot;.
For bug reporting instructions, please see:
&lt;<a href="http://www.gnu.org/software/gdb/bugs/">http://www.gnu.org/software/gdb/bugs/</a>&gt;.
0035:0036: loads DLL C:\windows\system32\KERNEL32.dll &#64;0x7b810000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\ntdll.dll &#64;0x7bc10000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\advapi32.dll &#64;0x7e9b0000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\gdi32.dll &#64;0x7ea20000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\version.dll &#64;0x7eff0000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\user32.dll &#64;0x7eb40000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\comctl32.dll &#64;0x7ec90000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\shlwapi.dll &#64;0x7e610000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\shell32.dll &#64;0x7e690000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\winspool.drv &#64;0x7e5d0000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\comdlg32.dll &#64;0x7e8c0000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\wined3d.dll &#64;0x7e450000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\d3d9.dll &#64;0x7e590000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\d3dx9_30.dll &#64;0x7e430000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\d3dcompiler_43.dll &#64;0x7e330000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\d3dxof.dll &#64;0x7e310000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\rpcrt4.dll &#64;0x7e150000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\ole32.dll &#64;0x7e1e0000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\d3dx9_36.dll &#64;0x7e3b0000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\winex11.drv &#64;0x7dfd0000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\dinput8.dll &#64;0x7dda0000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\msacm32.dll &#64;0x7dc50000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\winmm.dll &#64;0x7dc80000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\dsound.dll &#64;0x7dd30000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\imm32.dll &#64;0x7dc30000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\oleaut32.dll &#64;0x7db00000 (0&lt;0&gt;)
0035:0036: loads DLL C:\windows\system32\uxtheme.dll &#64;0x7dac0000 (0&lt;0&gt;)
00000035:00000036: exception code=0x80000003
warning: Could not load shared library symbols for linux-gate.so.1.
Do you need &quot;set solib-search-path&quot; or &quot;set sysroot&quot;?
0x7b860bff in ExitProcess () from /usr/bin/../lib/wine/kernel32.dll.so
trace: 98 =&gt; 80
Wine-gdb&gt; Continuing.
wine client error:39: write: Descrittore di file errato
[Inferior 1 (Remote target) exited normally]
Wine-gdb&gt; quit</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351862808.8a1cE830.31050--

--===============1895899182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1895899182==--
