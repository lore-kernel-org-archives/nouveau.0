From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 53535] New: G84M [Quadro NVS 140M] X crash after
 waking up from suspend: Process /usr/bin/Xorg was killed by signal 6
 (SIGABRT)
Date: Wed, 15 Aug 2012 10:49:54 +0000
Message-ID: <bug-53535-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=53535

             Bug #: 53535
           Summary: G84M [Quadro NVS 140M] X crash after waking up from
                    suspend: Process /usr/bin/Xorg was killed by signal 6
                    (SIGABRT)
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: reklov-EMRzualFZlQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 65596
  --> https://bugs.freedesktop.org/attachment.cgi?id=65596
Xorg backtrace

After waking up from suspend and starting firefox X crashes.

cmdline: /usr/bin/Xorg :0 -background none -logverbose 7 -auth
/var/run/gdm/auth-for-gdm-u1CSc3/database -seat seat0 -nolisten tcp vt1

Packages:
kernel.x86_64                      3.5.1-1.fc17     
xorg-x11-drv-ast.x86_64            0.93.9-6.fc17    
xorg-x11-drv-ati.x86_64            6.14.4-6.20120602git930760942.fc17

xorg-x11-drv-cirrus.x86_64         1.3.2-19.fc17    
xorg-x11-drv-dummy.x86_64          0.3.5-4.fc17     
xorg-x11-drv-evdev.x86_64          2.7.0-2.fc17     
xorg-x11-drv-fbdev.x86_64          0.4.2-8.fc17     
xorg-x11-drv-intel.x86_64          2.20.1-1.fc17    
xorg-x11-drv-mga.x86_64            1.4.13-19.20120104git9223c44a7.fc17

xorg-x11-drv-nouveau.x86_64        1:0.0.16-37.20120306gitf5d1cd2.fc17

xorg-x11-drv-nouveau-debuginfo.x86_64
                                   1:0.0.16-37.20120306gitf5d1cd2.fc17

xorg-x11-drv-openchrome.x86_64     0.2.906-1.fc17   
xorg-x11-drv-qxl.x86_64            0.0.22-0.fc17    
xorg-x11-drv-synaptics.x86_64      1.6.2-1.fc17     
xorg-x11-drv-vesa.x86_64           2.3.1-1.fc17     
xorg-x11-drv-vmmouse.x86_64        12.8.0-1.fc17    
xorg-x11-drv-vmware.x86_64         12.0.2-1.fc17    
xorg-x11-drv-void.x86_64           1.4.0-8.fc17     
xorg-x11-drv-wacom.x86_64          0.14.0-2.fc17    
xorg-x11-font-utils.x86_64         1:7.5-7.fc17     
xorg-x11-fonts-misc.noarch         7.5-5.fc17       
xorg-x11-server-Xephyr.x86_64      1.12.2-4.fc17    
xorg-x11-server-Xorg.x86_64        1.12.2-4.fc17    
xorg-x11-server-common.x86_64      1.12.2-4.fc17    
xorg-x11-server-debuginfo.x86_64   1.12.2-4.fc17    
xorg-x11-server-utils.x86_64       7.5-12.fc17      
xorg-x11-utils.x86_64              7.5-6.fc17       
xorg-x11-xauth.x86_64              1:1.0.7-1.fc17   
xorg-x11-xinit.x86_64              1.3.2-5.fc17     
xorg-x11-xkb-utils.x86_64          7.5-6.fc17

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
