From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54910] New: Problems with nouveau and Gforce 2MX
Date: Fri, 14 Sep 2012 08:39:56 +0000
Message-ID: <bug-54910-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=54910

             Bug #: 54910
           Summary: Problems with nouveau and Gforce 2MX
    Classification: Unclassified
           Product: Mesa
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: klxout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


Created attachment 67143
  --> https://bugs.freedesktop.org/attachment.cgi?id=67143
logs dmes, Xorg, lspci -v

Hello,

I have installed Debian 6 (Squeeze) and 7 (wheezy) with a nouveau and Xorg
doesn't work correctly when I try to enter in Gnome. Appears a login but after
enter user/password hangs on and nothing appears

I have attached dmes logs and Xorg logs, and lspci -v

We are using a Pentium 4 with Gforce 2 MX. 
With Debian 5 (Lenny) and without nouveau all is working correctly

There are many error in logs, like:


[ 1484.279058] [drm] nouveau 0000:01:00.0: PGRAPH - ch 2/3 class 0x0062 mthd
0x0288 data 0x20042000
[ 1484.279064] [drm] nouveau 0000:01:00.0: PGRAPH - (unknown bits 0x00000010)
nsource: nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 1484.279072] [drm] nouveau 0000:01:00.0: PGRAPH - ch 2/3 class 0x0062 mthd
0x028c data 0x20001400
[ 1484.279078] [drm] nouveau 0000:01:00.0: PGRAPH - (unknown bits 0x00000010)
nsource: nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 1484.279087] [drm] nouveau 0000:01:00.0: PGRAPH - ch 2/3 class 0x0062 mthd
0x0228 data 0x00000000
[ 1484.279093] [drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: ILLEGAL_MTHD
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 1484.279102] [drm] nouveau 0000:01:00.0: PGRAPH - ch 2/3 class 0x0062 mthd
0x0d04 data 0x00002032
[ 1484.279109] [drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: ILLEGAL_MTHD
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 1484.279118] [drm] nouveau 0000:01:00.0: PGRAPH - ch 2/3 class 0x0062 mthd
0x0d0c data 0x00002044
[ 1484.279124] [drm] nouveau 0000:01:00.0: PGRAPH - ERROR nsource: ILLEGAL_MTHD
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 1484.279133] [drm] nouveau 0000:01:00.0: PGRAPH - ch 2/3 class 0x0062 mthd
0x0d14 data 0x00000002


Where is the problem?

Thanks

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
