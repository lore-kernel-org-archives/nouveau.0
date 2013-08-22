From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68453] New: Bad rendering (refreshes) when booting
 recent debug kernels
Date: Thu, 22 Aug 2013 22:00:56 +0000
Message-ID: <bug-68453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2017321866=="
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


--===============2017321866==
Content-Type: multipart/alternative; boundary="1377208856.c4F81.8564"; charset="us-ascii"


--1377208856.c4F81.8564
Date: Thu, 22 Aug 2013 22:00:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68453

          Priority: medium
            Bug ID: 68453
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Bad rendering (refreshes) when booting recent debug
                    kernels
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: awilliam-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Filed this downstream: https://bugzilla.redhat.com/show_bug.cgi?id=986074

But our nouveau maintainer seems to be dormant at present, so filing upstream.
Running Fedora 20 (pre-release), when I boot a non-debug kernel, my graphical
rendering is mostly fine (minus a few little buglets I've been living with for
years). When I boot a debug kernel, though, it's bad - not just sluggish, but
bad. It seems like refreshes simply don't always work completely: say, I open a
new tab in Firefox, but I can still see all the content from the previous tab
until I wait several seconds or switch tabs and switch back or scrub my  mouse
around a bit. Any kind of window-switching operation tends to show the issue.

A Fedora debug kernel build sets the following:

        @perl -pi -e 's/# CONFIG_SLUB_DEBUG_ON is not
set/CONFIG_SLUB_DEBUG_ON=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_LOCK_STAT is not set/CONFIG_LOCK_STAT=y/'
config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_STACK_USAGE is not
set/CONFIG_DEBUG_STACK_USAGE=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_SLAB is not set/CONFIG_DEBUG_SLAB=y/'
config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_MUTEXES is not
set/CONFIG_DEBUG_MUTEXES=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not
set/CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_RT_MUTEXES is not
set/CONFIG_DEBUG_RT_MUTEXES=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_LOCK_ALLOC is not
set/CONFIG_DEBUG_LOCK_ALLOC=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_PROVE_LOCKING is not
set/CONFIG_PROVE_LOCKING=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_PROVE_RCU is not set/CONFIG_PROVE_RCU=y/'
config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_SPINLOCK is not
set/CONFIG_DEBUG_SPINLOCK=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_VM is not set/CONFIG_DEBUG_VM=y/'
config-nodebug
        @perl -pi -e 's/# CONFIG_FAULT_INJECTION is not
set/CONFIG_FAULT_INJECTION=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_FAILSLAB is not set/CONFIG_FAILSLAB=y/'
config-nodebug
        @perl -pi -e 's/# CONFIG_FAIL_PAGE_ALLOC is not
set/CONFIG_FAIL_PAGE_ALLOC=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_FAIL_IO_TIMEOUT is not
set/CONFIG_FAIL_IO_TIMEOUT=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_FAIL_MAKE_REQUEST is not
set/CONFIG_FAIL_MAKE_REQUEST=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_FAIL_MMC_REQUEST is not
set/CONFIG_FAIL_MMC_REQUEST=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_FAULT_INJECTION_DEBUG_FS is not
set/CONFIG_FAULT_INJECTION_DEBUG_FS=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_FAULT_INJECTION_STACKTRACE_FILTER is not
set/CONFIG_FAULT_INJECTION_STACKTRACE_FILTER=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_SG is not set/CONFIG_DEBUG_SG=y/'
config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_WRITECOUNT is not
set/CONFIG_DEBUG_WRITECOUNT=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_OBJECTS is not
set/CONFIG_DEBUG_OBJECTS=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_OBJECTS_FREE is not
set/CONFIG_DEBUG_OBJECTS_FREE=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_OBJECTS_TIMERS is not
set/CONFIG_DEBUG_OBJECTS_TIMERS=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_OBJECTS_WORK is not
set/CONFIG_DEBUG_OBJECTS_WORK=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not
set/CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not
set/CONFIG_DEBUG_OBJECTS_RCU_HEAD=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_X86_PTDUMP is not set/CONFIG_X86_PTDUMP=y/'
config-nodebug
        @perl -pi -e 's/# CONFIG_CAN_DEBUG_DEVICES is not
