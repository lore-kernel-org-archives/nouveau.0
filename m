From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13689] New: nouveau is much slower than nv with
	flash player
Date: Sun, 16 Dec 2007 12:43:45 -0800 (PST)
Message-ID: <bug-13689-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=13689

           Summary: nouveau is much slower than nv with flash player
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: castet.matthieu-GANU6spQydw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hi everybody,

watching http://toowam.france3.fr/test/casse-noisette/ with adobe flash player
is very slow with nouveau. On my nv17 on a athlon XP1800+, 46.1091 % is eaten
by nouveau [1] (the guilty seems NVDownloadFromScreen [3]).
With nv, eat only 0.0254%. [2]

This mean using nouveau make impossible to watch this flash animation.

[1]
    71613 46.1091 nouveau_drv.so
    56841 36.5979 libflashplayer.so
     8394  5.4046 libpixman-1.so.0.9.6
     7742  4.9848 libc-2.7.so
     3291  2.1190 librt-2.7.so
     2863  1.8434 Xorg
        CPU_CLK_UNHALT...|
          samples|      %|
        ------------------
             2854 99.6856 Xorg
                9  0.3144 [vdso] (tgid:5681 range:0xa7eee000-0xa7eef000)
      971  0.6252 libexa.so

[2]
   119004 75.4494 libflashplayer.so
    16821 10.6646 libpixman-1.so.0.9.6
    16404 10.4002 libc-2.7.so
     1123  0.7120 Xorg
[...]
       40  0.0254 nv_drv.so

[3]
                symbol name
71147    45.4564  nv_exa.c:437                nouveau_drv.so          
nouveau_drv.so           NVDownloadFromScreen
57004    36.4203  (no location information)   libflashplayer.so       
libflashplayer.so        (no symbols)
8468      5.4103  (no location information)   libpixman-1.so.0.9.6    
libpixman-1.so.0.9.6     (no symbols)
7718      4.9311  (no location information)   libc-2.7.so             
libc-2.7.so              (no symbols)
4757      3.0393  nv_exa.c:608                nouveau_drv.so          
nouveau_drv.so           NVUploadToScreen
2167      1.3845  (no location information)   Xorg                     Xorg    
                (no symbols)
940       0.6006  (no location information)   librt-2.7.so            
librt-2.7.so             (no symbols)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
