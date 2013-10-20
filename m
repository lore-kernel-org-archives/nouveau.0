From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69928] [NVAA] Boot of linux kernel 3.12-rc2 hangs
Date: Sun, 20 Oct 2013 14:07:22 +0000
Message-ID: <bug-69928-8800-63o8vcDBGm@http.bugs.freedesktop.org/>
References: <bug-69928-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0106874966=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69928-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0106874966==
Content-Type: multipart/alternative; boundary="1382278042.e724FB01.12485"; charset="us-ascii"


--1382278042.e724FB01.12485
Date: Sun, 20 Oct 2013 14:07:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69928

--- Comment #15 from dirkneukirchen-S0/GAf8tV78@public.gmane.org ---
mmiotrace of xinit "sleep 10" is too big (>3000kB xz compressed)

System is a clean Ubuntu 13.10 with Nvidia 325.15 with the needed small patch


--- a/kernel/nv-linux.h
+++ b/kernel/nv-linux.h
@@ -957,7 +957,11 @@ static inline int nv_execute_on_all_cpus
 #endif

 #if !defined(NV_VMWARE)
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 11, 0)
+#define NV_NUM_PHYSPAGES                get_num_physpages()
+#else
 #define NV_NUM_PHYSPAGES                num_physpages
+#endif
 #define NV_GET_CURRENT_PROCESS()        current->tgid
 #define NV_IN_ATOMIC()                  in_atomic()
 #define NV_LOCAL_BH_DISABLE()           local_bh_disable()


here is the link:
mmiotrace_xinit_sleep10.log.xz (3.0 MB)
https://mega.co.nz/#!2hRgDRqb!BwPChW79v7SdYK0rvxbtT3EPmHVM300Flqfuw65Xpbs

without disabling of vesafb and enabling of vga console (see kernel cmdline in
comment above) there will be lockups after logging into X (there is a NVRM
warning about that in dmesg)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382278042.e724FB01.12485
Date: Sun, 20 Oct 2013 14:07:22 +0000
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
   title="NEW --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69928#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69928">bug 69928</a>
              from <span class="vcard"><a class="email" href="mailto:dirkneukirchen&#64;web.de" title="dirkneukirchen&#64;web.de">dirkneukirchen&#64;web.de</a>
</span></b>
        <pre>mmiotrace of xinit &quot;sleep 10&quot; is too big (&gt;3000kB xz compressed)

System is a clean Ubuntu 13.10 with Nvidia 325.15 with the needed small patch


--- a/kernel/nv-linux.h
+++ b/kernel/nv-linux.h
&#64;&#64; -957,7 +957,11 &#64;&#64; static inline int nv_execute_on_all_cpus
 #endif

 #if !defined(NV_VMWARE)
+#if LINUX_VERSION_CODE &gt;= KERNEL_VERSION(3, 11, 0)
+#define NV_NUM_PHYSPAGES                get_num_physpages()
+#else
 #define NV_NUM_PHYSPAGES                num_physpages
+#endif
 #define NV_GET_CURRENT_PROCESS()        current-&gt;tgid
 #define NV_IN_ATOMIC()                  in_atomic()
 #define NV_LOCAL_BH_DISABLE()           local_bh_disable()


here is the link:
mmiotrace_xinit_sleep10.log.xz (3.0 MB)
<a href="https://mega.co.nz/#!2hRgDRqb!BwPChW79v7SdYK0rvxbtT3EPmHVM300Flqfuw65Xpbs">https://mega.co.nz/#!2hRgDRqb!BwPChW79v7SdYK0rvxbtT3EPmHVM300Flqfuw65Xpbs</a>

without disabling of vesafb and enabling of vga console (see kernel cmdline in
comment above) there will be lockups after logging into X (there is a NVRM
warning about that in dmesg)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382278042.e724FB01.12485--

--===============0106874966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0106874966==--