set/CONFIG_CAN_DEBUG_DEVICES=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_MODULE_FORCE_UNLOAD is not
set/CONFIG_MODULE_FORCE_UNLOAD=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_SYSCTL_SYSCALL_CHECK is not
set/CONFIG_SYSCTL_SYSCALL_CHECK=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_NOTIFIERS is not
set/CONFIG_DEBUG_NOTIFIERS=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DMA_API_DEBUG is not
set/CONFIG_DMA_API_DEBUG=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_PM_TEST_SUSPEND is not
set/CONFIG_PM_TEST_SUSPEND=y/' config-generic
        @perl -pi -e 's/# CONFIG_PM_ADVANCED_DEBUG is not
set/CONFIG_PM_ADVANCED_DEBUG=y/' config-generic
        @perl -pi -e 's/# CONFIG_B43_DEBUG is not set/CONFIG_B43_DEBUG=y/'
config-generic
        @perl -pi -e 's/# CONFIG_B43LEGACY_DEBUG is not
set/CONFIG_B43LEGACY_DEBUG=y/' config-generic
        @perl -pi -e 's/# CONFIG_MMIOTRACE is not set/CONFIG_MMIOTRACE=y/'
config-nodebug
        @perl -pi -e 's/CONFIG_STRIP_ASM_SYMS=y/# CONFIG_STRIP_ASM_SYMS is not
set/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_CREDENTIALS is not
set/CONFIG_DEBUG_CREDENTIALS=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not
set/CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_ACPI_DEBUG is not set/CONFIG_ACPI_DEBUG=y/'
config-nodebug
        @perl -pi -e 's/# CONFIG_EXT4_DEBUG is not set/CONFIG_EXT4_DEBUG=y/'
config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_PERF_USE_VMALLOC is not
set/CONFIG_DEBUG_PERF_USE_VMALLOC=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_JBD2_DEBUG is not set/CONFIG_JBD2_DEBUG=y/'
config-nodebug
        @perl -pi -e 's/# CONFIG_NFSD_FAULT_INJECTION is not
set/CONFIG_NFSD_FAULT_INJECTION=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_BLK_CGROUP is not
set/CONFIG_DEBUG_BLK_CGROUP=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DRBD_FAULT_INJECTION is not
set/CONFIG_DRBD_FAULT_INJECTION=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_ATH_DEBUG is not set/CONFIG_ATH_DEBUG=y/'
config-nodebug
        @perl -pi -e 's/# CONFIG_CARL9170_DEBUGFS is not
set/CONFIG_CARL9170_DEBUGFS=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_IWLWIFI_DEVICE_TRACING is not
set/CONFIG_IWLWIFI_DEVICE_TRACING=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DMADEVICES_DEBUG is not
set/CONFIG_DMADEVICES_DEBUG=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_DMADEVICES_VDEBUG is not
set/CONFIG_DMADEVICES_VDEBUG=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_CEPH_LIB_PRETTYDEBUG is not
set/CONFIG_CEPH_LIB_PRETTYDEBUG=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_QUOTA_DEBUG is not set/CONFIG_QUOTA_DEBUG=y/'
config-nodebug
        @perl -pi -e 's/# CONFIG_KGDB_KDB is not set/CONFIG_KGDB_KDB=y/'
config-nodebug
        @perl -pi -e 's/# CONFIG_KDB_KEYBOARD is not
set/CONFIG_KDB_KEYBOARD=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_CPU_NOTIFIER_ERROR_INJECT is not
set/CONFIG_CPU_NOTIFIER_ERROR_INJECT=m/' config-nodebug
        @perl -pi -e 's/# CONFIG_DEBUG_PER_CPU_MAPS is not
set/CONFIG_DEBUG_PER_CPU_MAPS=y/' config-nodebug
        @perl -pi -e 's/# CONFIG_USB_UAS is not set/CONFIG_USB_UAS=m/'
config-generic

