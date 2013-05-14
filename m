From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Tue, 14 May 2013 14:46:11 +0000
Message-ID: <bug-59069-8800-bqIgqhOtLx@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0230016892=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0230016892==
Content-Type: multipart/alternative; boundary="1368542771.7abD8f53.12755"; charset="us-ascii"


--1368542771.7abD8f53.12755
Date: Tue, 14 May 2013 14:46:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59069

--- Comment #24 from ceenturion-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Hello,
I have a similar problem.
Everything seems ok until I launch Xbmc (full screen).
I then have lots of "ttm_validate" messges on syslog, and then display becomes
crazy.

May  6 19:39:16 mercure dbus[725]: [system] Successfully activated service
'org.freedesktop.UDisks'
May  6 19:39:24 mercure kernel: [ 9001.240755] nouveau E[     DRM] fail
ttm_validate
May  6 19:39:24 mercure kernel: [ 9001.240765] nouveau E[     DRM] validate
vram_list
May  6 19:39:24 mercure kernel: [ 9001.240781] nouveau E[     DRM] validate:
-12
May  6 19:39:26 mercure kernel: [ 9004.097548] nouveau E[     DRM] fail
ttm_validate
May  6 19:39:26 mercure kernel: [ 9004.097558] nouveau E[     DRM] validate
vram_list
May  6 19:39:26 mercure kernel: [ 9004.097577] nouveau E[     DRM] validate:
-12
May  6 19:39:30 mercure kernel: [ 9007.536331] nouveau E[     DRM] fail
ttm_validate
May  6 19:39:30 mercure kernel: [ 9007.536340] nouveau E[     DRM] validate
vram_list
May  6 19:39:30 mercure kernel: [ 9007.536359] nouveau E[     DRM] validate:
-12
May  6 19:39:33 mercure kernel: [ 9010.661699] nouveau E[     DRM] fail
ttm_validate
May  6 19:39:33 mercure kernel: [ 9010.661710] nouveau E[     DRM] validate
vram_list
May  6 19:39:33 mercure kernel: [ 9010.661729] nouveau E[     DRM] validate:
-12
...
May  6 19:42:15 mercure kernel: [ 9173.135847] BUG: Bad page map in process
xbmc.bin  pte:800000002bc20067 pmd:21da7067
May  6 19:42:15 mercure kernel: [ 9173.135862] page:ffffea0000af0800 count:-1
mapcount:-1 mapping:          (null) index:0x0
May  6 19:42:15 mercure kernel: [ 9173.135866] page flags:
0x14(referenced|dirty)
May  6 19:42:15 mercure kernel: [ 9173.135878] addr:00007f30f007f000
vm_flags:002000fb anon_vma:          (null) mapping:ffff880036790e48 index:80
May  6 19:42:15 mercure kernel: [ 9173.135890] vma->vm_ops->fault:
shmem_fault+0x0/0xa0
May  6 19:42:15 mercure kernel: [ 9173.135896] vma->vm_file->f_op->mmap:
shmem_mmap+0x0/0x30
May  6 19:42:15 mercure kernel: [ 9173.135903] Pid: 4223, comm: xbmc.bin
Tainted: GF            3.8.0-19-generic #29-Ubuntu
May  6 19:42:15 mercure kernel: [ 9173.135907] Call Trace:
May  6 19:42:15 mercure kernel: [ 9173.135922]  [<ffffffff8115477d>]
print_bad_pte+0x1dd/0x250
May  6 19:42:15 mercure kernel: [ 9173.135930]  [<ffffffff81156f62>]
unmap_page_range+0x692/0x750
May  6 19:42:15 mercure kernel: [ 9173.135939]  [<ffffffff8105fb8a>] ?
current_fs_time+0x1a/0x60
May  6 19:42:15 mercure kernel: [ 9173.135947]  [<ffffffff81155e73>] ?
do_wp_page+0x393/0x7f0
May  6 19:42:15 mercure kernel: [ 9173.135955]  [<ffffffff811570aa>]
unmap_single_vma+0x8a/0x100
May  6 19:42:15 mercure kernel: [ 9173.135962]  [<ffffffff81157909>]
unmap_vmas+0x49/0x90
May  6 19:42:15 mercure kernel: [ 9173.135970]  [<ffffffff8115c894>]
unmap_region+0xa4/0x120
May  6 19:42:15 mercure kernel: [ 9173.135979]  [<ffffffff8115ebca>]
do_munmap+0x2ba/0x410
May  6 19:42:15 mercure kernel: [ 9173.135987]  [<ffffffff8115ed6e>]
vm_munmap+0x4e/0x70
May  6 19:42:15 mercure kernel: [ 9173.135994]  [<ffffffff8115fc4b>]
sys_munmap+0x2b/0x40
May  6 19:42:15 mercure kernel: [ 9173.136005]  [<ffffffff816d379d>]
system_call_fastpath+0x1a/0x1f

I am using:
Xubuntu 13.04  x86_64
Kernel 3.8.0-19-generic
xserver-xorg  1:7.7+1ubuntu4

00:05.0 VGA compatible controller: NVIDIA Corporation C51PV [GeForce 6150] (rev
a2) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. A8N-VM CSM
        Flags: bus master, 66MHz, fast devsel, latency 0, IRQ 16
        Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e0000000 (64-bit, prefetchable) [size=256M]
        Memory at fc000000 (64-bit, non-prefetchable) [size=16M]
        [virtual] Expansion ROM at 40000000 [disabled] [size=128K]
        Capabilities: [48] Power Management version 2
        Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
        Kernel driver in use: nouveau             

