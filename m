From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26986] TNT2 crashed on startup with 2.6.34-rc1
Date: Wed, 10 Mar 2010 10:46:57 -0800 (PST)
Message-ID: <20100310184657.617111300E0@annarchy.freedesktop.org>
References: <bug-26986-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26986-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26986





--- Comment #7 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org>  2010-03-10 10:46:56 PST ---
Ok, setting AGP aperture size in BIOS down to 4mb helped!



guest@slax:~$ dmesg | grep gart 
Linux agpgart interface v0.103
agpgart: Detected VIA KT266/KY266x/KT333 chipset
agpgart-via 0000:00:00.0: AGP aperture is 4M @ 0xe0000000
agpgart-via 0000:00:00.0: AGP 2.0 bridge
agpgart-via 0000:00:00.0: putting AGP V2 device into 4x mode

guest@slax:~$ dmesg | grep apert
agpgart-via 0000:00:00.0: AGP aperture is 4M @ 0xe0000000
[drm] nouveau 0000:01:00.0: 4 MiB GART (aperture)


guest@slax:~$ cat /usr/X11/var/log/Xorg.0.log | grep GART
[    58.010] (II) NOUVEAU(0): GART: 4MiB available
[    58.099] (II) NOUVEAU(0): GART: Allocated 3MiB as a scratch buffer


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