So that's the difference we're looking at. This is reproducible up to
kernel-3.11.0-0.rc6.git1.2.fc20.x86_64 .

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377208856.c4F81.8564
Date: Thu, 22 Aug 2013 22:00:56 +0000
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
   title="NEW --- - Bad rendering (refreshes) when booting recent debug kernels"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68453">68453</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Bad rendering (refreshes) when booting recent debug kernels
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>awilliam&#64;redhat.com
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
        <pre>Filed this downstream: <a href="https://bugzilla.redhat.com/show_bug.cgi?id=986074">https://bugzilla.redhat.com/show_bug.cgi?id=986074</a>

But our nouveau maintainer seems to be dormant at present, so filing upstream.
Running Fedora 20 (pre-release), when I boot a non-debug kernel, my graphical
rendering is mostly fine (minus a few little buglets I've been living with for
years). When I boot a debug kernel, though, it's bad - not just sluggish, but
bad. It seems like refreshes simply don't always work completely: say, I open a
new tab in Firefox, but I can still see all the content from the previous tab
until I wait several seconds or switch tabs and switch back or scrub my  mouse
around a bit. Any kind of window-switching operation tends to show the issue.

A Fedora debug kernel build sets the following:

        &#64;perl -pi -e 's/# CONFIG_SLUB_DEBUG_ON is not
set/CONFIG_SLUB_DEBUG_ON=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_LOCK_STAT is not set/CONFIG_LOCK_STAT=y/'
config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_STACK_USAGE is not
set/CONFIG_DEBUG_STACK_USAGE=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_SLAB is not set/CONFIG_DEBUG_SLAB=y/'
config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_MUTEXES is not
set/CONFIG_DEBUG_MUTEXES=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not
set/CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_RT_MUTEXES is not
set/CONFIG_DEBUG_RT_MUTEXES=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_LOCK_ALLOC is not
set/CONFIG_DEBUG_LOCK_ALLOC=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_PROVE_LOCKING is not
set/CONFIG_PROVE_LOCKING=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_PROVE_RCU is not set/CONFIG_PROVE_RCU=y/'
config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_SPINLOCK is not
set/CONFIG_DEBUG_SPINLOCK=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_VM is not set/CONFIG_DEBUG_VM=y/'
config-nodebug
        &#64;perl -pi -e 's/# CONFIG_FAULT_INJECTION is not
set/CONFIG_FAULT_INJECTION=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_FAILSLAB is not set/CONFIG_FAILSLAB=y/'
config-nodebug
        &#64;perl -pi -e 's/# CONFIG_FAIL_PAGE_ALLOC is not
set/CONFIG_FAIL_PAGE_ALLOC=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_FAIL_IO_TIMEOUT is not
set/CONFIG_FAIL_IO_TIMEOUT=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_FAIL_MAKE_REQUEST is not
set/CONFIG_FAIL_MAKE_REQUEST=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_FAIL_MMC_REQUEST is not
set/CONFIG_FAIL_MMC_REQUEST=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_FAULT_INJECTION_DEBUG_FS is not
set/CONFIG_FAULT_INJECTION_DEBUG_FS=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_FAULT_INJECTION_STACKTRACE_FILTER is not
set/CONFIG_FAULT_INJECTION_STACKTRACE_FILTER=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_SG is not set/CONFIG_DEBUG_SG=y/'
config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_WRITECOUNT is not
set/CONFIG_DEBUG_WRITECOUNT=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_OBJECTS is not
set/CONFIG_DEBUG_OBJECTS=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_OBJECTS_FREE is not
set/CONFIG_DEBUG_OBJECTS_FREE=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_OBJECTS_TIMERS is not
set/CONFIG_DEBUG_OBJECTS_TIMERS=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_OBJECTS_WORK is not
set/CONFIG_DEBUG_OBJECTS_WORK=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not
set/CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not
set/CONFIG_DEBUG_OBJECTS_RCU_HEAD=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_X86_PTDUMP is not set/CONFIG_X86_PTDUMP=y/'
config-nodebug
        &#64;perl -pi -e 's/# CONFIG_CAN_DEBUG_DEVICES is not