Regards

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368542771.7abD8f53.12755
Date: Tue, 14 May 2013 14:46:11 +0000
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
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
              from <span class="vcard"><a class="email" href="mailto:ceenturion&#64;gmail.com" title="ceenturion&#64;gmail.com">ceenturion&#64;gmail.com</a>
</span></b>
        <pre>Hello,
I have a similar problem.
Everything seems ok until I launch Xbmc (full screen).
I then have lots of &quot;ttm_validate&quot; messges on syslog, and then display becomes
crazy.

May  6 19:39:16 mercure dbus[725]: [system] Successfully activated service
'org.freedesktop.UDisks'
May  6 19:39:24 mercure kernel: [ 9001.240755] nouveau E[     DRM] fail
ttm_validate
May  6 19:39:24 mercure kernel: [ 9001.240765] nouveau E[     DRM] validate
vram_list
May  6 19:39:24 mercure kernel: [ 9001.240781] nouveau E[     DRM] validate:
-12
May  6 19:39:26 mercure kernel: [ 9004.097548] nouveau E[     DRM] fail
ttm_validate
May  6 19:39:26 mercure kernel: [ 9004.097558] nouveau E[     DRM] validate
vram_list
May  6 19:39:26 mercure kernel: [ 9004.097577] nouveau E[     DRM] validate:
-12
May  6 19:39:30 mercure kernel: [ 9007.536331] nouveau E[     DRM] fail
ttm_validate
May  6 19:39:30 mercure kernel: [ 9007.536340] nouveau E[     DRM] validate
vram_list
May  6 19:39:30 mercure kernel: [ 9007.536359] nouveau E[     DRM] validate:
-12
May  6 19:39:33 mercure kernel: [ 9010.661699] nouveau E[     DRM] fail
ttm_validate
May  6 19:39:33 mercure kernel: [ 9010.661710] nouveau E[     DRM] validate
vram_list
May  6 19:39:33 mercure kernel: [ 9010.661729] nouveau E[     DRM] validate:
-12
...
May  6 19:42:15 mercure kernel: [ 9173.135847] BUG: Bad page map in process
xbmc.bin  pte:800000002bc20067 pmd:21da7067
May  6 19:42:15 mercure kernel: [ 9173.135862] page:ffffea0000af0800 count:-1
mapcount:-1 mapping:          (null) index:0x0
May  6 19:42:15 mercure kernel: [ 9173.135866] page flags:
0x14(referenced|dirty)
May  6 19:42:15 mercure kernel: [ 9173.135878] addr:00007f30f007f000
vm_flags:002000fb anon_vma:          (null) mapping:ffff880036790e48 index:80
May  6 19:42:15 mercure kernel: [ 9173.135890] vma-&gt;vm_ops-&gt;fault:
shmem_fault+0x0/0xa0
May  6 19:42:15 mercure kernel: [ 9173.135896] vma-&gt;vm_file-&gt;f_op-&gt;mmap:
shmem_mmap+0x0/0x30
May  6 19:42:15 mercure kernel: [ 9173.135903] Pid: 4223, comm: xbmc.bin
Tainted: GF            3.8.0-19-generic #29-Ubuntu
May  6 19:42:15 mercure kernel: [ 9173.135907] Call Trace:
May  6 19:42:15 mercure kernel: [ 9173.135922]  [&lt;ffffffff8115477d&gt;]
print_bad_pte+0x1dd/0x250
May  6 19:42:15 mercure kernel: [ 9173.135930]  [&lt;ffffffff81156f62&gt;]
unmap_page_range+0x692/0x750
May  6 19:42:15 mercure kernel: [ 9173.135939]  [&lt;ffffffff8105fb8a&gt;] ?
current_fs_time+0x1a/0x60
May  6 19:42:15 mercure kernel: [ 9173.135947]  [&lt;ffffffff81155e73&gt;] ?
do_wp_page+0x393/0x7f0
May  6 19:42:15 mercure kernel: [ 9173.135955]  [&lt;ffffffff811570aa&gt;]
unmap_single_vma+0x8a/0x100
May  6 19:42:15 mercure kernel: [ 9173.135962]  [&lt;ffffffff81157909&gt;]
unmap_vmas+0x49/0x90
May  6 19:42:15 mercure kernel: [ 9173.135970]  [&lt;ffffffff8115c894&gt;]
unmap_region+0xa4/0x120
May  6 19:42:15 mercure kernel: [ 9173.135979]  [&lt;ffffffff8115ebca&gt;]
do_munmap+0x2ba/0x410
May  6 19:42:15 mercure kernel: [ 9173.135987]  [&lt;ffffffff8115ed6e&gt;]
vm_munmap+0x4e/0x70
May  6 19:42:15 mercure kernel: [ 9173.135994]  [&lt;ffffffff8115fc4b&gt;]
sys_munmap+0x2b/0x40
May  6 19:42:15 mercure kernel: [ 9173.136005]  [&lt;ffffffff816d379d&gt;]
system_call_fastpath+0x1a/0x1f

I am using:
Xubuntu 13.04  x86_64
Kernel 3.8.0-19-generic
xserver-xorg  1:7.7+1ubuntu4

00:05.0 VGA compatible controller: NVIDIA Corporation C51PV [GeForce 6150] (rev
a2) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. A8N-VM CSM
        Flags: bus master, 66MHz, fast devsel, latency 0, IRQ 16
        Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e0000000 (64-bit, prefetchable) [size=256M]
        Memory at fc000000 (64-bit, non-prefetchable) [size=16M]
        [virtual] Expansion ROM at 40000000 [disabled] [size=128K]
        Capabilities: [48] Power Management version 2
        Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
        Kernel driver in use: nouveau             

Regards</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368542771.7abD8f53.12755--

--===============0230016892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0230016892==--
