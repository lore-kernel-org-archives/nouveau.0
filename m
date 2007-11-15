From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13257] New: using nouveau on NV17 kills the KDE VNC
	server
Date: Thu, 15 Nov 2007 08:24:45 -0800 (PST)
Message-ID: <bug-13257-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=13257

           Summary: using nouveau on NV17 kills the KDE VNC server
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: debian-E6TheL+NHo3k1uMJSBkQmQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


using nouveau on NV17 kills the KDE VNC server

I connect to a distant desktop using VNC. The environment is KDE and I use its
VNC server, krfb.

The adapter is as following:

  01:00.0 VGA compatible controller: nVidia Corporation NV17 [GeForce4 420 Go]
(rev a3)

Using nv, I used to connect and disconnect several times a day.

Using nouveau, I can only connect once. The second time, vncviewer fails.

First time
----------

VNC Viewer Free Edition 4.1.1 for X - built Sep 10 2007 17:17:04
Copyright (C) 2002-2005 RealVNC Ltd.
See http://www.realvnc.com for information on VNC.

Thu Nov 15 17:23:59 2007
 CConn:       connected to host localhost port 5599

Thu Nov 15 17:24:01 2007
 CConnection: Server supports RFB protocol version 3.3
 CConnection: Using RFB protocol version 3.3
 TXImage:     Using default colormap and visual, TrueColor, depth 24.
 CConn:       Using pixel format depth 6 (8bpp) rgb222
 CConn:       Using ZRLE encoding


Second time
-----------

VNC Viewer Free Edition 4.1.1 for X - built Sep 10 2007 17:17:04
Copyright (C) 2002-2005 RealVNC Ltd.
See http://www.realvnc.com for information on VNC.

Thu Nov 15 17:25:12 2007
 CConn:       connected to host localhost port 5599
 main:        End of stream


I only close the vncviewer window between the tries.

I tried "-log *:stdout:100" to get maximum information but nothing more is
printed.

Nothing is printed in syslog nor Xorg.0.log at the moment I try.

Last ouput of syslog is:

Nov 15 17:03:49 ourson kernel: [54925.848000] [drm] nouveau_fifo_free: freeing
fifo 1
Nov 15 17:03:51 ourson kernel: [54926.684000] [drm:nouveau_fifo_free] *ERROR*
Failed to idle channel 1 before destroy.Prepare for strangeness..
Nov 15 17:03:51 ourson kernel: [54926.684000] [drm] cleanning a channel with
graph in current context
Nov 15 17:03:51 ourson kernel: [54926.684000] [drm] nouveau_fifo_free: freeing
fifo 0
Nov 15 17:03:51 ourson kernel: [54927.524000] [drm:nouveau_fifo_free] *ERROR*
Failed to idle channel 0 before destroy.Prepare for strangeness..
Nov 15 17:05:09 ourson NetworkManager: <info>  Updating allowed wireless
network lists.
Nov 15 17:05:10 ourson NetworkManager: <WARN>  nm_dbus_get_networks_cb(): error
received: org.freedesktop.NetworkManagerInfo.NoNetworks -
org.freedesktop.NetworkManagerInfo.NoNetworks.
Nov 15 17:17:02 ourson /USR/SBIN/CRON[14947]: (root) CMD (   cd / && run-parts
--report /etc/cron.hourly)
Nov 15 17:22:10 ourson kernel: [56028.228000] agpgart: Found an AGP 2.0
compliant device at 0000:00:00.0.
Nov 15 17:22:10 ourson kernel: [56028.228000] agpgart: Putting AGP V2 device at
0000:00:00.0 into 4x mode
Nov 15 17:22:10 ourson kernel: [56028.228000] agpgart: Putting AGP V2 device at
0000:01:00.0 into 4x mode
Nov 15 17:22:10 ourson kernel: [56028.308000] [drm] Allocating FIFO number 0
Nov 15 17:22:10 ourson kernel: [56028.308000] [drm] nouveau_fifo_alloc:
initialised FIFO 0
Nov 15 17:22:10 ourson kernel: [56028.308000] [drm] Allocating FIFO number 1
Nov 15 17:22:10 ourson kernel: [56028.308000] [drm] nouveau_fifo_alloc:
initialised FIFO 1
Nov 15 17:22:34 ourson NetworkManager: <info>  Updating allowed wireless
network lists.
Nov 15 17:22:34 ourson NetworkManager: <WARN>  nm_dbus_get_networks_cb(): error
received: org.freedesktop.NetworkManagerInfo.NoNetworks -
org.freedesktop.NetworkManagerInfo.NoNetworks.

I have a nice .xsession-errors that I'll attach afterwards.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