set/CONFIG_CAN_DEBUG_DEVICES=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_MODULE_FORCE_UNLOAD is not
set/CONFIG_MODULE_FORCE_UNLOAD=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_SYSCTL_SYSCALL_CHECK is not
set/CONFIG_SYSCTL_SYSCALL_CHECK=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_NOTIFIERS is not
set/CONFIG_DEBUG_NOTIFIERS=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DMA_API_DEBUG is not
set/CONFIG_DMA_API_DEBUG=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_PM_TEST_SUSPEND is not
set/CONFIG_PM_TEST_SUSPEND=y/' config-generic
        &#64;perl -pi -e 's/# CONFIG_PM_ADVANCED_DEBUG is not
set/CONFIG_PM_ADVANCED_DEBUG=y/' config-generic
        &#64;perl -pi -e 's/# CONFIG_B43_DEBUG is not set/CONFIG_B43_DEBUG=y/'
config-generic
        &#64;perl -pi -e 's/# CONFIG_B43LEGACY_DEBUG is not
set/CONFIG_B43LEGACY_DEBUG=y/' config-generic
        &#64;perl -pi -e 's/# CONFIG_MMIOTRACE is not set/CONFIG_MMIOTRACE=y/'
config-nodebug
        &#64;perl -pi -e 's/CONFIG_STRIP_ASM_SYMS=y/# CONFIG_STRIP_ASM_SYMS is not
set/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_CREDENTIALS is not
set/CONFIG_DEBUG_CREDENTIALS=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not
set/CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_ACPI_DEBUG is not set/CONFIG_ACPI_DEBUG=y/'
config-nodebug
        &#64;perl -pi -e 's/# CONFIG_EXT4_DEBUG is not set/CONFIG_EXT4_DEBUG=y/'
config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_PERF_USE_VMALLOC is not
set/CONFIG_DEBUG_PERF_USE_VMALLOC=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_JBD2_DEBUG is not set/CONFIG_JBD2_DEBUG=y/'
config-nodebug
        &#64;perl -pi -e 's/# CONFIG_NFSD_FAULT_INJECTION is not
set/CONFIG_NFSD_FAULT_INJECTION=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_BLK_CGROUP is not
set/CONFIG_DEBUG_BLK_CGROUP=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DRBD_FAULT_INJECTION is not
set/CONFIG_DRBD_FAULT_INJECTION=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_ATH_DEBUG is not set/CONFIG_ATH_DEBUG=y/'
config-nodebug
        &#64;perl -pi -e 's/# CONFIG_CARL9170_DEBUGFS is not
set/CONFIG_CARL9170_DEBUGFS=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_IWLWIFI_DEVICE_TRACING is not
set/CONFIG_IWLWIFI_DEVICE_TRACING=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DMADEVICES_DEBUG is not
set/CONFIG_DMADEVICES_DEBUG=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DMADEVICES_VDEBUG is not
set/CONFIG_DMADEVICES_VDEBUG=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_CEPH_LIB_PRETTYDEBUG is not
set/CONFIG_CEPH_LIB_PRETTYDEBUG=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_QUOTA_DEBUG is not set/CONFIG_QUOTA_DEBUG=y/'
config-nodebug
        &#64;perl -pi -e 's/# CONFIG_KGDB_KDB is not set/CONFIG_KGDB_KDB=y/'
config-nodebug
        &#64;perl -pi -e 's/# CONFIG_KDB_KEYBOARD is not
set/CONFIG_KDB_KEYBOARD=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_CPU_NOTIFIER_ERROR_INJECT is not
set/CONFIG_CPU_NOTIFIER_ERROR_INJECT=m/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_DEBUG_PER_CPU_MAPS is not
set/CONFIG_DEBUG_PER_CPU_MAPS=y/' config-nodebug
        &#64;perl -pi -e 's/# CONFIG_USB_UAS is not set/CONFIG_USB_UAS=m/'
config-generic

So that's the difference we're looking at. This is reproducible up to
kernel-3.11.0-0.rc6.git1.2.fc20.x86_64 .</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377208856.c4F81.8564--

--===============2017321866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2017321866==--
